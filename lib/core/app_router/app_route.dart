import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class _AppRoutePaths {
  static const initial = '/';
  static const login = '/login';
  static const register = '/register';
  static const forgotpswd = '/forgotpswd';
  static const ceoNotifications= '/ceDashboard/notifications';
  static const bdeNotifications= '/bdeDashboard/notifications';
  static const deoNotifications= '/notifications';

  // CE
  static const ceDashboard = '/ceDashboard';
  static const pickUps = '/ceDashboard/pickups';
  static const pickupEntry = '/ceDashboard/pickups/entry';
  static const fbos = '/ceDashboard/fbos';
  static const fboDetails = '/ceDashboard/fbos/fboDetails';
  static const deposit = '/ceDashboard/deposit';
  static const canRequest = '/ceDashboard/canRequest';
  static const canRequestSubmission = '/ceDashboard/canRequest/submission';
  static const missedCollections = '/missedCollections';
  static const collectionReport = '/collectionReport';

  // FBO
  static const fboDashboard = '/fboDashboard';
  static const accountDetails = '/fboDashboard/accountDetails';
  static const enrollBusiness = '/fboDashboard/enrollBusiness';
  static const requestExtraCans = '/fboDashboard/requestExtraCans';
  static const requestUCOPickUp = '/fboDashboard/requestUCOPickUp';
  static const summary = '/fboDashboard/summary';
  static const ucoEnrollment = '/fboDashboard/ucoEnrollment';
  static const fboNotifications = '/fboDashboard/fboNotifications';

  // BDE
  static const bdeDashboard = '/bdeDashboard';
  static const enrollFBO = '/bdeDashboard/enrollFBO';
  static const routes = '/bdeDashboard/routes';
  static const bdeRoutes = '/bdeDashboard/routes/bdeRoutes/:id';
  static const enrolledFBOs = '/bdeDashboard/enrolledFBOs';
  static const enrolledFBODetail = '/bdeDashboard/enrolledFBOs/fbo/:id';
  static const fboSummary = '/bdeDashboard/fboSummary';
  static const summFBODetail = '/bdeDashboard/fboSummary/fbo/:id';
  static const followUps = '/followUps';
  static const updateFBO = '/followUps/fbo';
  static const enrollmentReport = '/enrollmentReport';

  // DEO
  static const missedCanRequests = '/missedCanRequests';
  static const deoDashboard = '/deoDashboard';
  static const gateEntry = '/deoDashboard/gateEntry';
  static const gateExit = '/deoDashboard/gateExit';
  static const fboCanRequests = '/deoDashboard/fboCanRequests';
  static const fboCanRequestsApp = '/deoDashboard/fboCanRequests/Approval';

  static const assignCEList = '/deoDashboard/assignCEList';
  static const assignBDEList = '/deoDashboard/assignBDEList';

  static const ucoDeposit = '/deoDashboard/ucoDeposit';

  static const monthlyReport = '/deoDashboard/monthlyReport';
}

enum AppRoute {
  splash(_AppRoutePaths.initial),
  login(_AppRoutePaths.login),
  register(_AppRoutePaths.register),
  forgotpswd(_AppRoutePaths.forgotpswd),
  accountDetails(_AppRoutePaths.accountDetails),
  bdeNotifications(_AppRoutePaths.bdeNotifications),
  ceoNotifications(_AppRoutePaths.ceoNotifications),
  deoNotifications(_AppRoutePaths.deoNotifications),

  // CE
  ceDashboard(_AppRoutePaths.ceDashboard),
  pickups(_AppRoutePaths.pickUps),
  pickupEntry(_AppRoutePaths.pickupEntry),
  fbos(_AppRoutePaths.fbos),
  fboDetails(_AppRoutePaths.fboDetails),

  deposit(_AppRoutePaths.deposit),

  canRequest(_AppRoutePaths.canRequest),
  canRequestSubmission(_AppRoutePaths.canRequestSubmission),

  missedCollections(_AppRoutePaths.missedCollections),
  collectionReport(_AppRoutePaths.collectionReport),

  // PickUp
  fboDashboard(_AppRoutePaths.fboDashboard),
  enrollBusiness(_AppRoutePaths.enrollBusiness),
  requestExtraCans(_AppRoutePaths.requestExtraCans),
  requestUCOPickUp(_AppRoutePaths.requestUCOPickUp),
  summary(_AppRoutePaths.summary),
  ucoEnrollment(_AppRoutePaths.ucoEnrollment),
  fboNotifications(_AppRoutePaths.fboNotifications),

  // BDE
  bdeDashboard(_AppRoutePaths.bdeDashboard),
  enrollFBO(_AppRoutePaths.enrollFBO),
  routes(_AppRoutePaths.routes),
  bdeRoutes(_AppRoutePaths.bdeRoutes),
  enrolledFBOs(_AppRoutePaths.enrolledFBOs),
  enrolledFBODetail(_AppRoutePaths.enrolledFBODetail),
  fboSummary(_AppRoutePaths.fboSummary),
  summFBODetail(_AppRoutePaths.summFBODetail),
  enrollmentReport(_AppRoutePaths.enrollmentReport),
  followUps(_AppRoutePaths.followUps),
  updateFBO(_AppRoutePaths.updateFBO),

  // DEO 
  missedCanRequests(_AppRoutePaths.missedCanRequests),

  deoDashboard(_AppRoutePaths.deoDashboard),
  gateEntry(_AppRoutePaths.gateEntry),
  gateExit(_AppRoutePaths.gateExit),
  fboCanRequests(_AppRoutePaths.fboCanRequests),
  fboCanRequestsApp(_AppRoutePaths.fboCanRequestsApp),

  assignCEList(_AppRoutePaths.assignCEList),
  assignBDEList(_AppRoutePaths.assignBDEList),

  ucoDeposit(_AppRoutePaths.ucoDeposit),

  monthlyReport(_AppRoutePaths.monthlyReport);

  const AppRoute(this.path);
  final String path;
}

extension AppRouteNavigation on AppRoute {
  void go(BuildContext context, {Object? extra}) {
    context.go(path, extra: extra);
  }

  void goNamed(BuildContext context, {Object? extra}) {
    context.goNamed(path, extra: extra);
  }

  Future<T?> push<T>(BuildContext context, {Object? extra}) async {
    return await context.push(path, extra: extra);
  }

  String getPath() => path.split('/').last;
  String getPathName() => path.split('/').last;
}
