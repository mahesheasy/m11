import 'package:flutter/material.dart';
import 'package:m11_ind/app/presentation/widgets/app_feature_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/icons.dart';

mixin AccessFeaturesMixin {
  // CE
  Widget getPickupWidget(BuildContext context) => AppFeatureWidget(
        icon: AppIcons.icPickUpTruck,
        title: 'Pickup',
        onTap: () => AppRoute.pickups.push(context),
      );

  Widget getFBOsWidget(BuildContext context) => AppFeatureWidget(
        icon: AppIcons.icFBO,
        title: 'FBO',
        onTap: () => AppRoute.fbos.push(context),
      );

  Widget getDepotWidget(BuildContext context) => AppFeatureWidget(
        icon: AppIcons.isDepot,
        title: 'Depot',
        onTap: () => AppRoute.deposit.push(context),
      );

  Widget getCanRequestWidget(BuildContext context) => AppFeatureWidget(
        icon: AppIcons.icCanRequest,
        title: 'Can Request',
        onTap: () => AppRoute.canRequest.push(context),
      );
  // FBO
  Widget enrollBusiness(BuildContext context) => AppFeatureWidget(
    icon: AppIcons.enrollFBO,
    title: 'Enroll Business',
    onTap: () => AppRoute.enrollBusiness.push(context),
  );

  Widget requestExtraCans(BuildContext context) => AppFeatureWidget(
    icon: AppIcons.icCanRequest,
    title: 'Reuqest Extra Cans',
    onTap:() => AppRoute.requestExtraCans.push(context),
  );

  Widget requestUCOPickup(BuildContext context) => AppFeatureWidget(
    icon: AppIcons.icPickUpTruck,
    title: 'Request UCO Pickup',
    onTap: () => AppRoute.requestUCOPickUp.push(context),
  );

  Widget fboSummary(BuildContext context) => AppFeatureWidget(
    icon: AppIcons.bdeSummary,
    title: 'Summary',
    onTap: () => AppRoute.summary.push(context),
  );

  // BDE
  Widget getBDEEnrollFBOWidget(BuildContext context) => AppFeatureWidget(
    icon: AppIcons.enrollFBO,
    title: 'Enroll FBO',
    onTap: () => AppRoute.enrollFBO.push(context),
  );
  Widget getRoutesWidget(BuildContext context) => AppFeatureWidget(
    icon: AppIcons.routes,
    title: 'Routes',
    onTap: () => AppRoute.routes.push(context),
  );
  Widget getFBOS(BuildContext context) => AppFeatureWidget(
    icon: AppIcons.fbos,
    title: "FBO's",
    onTap: () => AppRoute.enrolledFBOs.push(context),
  );
  Widget getBDESummaryWidget(BuildContext context) => AppFeatureWidget(
    icon: AppIcons.bdeSummary,
    title: 'Summary',
    onTap: () => AppRoute.fboSummary.push(context),
  );

  // DEO
  Widget assignCE(BuildContext context) => AppFeatureWidget(
    icon: AppIcons.icAssignCE,
    title: 'Assign CE',
    onTap: () => AppRoute.assignCEList.push(context),
  );
  Widget gateEntry(BuildContext context) => AppFeatureWidget(
    icon: AppIcons.icGateEntry,
    title: 'Gate Entry',
    onTap: () => AppRoute.gateEntry.push(context),
  );
  Widget gateExit(BuildContext context) => AppFeatureWidget(
    icon: AppIcons.icGateExit,
    title: 'Gate Exit',
    onTap: () => AppRoute.gateExit.push(context),
  );
  Widget ucoDeposit(BuildContext context) => AppFeatureWidget(
    icon: AppIcons.icUCODeposit,
    title: 'UCO Deposit',
    onTap: () => AppRoute.ucoDeposit.push(context),
  );
  Widget canRequests(BuildContext context) => AppFeatureWidget(
    icon: AppIcons.icCanRequest,
    title: 'Can Request',
    onTap: () => AppRoute.fboCanRequests.push(context),
  );
  Widget monthlyReport(BuildContext context) => AppFeatureWidget(
    icon: AppIcons.icMonthlyReport,
    title: 'Monthly Report',
    onTap: () => AppRoute.monthlyReport.push(context),
  );
  Widget assignBDE(BuildContext context) => AppFeatureWidget(
    icon: AppIcons.icAssignCE,
    title: 'Assign BDE',
    onTap: () => AppRoute.assignBDEList.push(context),
  );
}
