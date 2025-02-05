import 'package:dartz/dartz.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/deo/model/app_rej_input.dart';
import 'package:m11_ind/features/deo/model/deo_montly_report.dart';
import 'package:m11_ind/features/deo/model/gate_entry_form.dart';
import 'package:m11_ind/features/deo/model/gate_exit_form.dart';
import 'package:m11_ind/features/deo/model/gate_exit.dart';
import 'package:m11_ind/features/deo/model/geo_loc_update.dart';
import 'package:m11_ind/features/deo/model/uco_deposit.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';

abstract interface class DEORepo {
  AsyncValueOf<FBODetails> getFBODetails(String fboId);
  
  AsyncValueOf<List<String>> ceUsers();
  AsyncValueOf<List<String>> bdeUsers();
  AsyncValueOf<List<String>> vehicleDrivers();
  AsyncValueOf<List<String>> getvehicleNums();
  AsyncValueOf<String> createGateExit(GateExitForm form);

  AsyncValueOf<List<FBO>> assignCEList(DateTime dateTime, int start, int end);

  AsyncValueOf<List<FBO>> fboCanRequests(DateTime dateTime, int start, int end);
  AsyncValueOf<bool> rejectCanRequest(RejectCanReqInput inp);
  AsyncValueOf<bool> approveCanRequest(ApproveCanRequest inp);

  AsyncValueOf<List<DEOMonthlyReport>> fetchMonthlyReport();

  AsyncValueOf<bool> assignCE(Pair<String, String> inp);
  AsyncValueOf<bool> assignBDE(Pair<String, String> inp);
  
  AsyncValueOf<List<UCODeposit>> ucoDepositSummary(String user);
  AsyncValueOf<List<GateExit>> gateExitList(int start);
  AsyncValueOf<bool> updateVehicleTracking(GateEntryForm form);
  AsyncValueOf<bool> ucoSubmission(String usrId);

  AsyncValueOf<None> updateGEOLocation(GeoLocUpdate inp);
}