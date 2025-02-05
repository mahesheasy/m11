import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/deo/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/deo/ui/bloc/new_gate_exit/new_gate_exit_cubit.dart';
import 'package:m11_ind/features/deo/ui/presentation/assign_bde/assign_bde_list.dart';
import 'package:m11_ind/features/deo/ui/presentation/assign_ceo/assign_ce_list.dart';
import 'package:m11_ind/features/deo/ui/presentation/deo_dashboard_scrn.dart';
import 'package:m11_ind/features/deo/ui/presentation/fbo_can_requests/fbo_can_req_approval.dart';
import 'package:m11_ind/features/deo/ui/presentation/fbo_can_requests/fbo_can_requests.dart';
import 'package:m11_ind/features/deo/ui/presentation/gate_entry/gate_exit_records.dart';
import 'package:m11_ind/features/deo/ui/presentation/gate_exit/gate_exit_registration.dart';
import 'package:m11_ind/features/deo/ui/presentation/monthly_report/monthly_report_scrn.dart';
import 'package:m11_ind/features/deo/ui/presentation/uco_deposit/uco_collections.dart';
import 'package:m11_ind/features/notifications/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/notifications/ui/presentation/notifications_scrn.dart';

abstract class DEOShellRouter {
  static final shellNavKey = GlobalKey<NavigatorState>();
  static final deoShellBranches = [
    StatefulShellBranch(
      initialLocation: AppRoute.deoDashboard.path,
      navigatorKey: shellNavKey,
      routes: <RouteBase>[
        GoRoute(
          path: AppRoute.deoDashboard.path,
          builder: (_, state) => const DEODashboardScrn(),
          routes: [
            GoRoute(
              path: AppRoute.gateEntry.getPath(),
              builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => DEOBlocProvider.get().gateExitRecords()..fetchInitial()),
                ],
                child: const GateExitRecords(),
              ),
            ),
            GoRoute(
              path: AppRoute.gateExit.getPath(),
              builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => $sl.get<NewGateExitCubit>()),
                  BlocProvider(create: (_) => DEOBlocProvider.get().vehcileNos()..request()),
                  BlocProvider(create: (_) => DEOBlocProvider.get().vehicleDrivers()..request()),
                ],
                child: const GateExitRegistration(),
              ),
            ),
            GoRoute(
              path: AppRoute.fboCanRequests.getPath(),
              builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => DEOBlocProvider.get().fboCanRequests()..fetchInitial(context.activeDay),
                  ),
                ],
                child: FBOCanRequests(),
              ),
              routes: [
                GoRoute(
                  path: 'Approval',
                  name: AppRoute.fboCanRequestsApp.getPath(),
                  builder: (ctxt, state) {
                    final fboId = state.uri.queryParameters['id'];
                    final cans = state.uri.queryParameters['cans'];
                    final requesId = state.uri.queryParameters['requesId'];
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (_) => DEOBlocProvider.get().getFBODetails()..request(fboId)),
                        BlocProvider(
                          create: (_) => DEOBlocProvider.get().approveCanRequest()),
                        BlocProvider(
                          create: (_) => DEOBlocProvider.get().rejectCanRequest()),
                      ],
                      child: FBOCanReqApproval(
                        canReqId: requesId!,
                        cans: double.tryParse(cans!) ?? 0),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: AppRoute.assignCEList.getPath(),
              builder: (context, state) => BlocProvider(
                create: (_) => DEOBlocProvider.get().assignCEList()..fetchInitial(context.activeDay),
                child: AssignCEList(),
              ),
            ),
            GoRoute(
              path: AppRoute.assignBDEList.getPath(),
              builder: (context, state) => BlocProvider(
                create: (_) => DEOBlocProvider.get().assignBDEList()..fetchInitial(context.activeDay),
                child: AssignBDEList(),
              ),
            ),
            GoRoute(
              path: AppRoute.ucoDeposit.getPath(),
              builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => DEOBlocProvider.get().vehicleDrivers()..request()),
                  BlocProvider(
                    create: (_) => DEOBlocProvider.get().ucoDepositSummary()),
                  ],
                child: const UCOCollections(),
              ),
            ),
            GoRoute(
              path: AppRoute.monthlyReport.getPath(),
              builder: (context, state) => BlocProvider(
                create: (_) => DEOBlocProvider.get().reportCubit()..request(),
                child: const MonthlyReportScrn(),
              ),
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoute.deoNotifications.path,
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
