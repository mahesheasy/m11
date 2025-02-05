import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/bloc/geo_permission/geo_permission_handler.dart';
import 'package:m11_ind/app/presentation/bloc/geo_permission/geo_permission_state.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';

class LocationHeader extends StatelessWidget {
  const LocationHeader({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kTextTabBarHeight + 32,
      left: 12,
      child: BlocBuilder<GeoPermissionHandler, GeoPermissionState>(
        builder: (_, state) {
          if(state is LocationPermissionGranted) {
            final locationName = state.position?.name;
            return PageHeaderWidget(title: title, value: locationName);
          }
          return PageHeaderWidget(title: title);
        },
      ),
    );
  }
}
