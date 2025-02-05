import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/app/presentation/bloc/location_distance/location_distance_cubit.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_fbo_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/can_submission/can_submission_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/ce_bloc_provider.dart';
import 'package:m11_ind/features/ce/presentation/bloc/pick_up_summary/pick_up_summary_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ce_dashboard.dart';
import 'package:m11_ind/features/ce/presentation/ui/can_request/can_req_submission.dart';
import 'package:m11_ind/features/ce/presentation/ui/can_request/can_request_list.dart';
import 'package:m11_ind/features/ce/presentation/ui/collection_report/collection_report_scrn.dart';
import 'package:m11_ind/features/ce/presentation/ui/deposit/deposit_scrn.dart';
import 'package:m11_ind/features/ce/presentation/ui/fbos/fbo_details_scrn.dart';
import 'package:m11_ind/features/ce/presentation/ui/fbos/fbo_list_widget.dart';
import 'package:m11_ind/features/ce/presentation/ui/missed_collections/missed_collections_scrn.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/pick_up_entry.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/pick_ups_scrn.dart';
import 'package:m11_ind/features/notifications/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/notifications/ui/presentation/notifications_scrn.dart';

abstract class CEShellRouter {
  static final shellNavKey = GlobalKey<NavigatorState>();
  bool confirmationShown = false;
  static final ceoShellRouter = [
    StatefulShellBranch(
      initialLocation: AppRoute.ceDashboard.path,
      navigatorKey: shellNavKey,
      routes: <RouteBase>[
        GoRoute(
          path: AppRoute.ceDashboard.path,
          builder: (_, GoRouterState state) => const CEDashBoardScrn(),
          routes: [
            GoRoute(
              path: AppRoute.ceoNotifications.getPath(),
              builder: (context, state) => BlocProvider(
                create: (_) =>
                    NotificationsBlocProvider.get().fetchNotifications()
                      ..fetchInitial(),
                child: const NotificationsScrn(),
              ),
            ),
            GoRoute(
              path: AppRoute.pickups.getPath(),
              builder: (ctxt, __) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                      create: (_) => CEBlocProvider.get().fetchPickUps()),
                  BlocProvider(
                      create: (_) => CEBlocProvider.get().fetchCount()
                        ..request(ctxt.activeDay)),
                ],
                child: const PickUpsScreen(),
              ),
              routes: [
                GoRoute(
                  path: AppRoute.pickupEntry.getPath(),
                  builder: (ctxt, state) {
                    final params = state.extra as Map<String, dynamic>;
                    final fboId = params['name'] as String;
                    final latitude = params['latitude'];
                    final longitude = params['longitude'];

                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(
                            create: (_) => CEBlocProvider.get().getFBODetails()
                              ..request(fboId)),
                        BlocProvider(
                            create: (_) => $sl.get<PickUpSummaryCubit>()),
                        BlocProvider(
                            create: (_) => LocationDistanceCubit()
                              ..getDistance(latitude, longitude)),
                      ],
                      child: PickUpEntryScrn(fboId: fboId),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: AppRoute.fbos.getPath(),
              builder: (ctxt, __) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                      create: (_) => CEBlocProvider.get().fetchCount()),
                  BlocProvider(create: (_) => CEBlocProvider.get().fetchFBOs()),
                  BlocProvider(
                      create: (_) =>
                          BDEBlocProvider.get().fetchRouteMaster()..request()),
                ],
                child: const FBOListWidget(),
              ),
              routes: [
                GoRoute(
                  path: 'fboDetails',
                  name: 'fboDetails',
                  builder: (ctxt, state) {
                    final queryParameters = state.extra as Map;
                    final fboId = queryParameters['fbo_id'];
                    final fboName = queryParameters['fbo_name'];
                    // final form = state.extra as FBO?;
                    final blocProvider = CEBlocProvider.get();
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(
                            create: (_) =>
                                blocProvider.getFBODetails()..request(fboId)),
                        BlocProvider(
                            create: (_) =>
                                blocProvider.fboSummaryCubit()..request(fboId)),
                        BlocProvider(
                            create: (_) => blocProvider.remindFBOCubit()),
                        BlocProvider(
                            create: (_) =>
                                blocProvider.updateFssaiNumber()),
                                BlocProvider(create: (_) =>  $sl.get<EnrollFboCubit>()),
                      ],
                      child: FBODetailsScrn(fboName: fboName),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: AppRoute.deposit.getPath(),
              builder: (ctxt, __) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                      create: (_) =>
                          CEBlocProvider.get().depoMasterCubit()..request()),
                  BlocProvider(
                      create: (_) => CEBlocProvider.get().depositSummaryCubit()
                        ..request()),
                ],
                child: const DepositScrn(),
              ),
            ),
            GoRoute(
                path: AppRoute.canRequest.getPath(),
                builder: (ctxt, _) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                            create: (_) => CEBlocProvider.get().fetchCount()
                              ..request(ctxt.activeDay)),
                        BlocProvider(
                            create: (_) => CEBlocProvider.get().canRequests()
                              ..fetchInitial(ctxt.activeDay)),
                      ],
                      child: CanRequestList(),
                    ),
                routes: [
                  GoRoute(
                    path: 'submission',
                    builder: (ctxt, state) {
                      final params = state.extra as Map<String, dynamic>;
                      final fboId = params['id'] as String;
                      final name = params['name'] as String;
                      final canReqId = params['can_req_id'] as String;

                      final blocProvider = CEBlocProvider.get();
                      return MultiBlocProvider(
                        providers: [
                          BlocProvider(
                              create: (_) =>
                                  blocProvider.getFBODetails()..request(fboId)),
                          BlocProvider(
                              create: (_) => blocProvider.canReSummaryCubit()
                                ..request(fboId)),
                          BlocProvider(
                              create: (_) => blocProvider.canReqDetailsCubit()
                                ..request(canReqId)),
                          BlocProvider(
                              create: (_) => $sl.get<CanSubmissionCubit>()
                                ..initFBO(canReqId)),
                        ],
                        child: CanReqSubmission(fboName: name),
                      );
                    },
                  ),
                ]),
          ],
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoute.missedCollections.path,
          builder: (ctxt, GoRouterState state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => CEBlocProvider.get().fetchMissedCollection()
                    ..fetchInitial(ctxt.activeDay),
                ),
              ],
              child: MissedCollectionsScrn(),
            );
          },
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoute.collectionReport.path,
          builder: (ctxt, GoRouterState state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (_) => CEBlocProvider.get().fetchCollectionReport()
                      ..request(ctxt.activeDay)),
                BlocProvider(
                    create: (_) => CEBlocProvider.get().downloadRepo()),
              ],
              child: CollectionReportScrn(),
            );
          },
        ),
      ],
    ),
  ];
}
