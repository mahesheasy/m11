import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/app/presentation/ui/account_details.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/fbo/presentation/bloc/enroll_business/enroll_business_cubit.dart';
import 'package:m11_ind/features/fbo/presentation/bloc/fbo_bloc_provider.dart';
import 'package:m11_ind/features/fbo/presentation/fbo_dashboard.dart';
import 'package:m11_ind/features/fbo/presentation/ui/enroll/enroll_business_scrn.dart';
import 'package:m11_ind/features/fbo/presentation/ui/request_extra_cans/request_extra_cans_scrn.dart';
import 'package:m11_ind/features/fbo/presentation/ui/request_uco_pickup/request_uco_pick_up.dart';
import 'package:m11_ind/features/fbo/presentation/ui/summary/fbo_summary.dart';
import 'package:m11_ind/features/fbo/presentation/ui/uco_enrollment/fbo_summary.dart';
import 'package:m11_ind/features/notifications/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/notifications/ui/presentation/notifications_scrn.dart';

abstract class FBOShellBranches {
  static final shellNavKey = GlobalKey<NavigatorState>();
  static final fboShellBranches = [
    StatefulShellBranch(
      initialLocation: AppRoute.fboDashboard.path,
      navigatorKey: shellNavKey,
      routes: <RouteBase>[
        GoRoute(
          path: AppRoute.fboDashboard.path,
          builder: (_, GoRouterState state) {
            return BlocProvider(
              create: (_) => FBOBlocProvider.get().getStatus()..request(),
              child: const FBODashBoardScrn(),
            );
          },
          routes: [
            GoRoute(
              path: AppRoute.accountDetails.getPath(),
              builder: (context, state) => const AccountDetails(),
            ),
            GoRoute(
              path: AppRoute.enrollBusiness.getPath(),
              builder: (context, state) => BlocProvider(
                create: (_) => $sl.get<EnrollBusinessCubit>(),
                child: const EnrollBusinessScreen(),
              ),
            ),
            GoRoute(
              path: AppRoute.requestExtraCans.getPath(),
              builder: (context, state) {
                final provider = FBOBlocProvider.get();
                final fboId = context.fboId;

                return MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (_) => provider.requestCans()),
                    BlocProvider(
                      create: (_) => provider.getFBODetails()..request(fboId)),
                  ],
                  child: const RequestExtraCansScrn(),
                );
              },
            ),
            GoRoute(
              path: AppRoute.requestUCOPickUp.getPath(),
              builder: (context, state) {
                final provider = FBOBlocProvider.get();
                final fboId = context.fboId;

                return MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (_) => provider.requestFBO()),
                    BlocProvider(
                      create: (_) => provider.getFBODetails()..request(fboId)),
                  ],
                  child: const RequestUCOPickUp(),
                );
              },
            ),
            GoRoute(
              path: AppRoute.summary.getPath(),
              builder: (context, state) => const FBOSummary(),
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoute.ucoEnrollment.path,
          builder: (context, state) => const UCOEnrollment(),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoute.fboNotifications.path,
          builder: (context, state) => BlocProvider(
            create: (_) => NotificationsBlocProvider.get().fetchNotifications()
              ..fetchInitial(),
            child: const NotificationsScrn(),
          ),
        ),
      ],
    ),
  ];
}
