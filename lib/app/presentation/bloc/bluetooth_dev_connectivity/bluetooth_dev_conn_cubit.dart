import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';

part 'bluetooth_dev_conn_cubit.freezed.dart';

@injectable
class BluetoothDevConCubit extends AppBaseCubit<BluetoothDevConState> {
  BluetoothDevConCubit() : super(BluetoothDevConState.initial());

  void scanDevices() => _startListening();
  
  StreamSubscription<BluetoothAdapterState>? adapterStateSubscription;

  StreamSubscription<List<ScanResult>>? scanResultsSubscription;
  StreamSubscription<bool>? isScanningSubscription;
  StreamSubscription<BluetoothConnectionState>? connectionStateSubscription;
  StreamSubscription<List<int>>? lastValueSubscription;

  void turnOn() async => await FlutterBluePlus.turnOn();

  void msgHandled() => emitSafeState(state.copyWith(error: null, info: null));

  void _startListening() {
    adapterStateSubscription = FlutterBluePlus.adapterState.listen((adapterState) {
      final initalState = BluetoothDevConState.initial();
      final devCubitState = initalState.copyWith(adapterState: adapterState);
      if (adapterState == BluetoothAdapterState.on) {
        onScan();
      }
      emitSafeState(devCubitState);
    });
  }

  void onScan() async {
    emitSafeState(state.copyWith(info: 'Scanning for Devices'));
    await FlutterBluePlus.startScan(
      withNames: ['HSCO_Scale'],
      timeout: const Duration(milliseconds: 300));
    scanResultsSubscription = FlutterBluePlus.scanResults.listen((results) {
      final blDevices = results.map((e) => e.device).toList();
      if(blDevices.isEmpty) return;
      emitSafeState(state.copyWith(devices: blDevices));
      onConnectDevice(blDevices.first);
    }, onError: (e, st) {
      $logger.error('[BluetoothDevConCubit]', e, st);
      final error = Failure(error: e);
      emitSafeState(state.copyWith(error: error));
    });

    isScanningSubscription = FlutterBluePlus.isScanning.listen((scaning) {
      if(scaning) {
        emitSafeState(state.copyWith(scanningState: ScanningState.scanning));
      } else {
        emitSafeState(state.copyWith(scanningState: ScanningState.idle));
      }
    });
  }

  void onConnectDevice(BluetoothDevice device) async {
    try {
      connectionStateSubscription = device.connectionState.listen((event) {
      emitSafeState(state.copyWith(device: device, connectionState: event, services: [],));
    });
    await device.connectAndUpdateStream();
    emitSafeState(state.copyWith(info: 'Device Connected Successfully..!'));
    final services = await device.discoverServices();
    final notifyingServices = services
      .where((e) => e.characteristics.any((c) => c.properties.notify))
      .toList();
    if(notifyingServices.isEmpty) return;
     final characteristics = notifyingServices.firstOrNull?.characteristics.firstOrNull;
    emitSafeState(state.copyWith(
      device: device, 
      services: notifyingServices, 
      characteristic: characteristics,
    ));

    } on FlutterBluePlusException catch (e, st) {
      $logger.error('[On Connect Device] : ', e, st);
      final error = Failure(error: e.description.valueOrEmpty);
      emitSafeState(state.copyWith(error: error));
    }
    
  }

  void onDisconnect() async {
    if(state.device.isNull) return;
    await state.device!.disconnectAndUpdateStream(queue: false);
    emitSafeState(state.copyWith(device: null, characteristic: null, info: 'Device Disconnected'));
  }

  void onSubscribePressed() async {
    final c = state.characteristic;
    if(c.isNull) return;
    await c!.setNotifyValue(c.isNotifying == false);
    _steamValue();
  }

  void onReadPressed() async {
    final c = state.characteristic;
    if(c.isNull) return;
    await c!.read();
  }

  Future<String?> getReadValue() async {
    try {
      final c = state.characteristic;
      if (c.isNull) {
        throw Exception('Bluetooth Device is not configured');
      }
      final res = await state.characteristic!.read();
      return String.fromCharCodes(res);
    } on FlutterBluePlusException catch (e, st) {
      $logger.error('[On Connect Device] : ', e, st);
      final error = Failure(error: e.description.valueOrEmpty);
      emitSafeState(state.copyWith(error: error));
    } on Exception catch (e, st) {
      $logger.error('[On Connect Device] : ', e, st);
      final error = Failure(error: e.toString());
      emitSafeState(state.copyWith(error: error));
    }
    return null;
  }

  void _steamValue() {
    final characteristic = state.characteristic;
    if(characteristic.isNull) return;

    lastValueSubscription = state.characteristic!.lastValueStream.listen((value) {
      emitSafeState(state.copyWith(value: value));
    });
  }

  @override
  Future<void> close() async {
    final request = [
      adapterStateSubscription?.cancel(),
      scanResultsSubscription?.cancel(),
      isScanningSubscription?.cancel(),
      connectionStateSubscription?.cancel(),
      lastValueSubscription?.cancel(),
    ].nonNulls;
    await Future.wait(request);
    super.close();
  }
}

@freezed
class BluetoothDevConState with _$BluetoothDevConState {
  factory BluetoothDevConState({
    required BluetoothAdapterState adapterState,
    required List<BluetoothDevice> devices,
    BluetoothDevice? device,
    required BluetoothConnectionState connectionState,
    ScanningState? scanningState,
    required List<BluetoothService> services,
    BluetoothCharacteristic? characteristic,
    required List<int> value,
    Failure? error,
    String? info,
  }) = _BluetoothDevConState;

  factory BluetoothDevConState.initial() => BluetoothDevConState(
        scanningState: ScanningState.idle,
        adapterState: BluetoothAdapterState.unknown,
        devices: const <BluetoothDevice>[],
        connectionState: BluetoothConnectionState.disconnected,
        services: const <BluetoothService>[],
        value: [],
      );
}
