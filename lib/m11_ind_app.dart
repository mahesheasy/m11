import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:m11_ind/app/presentation/bloc/bluetooth_dev_connectivity/bluetooth_dev_conn_cubit.dart';
import 'package:m11_ind/app/presentation/bloc/geo_permission/geo_permission_handler.dart';
import 'package:m11_ind/app/presentation/bloc/geo_permission/geo_permission_state.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/auth/model/logged_in_user.dart';
import 'package:m11_ind/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/date_filter/date_filter_cubit.dart';
import 'package:m11_ind/styles/material_theme.dart';
import 'package:m11_ind/widgets/widgets.dart';

import 'features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';

class M11IndApp extends StatefulWidget {
  const M11IndApp({super.key});

  @override
  State<M11IndApp> createState() => _M11IndAppState();
}

class _M11IndAppState extends State<M11IndApp> with WidgetsBindingObserver{
  bool _shouldRequestPermission = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (_shouldRequestPermission) {
        _shouldRequestPermission = false;
        handleCallBack();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => $sl.get<AuthCubit>()..authCheckRequested()),
        BlocProvider<SignInCubit>(create: (_) => $sl.get<SignInCubit>()),
        BlocProvider<DateFilterCubit>(create: (_) => $sl.get<DateFilterCubit>()),
        BlocProvider<GeoPermissionHandler>(create: (_) => GeoPermissionHandler()),
        BlocProvider<BluetoothDevConCubit>(create: (_) => BluetoothDevConCubit()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<BluetoothDevConCubit, BluetoothDevConState>(
            listener: (_, state) {
              if(state.error.isNotNull) {
                AppRouterConfig.context
                  ..showSnackbar(state.error!.error, AppSnackBarType.error)
                  ..cubit<BluetoothDevConCubit>().msgHandled();
              }
              if(state.info.isNotNull) {
                AppRouterConfig.context
                  ..showSnackbar(state.info!, AppSnackBarType.info)
                  ..cubit<BluetoothDevConCubit>().msgHandled();
              }
            },
          ),
          BlocListener<AuthCubit, AuthState>(
            listener: (_, state) {
              final routerCtxt = AppRouterConfig.context;
              state.when(
                loading: () => AppRoute.splash.go(routerCtxt),
                authenticated: () {
                  if(!routerCtxt.user.isFBO) {
                    routerCtxt.cubit<GeoPermissionHandler>().checkPermission();
                  }
                  if (routerCtxt.user.isBDE) {
                    routerCtxt.cubit<BluetoothDevConCubit>().scanDevices();
                    return AppRoute.bdeDashboard.go(routerCtxt);
                  }
                  if (routerCtxt.user.isCollExecutive) {
                    routerCtxt.cubit<BluetoothDevConCubit>().scanDevices();
                    return AppRoute.ceDashboard.go(routerCtxt);
                  }
                  if (routerCtxt.user.isDEO) {
                    routerCtxt.cubit<BluetoothDevConCubit>().scanDevices();
                    return AppRoute.deoDashboard.go(routerCtxt);
                  }
                  return AppRoute.fboDashboard.go(routerCtxt);
                },
                unAuthenticated: () => AppRoute.login.go(routerCtxt),
              );
            },
          ),
          BlocListener<GeoPermissionHandler, GeoPermissionState>(
            listenWhen: (previous, current) => previous != current,
            listener: (_, state) async {
              final routerCtxt = AppRouterConfig.context;
              if(state is GeoLocationDenied) {
                Geolocator.requestPermission().then((_) {
                  routerCtxt.cubit<GeoPermissionHandler>().checkPermission();
                });
                return;
              }
              if(state is GeoLocationDeniedForever || state is LocationPermissionPermDenied) {
                AppDialog.showErrorDialog<bool?>(
                  routerCtxt,
                  barrierDismissible: false, 
                  title: 'Grant Location Permission',
                  content: 'M11 needs your location permission', 
                  buttonText: 'Allow',
                  onTapDismiss: () => routerCtxt.exit(true),
                ).then((value) async {
                  if(value.isTrue) {
                    _shouldRequestPermission = true;
                    await Geolocator.openAppSettings();
                  }
                });
              }
            },
          ),
        ],
        child: FlavorBanner(
          child: MaterialApp.router(
            title: 'M11',
            theme: AppMaterialTheme.lightTheme,
            darkTheme: AppMaterialTheme.lightTheme,
            routerConfig: AppRouterConfig.router,
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }

  void handleCallBack() {
    final context = AppRouterConfig.context;
    context.cubit<GeoPermissionHandler>().checkPermission();
  }
}
