import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:m11_ind/app/presentation/bloc/bluetooth_dev_connectivity/bluetooth_dev_conn_cubit.dart';
import 'package:m11_ind/app/presentation/widgets/bl_device_widget.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/bluetooth_con_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/widgets/empty_data_widget.dart';
import 'package:m11_ind/widgets/widgets.dart';

class WeighingScaleScrn extends StatefulWidget {
  const WeighingScaleScrn({super.key});

  @override
  State<WeighingScaleScrn> createState() => _WeighingScaleScrnState();
}

class _WeighingScaleScrnState extends State<WeighingScaleScrn> {
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'BL Device Connection',
      showDrawer: false,
      headerWidget: const SizedBox(),
      child: BlocBuilder<BluetoothDevConCubit, BluetoothDevConState>(
        builder: (_, state) {
          $logger.devLog('meachine $state');
          final adapterState = state.adapterState;
          return switch (adapterState) {
            BluetoothAdapterState.unknown ||
            BluetoothAdapterState.off ||
            BluetoothAdapterState.unavailable ||
            BluetoothAdapterState.unauthorized =>
              BluetoothConWidget(adapterState: adapterState),
            BluetoothAdapterState.turningOn ||
            BluetoothAdapterState.turningOff =>const Center(child: LoadingIndicator()),
            BluetoothAdapterState.on => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.scanningState == ScanningState.scanning) ...[
                    const Center(child: LoadingIndicator()),
                  ] else ...[
                    if (state.devices.isEmpty) ...[
                      EmptyDataWidget(
                        emptyText: 'No HSCO Bluetooth Devices Found',
                        onRefresh: context.cubit<BluetoothDevConCubit>().onScan,
                      ),
                    ] else ...[
                      Expanded(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: ListView(
                            children: state.devices.map((e) => BLDeviceWidget(device: e)).toList(),
                          ),
                        ),
                      )
                    ],
                  ],
                ],
              )
          };
        },
      ),
    );
  }
}