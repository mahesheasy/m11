import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:m11_ind/app/presentation/bloc/bluetooth_dev_connectivity/bluetooth_dev_conn_cubit.dart';
import 'package:m11_ind/core/core.dart';

class BluetoothConWidget extends StatelessWidget {
  const BluetoothConWidget({super.key, required this.adapterState});

  final BluetoothAdapterState adapterState;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildBluetoothOffIcon(context),
          buildTitle(context),
          if (Platform.isAndroid) buildTurnOnButton(context),
        ],
      ),
    );
  }

  Widget buildBluetoothOffIcon(BuildContext context) {
    return const Icon(Icons.bluetooth_disabled, size: 200.0, color: Colors.black);
  }

  Widget buildTurnOnButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: context.cubit<BluetoothDevConCubit>().turnOn,
        child: const Text('TURN ON'),
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    String? state = adapterState.toString().split('.').last;
    return Text(
      'Bluetooth Adapter is $state',
    );
  }
}
