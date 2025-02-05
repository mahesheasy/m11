import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_fbo_cubit.dart';
import 'package:m11_ind/features/bde/ui/presentation/bde_dashboard.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/enroll_fbo_scrn.dart';
import 'package:m11_ind/features/bde/ui/presentation/enrollment_report/enroll_report_scrn.dart';
import 'package:m11_ind/features/bde/ui/presentation/fbos/enrolled_fbos.dart';
import 'package:m11_ind/features/bde/ui/presentation/follow_ups/follow_up_list.dart';
import 'package:m11_ind/features/bde/ui/presentation/routes/routes_screen.dart';
import 'package:m11_ind/features/bde/ui/presentation/summary/fbo_summary_list.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/models/fbo_list_inp.dart';
import 'package:m11_ind/features/ce/presentation/ui/fbos/fbo_details_scrn.dart';
import 'package:m11_ind/features/notifications/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/notifications/ui/presentation/notifications_scrn.dart';

abstract class BDEShellRouter {
  static final shellNavKey = GlobalKey<NavigatorState>();
  static final bdeShellBranches = [
    StatefulShellBranch(
      initialLocation: AppRoute.bdeDashboard.path,
      navigatorKey: shellNavKey,
      routes: <RouteBase>[
        GoRoute(
          path:  AppRoute.bdeNotifications.path,
          builder: (context, state) => BlocProvider(
            create: (_) => NotificationsBlocProvider.get().fetchNotifications()..fetchInitial(),
            child: const NotificationsScrn(),
          ),
        ),
        GoRoute(
          path:  AppRoute.bdeNotifications.path,
          builder: (context, state) => BlocProvider(
            create: (_) => NotificationsBlocProvider.get().fetchNotifications()..fetchInitial(),
            child: const NotificationsScrn(),
          ),
        ),
        GoRoute(
          path: AppRoute.bdeDashboard.path,
          builder: (_, GoRouterState state) {
            return BlocProvider(
              create: (_) => BDEBlocProvider.get().taskProgressCubit()..request(),
              child: const BDEDashboard(),
            );
          },
          routes: [
            GoRoute(
              path: AppRoute.enrollFBO.getPath(),
              builder: (_, state) => MultiBlocProvider(
                providers: [
                  BlocProvider(create:(_)=> BDEBlocProvider.get().getFBODetails()),
                  BlocProvider(create: (_) =>  $sl.get<EnrollFboCubit>()),
                  BlocProvider(create: (_) => BDEBlocProvider.get().getFBODetails()),
                  BlocProvider(create: (_) => BDEBlocProvider.get().ucoPriceCubit()..request()),
                  BlocProvider(create: (_) => BDEBlocProvider.get().fetchRouteMaster()..request()),
                ],
                child: const EnrollFBOScrn(),
              ),
            ),

            GoRoute(
              path: AppRoute.routes.getPath(),
              builder: (ctxt, state) => MultiBlocProvider(  
                providers: [
                  BlocProvider(create: (_) => BDEBlocProvider.get().fetchRouteMaster()..request()),
                  BlocProvider(create: (_) => BDEBlocProvider.get().fetchRoutes()),
                ],
                child: const RoutesScreen(),
              ),
              routes: [
                GoRoute(
                  path: 'bdeRoutes/:id',
                  builder: (ctxt, state) {
                    final fboId = state.pathParameters['id'];
                    final fboName = state.extra as String;

                    final blocProvider = BDEBlocProvider.get();
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (_) => blocProvider.getFBODetails()..request(fboId)),
                        BlocProvider(create: (_) => blocProvider.fboSummaryCubit()..request(fboId)),
                      ],
                      child: FBODetailsScrn(fboName: fboName),
                    );
                  },
                ),
              ]
            ),

            GoRoute(
              path: AppRoute.enrolledFBOs.getPath(),
              builder: (ctxt, __) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => BDEBlocProvider.get().fetchFBOs()),
                  BlocProvider(create: (_) => BDEBlocProvider.get().fetchCounts()..request()),
                ],
                child: const EnrolledFBOsList(),
              ),
              routes: [
                GoRoute(
                  path: 'fbo/:id',
                  builder: (ctxt, state) {
                    final fboId = state.pathParameters['id'];
                    final fboName = state.extra as String;

                    final blocProvider = BDEBlocProvider.get();
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (_) => blocProvider.getFBODetails()..request(fboId)),
                        BlocProvider(create: (_) => blocProvider.fboSummaryCubit()..request(fboId)),
                      ],
                      child: FBODetailsScrn(fboName: fboName),
                    );
                  },
                ),
              ],
            ),
            
            GoRoute(
              path: AppRoute.fboSummary.getPath(),
              builder: (_, GoRouterState state) => BlocProvider(
                create: (_) => BDEBlocProvider.get().fetchFBOs()..fetchInitial(const FBOListInp(status: 'None')),
                child: const FBOSummaryList(),
              ),
              routes: [
                GoRoute(
                  path: 'fbo/:id',
                  builder: (ctxt, state) {
                    final fboId = state.pathParameters['id'];
                    final fboName = state.extra as String;

                    final blocProvider = BDEBlocProvider.get();
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (_) => blocProvider.getFBODetails()..request(fboId)),
                        BlocProvider(create: (_) => blocProvider.fboSummaryCubit()..request(fboId)),
                        BlocProvider(create: (_) => blocProvider.downloadSummary()),
                      ],
                      child: FBODetailsScrn(fboName: fboName),
                    );
                  },
                ),
              ],
            ),
            
          ]
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoute.followUps.path,
          builder: (ctxt, GoRouterState state) => BlocProvider(
            create: (_) => BDEBlocProvider.get().fetchFollowUps()..fetchInitial(ctxt.activeDay),
            child: const FollowUpList(),
          ),
          routes: [
            GoRoute(
              path: AppRoute.updateFBO.getPath(),
              builder: (_, state) {
                final extra = state.extra;
                return MultiBlocProvider(
                  providers: [
                    if(extra is FBO)...[
                      BlocProvider(create:(_)=> BDEBlocProvider.get().getFBODetails()..request(extra.fboName)),
                    ]else...[
                      BlocProvider(create:(_)=> BDEBlocProvider.get().getFBODetails()),
                    ],
                    BlocProvider(create: (_) => $sl.get<EnrollFboCubit>()..initDetails(state.extra)),
                    BlocProvider(create: (_) => BDEBlocProvider.get().ucoPriceCubit()..request()),
                    BlocProvider(create: (_) => BDEBlocProvider.get().fetchRouteMaster()..request()),
                  ],
                  child: const EnrollFBOScrn(),
                );
              },
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoute.enrollmentReport.path,
          builder: (_, GoRouterState state) {
            final blocProvider = BDEBlocProvider.get();
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => blocProvider.fetchReport()..request()),
                BlocProvider(
                  create: (_) => blocProvider.downloadReport()),
                ],
              child: const EnrollReportScrn(),
            );
          },
        ),
      ],
    ),
  ];
}
