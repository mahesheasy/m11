import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_fbo_cubit.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/widgets/enroll_fbo_bloc_builder.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationDetails extends StatefulWidget {
  const LocationDetails({super.key});

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchCurrentPosition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return EnrollFBOBlocBuilder(
      builder: (_, state) => SpacedColumn(
        children: [
          AppTextField(
            title: 'Address',
            readOnly: true,
            initialValue: state.form.location,
            suffixIcon: state.isLoading
                ? const CupertinoActivityIndicator(color: AppColors.chimneySweep)
                : IconButton(
                    onPressed: _fetchCurrentPosition,
                    icon: const Icon(Icons.location_on_outlined), 
                    color: AppColors.green,
                  ),
          ),
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  title: 'Latitude',
                  readOnly: true,
                  initialValue: state.form.latitude?.toString(),
                ),
              ),
              AppSpacer.p8(),
              Expanded(
                child: AppTextField(
                  title: 'Longitude',
                  readOnly: true,
                  initialValue: state.form.longitude?.toString(),
                ),
              ),
            ],
          ),
          AppButton(
            label: 'NEXT',
            margin: const EdgeInsets.all(12.0),
            onPressed: state.form.latitude.isNull
                ? () => context.cubit<EnrollFboCubit>().emitError('Submit Location Coordinates')
                : context.cubit<EnrollFboCubit>().nextStep,
          )
        ],
      ),
    );
  }

  Future<void> _fetchCurrentPosition() async {
    final form = context.read<EnrollFboCubit>().state.form;
    final hasLocationFetched = form.latitude.isNotNull && form.longitude.isNotNull;
    if(hasLocationFetched) return;
    context.cubit<EnrollFboCubit>().emitLoader();
    final isServEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServEnabled) {
      await Geolocator.requestPermission();
    }
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      await openAppSettings();
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    if (!mounted) return;
    final latitude = position.latitude;
    final longitude = position.longitude;
    context.cubit<EnrollFboCubit>().getAddressFromLatLng(latitude, longitude);
  }
}
