import 'dart:io';
import 'dart:typed_data';

import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/model/enroll_fbo.dart';
import 'package:m11_ind/features/ce/models/can_request.dart';
import 'package:m11_ind/features/ce/models/can_request_summary.dart';
import 'package:m11_ind/features/ce/models/collection_report.dart';
import 'package:m11_ind/features/ce/models/depo_master.dart';
import 'package:m11_ind/features/ce/models/deposit_summary.dart';
import 'package:m11_ind/features/ce/models/fbo_list_inp.dart';
import 'package:m11_ind/features/ce/models/fbo_summary.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/models/pick_up_summary.dart';
import 'package:m11_ind/features/ce/models/pr_details.dart';
import 'package:m11_ind/features/ce/models/request_mode.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';

abstract interface class CERepo {
  AsyncValueOf<List<FBO>> fetchPickUpList(DateTime dateTime, String mode, String? query);
  AsyncValueOf<List<FBO>> fetchCanRequests(DateTime dateTime);
  AsyncValueOf<List<FBO>> fetchMissedCollections(DateTime dateTime);

  AsyncValueOf<List<RequestMode>> fetchCount(DateTime? dateTime);

  AsyncValueOf<List<FBO>> fetchFBOs(FBOListInp inp);
  AsyncValueOf<FBODetails> getFBODetails(String fboId);
  AsyncValueOf<FBOSummary> fetchFBOSummary(String fboId);
  AsyncValueOf<bool> remindFBO(String fboId);

  AsyncValueOf<DepoMaster> fetchDepoMaster();
  AsyncValueOf<DepositSummary> fetchDepositSummary();
  AsyncValueOf<CanRequest> canRequestDetails(String requestId);
  AsyncValueOf<CanRequestSummary> canRequestSummary(String fboName);
  AsyncValueOf<bool> updateCanIssue(String id, int cans);

  AsyncValueOf<List<CollectionReport>> fetchCollectionReport(DateTime dateTime);
  AsyncValueOf<File> downloadUCOReport(List<CollectionReport> ucoData);
  AsyncValueOf<PRDetails> createNewPickUp(NewPickUpSummary pickUp);

  AsyncValueOf<bool> updateVisitRemarks(String fboId, String remarks, String? otherRemarks, String? scheduleDate);
  AsyncValueOf<Uint8List> downloadGRNFile(String url);
  AsyncValueOf<String> updateFssai (EnrollFBO form);
}