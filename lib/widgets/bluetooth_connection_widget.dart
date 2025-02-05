import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/bloc/bluetooth_dev_connectivity/bluetooth_dev_conn_cubit.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/app_colors.dart';

class BluetoothConnectionIcon extends StatefulWidget {
  const BluetoothConnectionIcon({super.key});

  @override
  State<BluetoothConnectionIcon> createState() =>
      _BluetoothConnectionIconState();
}

class _BluetoothConnectionIconState extends State<BluetoothConnectionIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BluetoothDevConCubit, BluetoothDevConState>(
      builder: (context, state) {
        final connectionState = state.device?.isConnected.isTrue;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                connectionState != null
                    ? Icons.bluetooth_connected
                    : Icons.bluetooth_disabled,
                color: connectionState != null ? AppColors.green : AppColors.red,
                size: 24,
              ),
            ),
            FadeTransition(
                opacity: _opacityAnimation,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor:
                      connectionState != null ? AppColors.green : AppColors.red,
                ))
          ],
        );
      },
    );
  }
}
