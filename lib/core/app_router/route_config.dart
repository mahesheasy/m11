import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/app/presentation/ui/app_splash_scrn.dart';
import 'package:m11_ind/app/presentation/ui/scaffold_with_navbar.dart';
import 'package:m11_ind/core/app_router/_bde_shell_router.dart';
import 'package:m11_ind/core/app_router/_ce_shell_router.dart';
import 'package:m11_ind/core/app_router/_deo_shell_router.dart';
import 'package:m11_ind/core/app_router/_fbo_shell_router.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/auth/presentation/bloc/forgot_pswd/forgot_pswd_cubit.dart';
import 'package:m11_ind/features/auth/presentation/bloc/registration/registration_cubit.dart';
import 'package:m11_ind/features/auth/presentation/ui/authentication_scrn.dart';
import 'package:m11_ind/features/auth/presentation/ui/forgot_password/forgot_pswd_scrn.dart';
import 'package:m11_ind/features/auth/presentation/ui/registration/user_registration_scrn.dart';

class AppRouterConfig {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();

  static final context = parentNavigatorKey.currentState!.context;

  static final GoRouter router = GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: AppRoute.splash.path,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoute.splash.path,
        builder: (_, state) => const AppSplashScrn(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        builder: (_, state) => const AuthenticationScrn(),
      ),
      GoRoute(
        path: AppRoute.register.path,
        builder: (_, state) => BlocProvider(
          create: (_) => $sl.get<RegistrationCubit>(),
          child: const UserRegistrationScrn(),
        ),
      ),
      GoRoute(
        path: AppRoute.forgotpswd.path,
        builder: (_, state) => BlocProvider(
          create: (_) => $sl.get<ForgotPswdCubit>(),
          child: const ForgotPswdScrn(),
        ),
      ),
      StatefulShellRoute.indexedStack(
        branches: CEShellRouter.ceoShellRouter,
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
      ),
      StatefulShellRoute.indexedStack(
        branches: FBOShellBranches.fboShellBranches,
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
      ),
      StatefulShellRoute.indexedStack(
        branches: BDEShellRouter.bdeShellBranches,
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
      ),
      StatefulShellRoute.indexedStack(
        branches: DEOShellRouter.deoShellBranches,
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
      ),
    ],
  );
}


extension RouteConfigAPI on AppRouterConfig {
  
}