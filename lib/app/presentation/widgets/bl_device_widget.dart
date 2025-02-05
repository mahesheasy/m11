import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:m11_ind/app/presentation/bloc/bluetooth_dev_connectivity/bluetooth_dev_conn_cubit.dart';
import 'package:m11_ind/app/presentation/widgets/characteristic_tile.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/app_colors.dart';

class BLDeviceWidget extends StatefulWidget {
  const BLDeviceWidget({super.key, required this.device});

  final BluetoothDevice device;
  @override
  State<BLDeviceWidget> createState() => _BLDeviceWidgetState();
}

class _BLDeviceWidgetState extends State<BLDeviceWidget> {
  late final BluetoothDevice device;
  bool _isConnecting = false;
  bool _isDisconnecting = false;

  late StreamSubscription<bool> _isConnectingSubscription;
  late StreamSubscription<bool> _isDisconnectingSubscription;

  @override
  void initState() {
    super.initState();
    device = widget.device;
    _isConnectingSubscription = device.isConnecting.listen((value) {
      _isConnecting = value;
      if (mounted) {
        setState(() {});
      }
    });

    _isDisconnectingSubscription = device.isDisconnecting.listen((value) {
      _isDisconnecting = value;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _isConnectingSubscription.cancel();
    _isDisconnectingSubscription.cancel();
    super.dispose();
  }

  void onConnectPressed() {
    try {
      context.cubit<BluetoothDevConCubit>().onConnectDevice(device);
    } catch (e) {
      if (e is FlutterBluePlusException &&
          e.code == FbpErrorCode.connectionCanceled.index) {
      } else {}
    }
  }

  Future onDisconnectPressed() async {
    context.cubit<BluetoothDevConCubit>().onDisconnect();
  }

  Widget buildConnectButton(BuildContext context) {
    return BlocBuilder<BluetoothDevConCubit, BluetoothDevConState>(
      builder: (_, state) {
        final isConnected = state.connectionState == BluetoothConnectionState.connected;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_isConnecting || _isDisconnecting) ...[
              buildSpinner(context),
            ] else...[
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.black,
                ),
                onPressed: _isConnecting
                    ? null
                    : (isConnected ? onDisconnectPressed : onConnectPressed),
                child: Text(
                  _isConnecting
                      ? 'CANCEL'
                      : (isConnected ? 'DISCONNECT' : 'CONNECT'),
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BluetoothDevConCubit, BluetoothDevConState>(
      builder: (context, state) {
        final characteristic = state.characteristic;
        final enabled = characteristic.isNotNull;
        return ExpansionTile(
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.zero,
          enabled: enabled,
          trailing: !enabled ? const SizedBox.shrink() : null,
          title: ListTile(
            title: Text(device.advName),
            trailing: buildConnectButton(context)
          ),
          children: [
            if(characteristic.isNull)...[
              const SizedBox.shrink()
            ] else...[
              CharacteristicTile(characteristic: characteristic!),
            ],
          ],
        );
      },
    );
  }

  Widget buildSpinner(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(14.0),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: CircularProgressIndicator(
          backgroundColor: Colors.black12,
          color: Colors.black26,
        ),
      ),
    );
  }
}
