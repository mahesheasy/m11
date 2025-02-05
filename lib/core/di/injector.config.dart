// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../app/data/app_repo.dart' as _i820;
import '../../app/data/app_repo_impl.dart' as _i21;
import '../../app/presentation/bloc/bloc_provider.dart' as _i1059;
import '../../app/presentation/bloc/bluetooth_dev_connectivity/bluetooth_dev_conn_cubit.dart'
    as _i1028;
import '../../features/auth/data/auth_repo.dart' as _i585;
import '../../features/auth/data/auth_repo_impl.dart' as _i328;
import '../../features/auth/presentation/bloc/auth/auth_cubit.dart' as _i190;
import '../../features/auth/presentation/bloc/forgot_pswd/forgot_pswd_cubit.dart'
    as _i780;
import '../../features/auth/presentation/bloc/registration/registration_cubit.dart'
    as _i966;
import '../../features/auth/presentation/bloc/sign_in/sign_in_cubit.dart'
    as _i140;
import '../../features/bde/data/bde_repo.dart' as _i76;
import '../../features/bde/data/bde_repo_impl.dart' as _i638;
import '../../features/bde/ui/bloc/bloc_provider.dart' as _i399;
import '../../features/bde/ui/bloc/enroll_fbo/enroll_fbo_cubit.dart' as _i739;
import '../../features/ce/data/ce_repo.dart' as _i191;
import '../../features/ce/data/ce_repo_impl.dart' as _i801;
import '../../features/ce/presentation/bloc/can_submission/can_submission_cubit.dart'
    as _i961;
import '../../features/ce/presentation/bloc/ce_bloc_provider.dart' as _i603;
import '../../features/ce/presentation/bloc/date_filter/date_filter_cubit.dart'
    as _i920;
import '../../features/ce/presentation/bloc/pick_up_summary/pick_up_summary_cubit.dart'
    as _i912;
import '../../features/deo/data/deo_api_helper.dart' as _i728;
import '../../features/deo/data/deo_repo.dart' as _i92;
import '../../features/deo/data/deo_repo_impl.dart' as _i858;
import '../../features/deo/ui/bloc/bloc_provider.dart' as _i422;
import '../../features/deo/ui/bloc/new_gate_entry/new_gate_entry_cubit.dart'
    as _i375;
import '../../features/deo/ui/bloc/new_gate_exit/new_gate_exit_cubit.dart'
    as _i774;
import '../../features/fbo/data/fbo_repo.dart' as _i294;
import '../../features/fbo/data/fbo_repo_impl.dart' as _i745;
import '../../features/fbo/presentation/bloc/enroll_business/enroll_business_cubit.dart'
    as _i851;
import '../../features/fbo/presentation/bloc/fbo_bloc_provider.dart' as _i931;
import '../../features/notifications/data/notifications_repo.dart' as _i1033;
import '../../features/notifications/data/notifications_repo_impl.dart'
    as _i860;
import '../../features/notifications/ui/bloc/bloc_provider.dart' as _i95;
import '../core.dart' as _i351;
import '../local_storage/key_vale_storage.dart' as _i1012;
import '../network/api_client.dart' as _i557;
import '../network/internet_check.dart' as _i402;
import 'injector.dart' as _i811;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyDependencies = _$ThirdPartyDependencies();
    gh.factory<DateTime>(() => thirdPartyDependencies.defaultDateTime);
    gh.factory<_i920.DateFilterCubit>(() => _i920.DateFilterCubit());
    gh.factory<_i1028.BluetoothDevConCubit>(
        () => _i1028.BluetoothDevConCubit());
    gh.singleton<_i519.Client>(() => thirdPartyDependencies.httpClient);
    gh.singleton<_i895.Connectivity>(() => thirdPartyDependencies.connectivity);
    gh.singleton<_i558.FlutterSecureStorage>(
        () => thirdPartyDependencies.secureStorage);
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => thirdPartyDependencies.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i402.InternetConnectionChecker>(
        () => _i402.InternetConnectionChecker(gh<_i895.Connectivity>()));
    gh.factory<_i557.ApiClient>(() => _i557.ApiClient(
          gh<_i519.Client>(),
          gh<_i351.InternetConnectionChecker>(),
        ));
    gh.lazySingleton<_i294.FBORepo>(
        () => _i745.FBORepoImpl(gh<_i351.ApiClient>()));
    gh.factory<_i1012.KeyValueStorage>(() => _i1012.KeyValueStorage(
          gh<_i558.FlutterSecureStorage>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.lazySingleton<_i76.BDERepo>(
        () => _i638.BDERepoImpl(gh<_i351.ApiClient>()));
    gh.lazySingleton<_i92.DEORepo>(
        () => _i858.DeoRepoImpl(gh<_i351.ApiClient>()));
    gh.lazySingleton<_i1033.NotificationsRepo>(
        () => _i860.NotificationsRepoImpl(gh<_i351.ApiClient>()));
    gh.lazySingleton<_i191.CERepo>(
        () => _i801.CERepoImpl(gh<_i351.ApiClient>()));
    gh.lazySingleton<_i820.AppRepo>(
        () => _i21.AppRepoImpl(gh<_i351.ApiClient>()));
    gh.lazySingleton<_i603.CEBlocProvider>(
        () => _i603.CEBlocProvider(gh<_i191.CERepo>()));
    gh.factory<_i912.PickUpSummaryCubit>(
        () => _i912.PickUpSummaryCubit(gh<_i191.CERepo>()));
    gh.factory<_i961.CanSubmissionCubit>(
        () => _i961.CanSubmissionCubit(gh<_i191.CERepo>()));
    gh.lazySingleton<_i585.AuthRepo>(() => _i328.AuthRepoImpl(
          gh<_i351.ApiClient>(),
          gh<_i351.KeyValueStorage>(),
        ));
    gh.factory<_i140.SignInCubit>(
        () => _i140.SignInCubit(gh<_i585.AuthRepo>()));
    gh.factory<_i780.ForgotPswdCubit>(
        () => _i780.ForgotPswdCubit(gh<_i585.AuthRepo>()));
    gh.factory<_i190.AuthCubit>(() => _i190.AuthCubit(gh<_i585.AuthRepo>()));
    gh.factory<_i966.RegistrationCubit>(
        () => _i966.RegistrationCubit(gh<_i585.AuthRepo>()));
    gh.lazySingleton<_i931.FBOBlocProvider>(
        () => _i931.FBOBlocProvider(gh<_i294.FBORepo>()));
    gh.factory<_i851.EnrollBusinessCubit>(
        () => _i851.EnrollBusinessCubit(gh<_i294.FBORepo>()));
    gh.factory<_i375.NewGateEntryCubit>(
        () => _i375.NewGateEntryCubit(gh<_i92.DEORepo>()));
    gh.factory<_i774.NewGateExitCubit>(
        () => _i774.NewGateExitCubit(gh<_i92.DEORepo>()));
    gh.lazySingleton<_i422.DEOBlocProvider>(
        () => _i422.DEOBlocProvider(gh<_i92.DEORepo>()));
    gh.factory<_i95.NotificationsBlocProvider>(() =>
        _i95.NotificationsBlocProvider(repo: gh<_i1033.NotificationsRepo>()));
    gh.lazySingleton<_i1059.AppBlocProvider>(
        () => _i1059.AppBlocProvider(repo: gh<_i820.AppRepo>()));
    gh.factory<_i728.GeoLocaUpdateHelper>(
        () => _i728.GeoLocaUpdateHelper(repo: gh<_i92.DEORepo>()));
    gh.factory<_i739.EnrollFboCubit>(
        () => _i739.EnrollFboCubit(gh<_i76.BDERepo>()));
    gh.lazySingleton<_i399.BDEBlocProvider>(
        () => _i399.BDEBlocProvider(gh<_i76.BDERepo>()));
    return this;
  }
}

class _$ThirdPartyDependencies extends _i811.ThirdPartyDependencies {}
