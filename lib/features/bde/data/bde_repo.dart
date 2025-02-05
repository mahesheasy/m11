import 'dart:io';

import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/model/current_uco_price.dart';
import 'package:m11_ind/features/bde/model/enroll_fbo.dart';
import 'package:m11_ind/features/bde/model/enrollment_report.dart';
import 'package:m11_ind/features/bde/model/route_master.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/models/fbo_list_inp.dart';
import 'package:m11_ind/features/ce/models/fbo_summary.dart';
import 'package:m11_ind/features/ce/models/request_mode.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';

abstract interface class BDERepo {
  AsyncValueOf<CurrentUCOPrice> getUCOPrice();
  AsyncValueOf<int> getTaskPercent();
  AsyncValueOf<List<RouteMaster>> fetchRouteMaster(String? query);
  AsyncValueOf<bool> enrollFBO(EnrollFBO fbo);

  AsyncValueOf<List<EnrollmentReport>> getEmrollmentReport();
  AsyncValueOf<File> downloadEnrollmentReport(List<EnrollmentReport> ucoData);
  AsyncValueOf<File> downloadSummary(FBOSummary summary);

  AsyncValueOf<List<FBO>> fetchRoutesList(String route, String? query, int start, int end);
  AsyncValueOf<FBODetails> getFBODetails(String fboId);
  AsyncValueOf<FBOSummary> fetchFBOSummary(String fboId);
  AsyncValueOf<List<FBODetails>> fetchFollowUPs(DateTime dateTime, int start, int end);

  AsyncValueOf<List<RequestMode>> fetchFBOCounts();
  AsyncValueOf<List<FBO>> fetchFBOs(FBOListInp inp, int start, int end);
}