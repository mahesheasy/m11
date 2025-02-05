import 'package:m11_ind/core/core.dart';

final _reqisteredUrl = $sl.get<Urls>();

class Urls {
  factory Urls.test() => const Urls('https://m11ucouat.easycloud.co.in/api');
  factory Urls.prod() => const Urls('https://rucoprd.sunpure.in/api');
  factory Urls.local() => const Urls('http://192.168.0.121:8000/api');

  const Urls(this.url);
  static String filepath(String path) => '${baseUrl.replaceAll('api', '')}/$path';

  final String url;

  static const m11Site = 'https://m11.co.in/';

  static final baseUrl = _reqisteredUrl.url;
  static final jsonWs = '$baseUrl/resource';
  static final cusWs = '$baseUrl/method';
  static bool isTest = baseUrl.startsWith('https://m11ucouat');

  static final login = '$cusWs/login';
  static final getList = '$cusWs/frappe.client.get_list';
  static final getUsers = '$cusWs/m11.api.getUsers';
  static final createUser = '$cusWs/m11.api.createUser';
  static final forgotPswd = '$cusWs/m11.api.forgot_password';
  static final sendOTP = '$cusWs/digimilesintegration.api.send_otp';

  // BDE
  static final enrollFBO = '$cusWs/m11.api.enrollfbo';
  static final routes = '$cusWs/m11.api.routes';
  static final enrollmentReport = '$cusWs/m11.api.enrollment_report';
  static final fboCounts = '$cusWs/m11.api.enrolled_fbos_count';
  static final followUps = '$cusWs/m11.api.follow_ups';
  static final fbos = '$cusWs/m11.api.getfbos';
  static final routeMaster = '$jsonWs/${Doctype.routeMaster}';
  static final supplier = '$jsonWs/${Doctype.supplier}';

  // CE
  static final pickUpList = '$cusWs/m11.api.pickups';
  static final newPickupSummary = '$cusWs/m11.api.newpickupsummary';
  static final missedcollections = '$cusWs/m11.api.missedcollections';
  static final canRequests = '$cusWs/m11.api.getcanrequest';
  static final taggedfbos = '$cusWs/m11.api.taggedfbos';
  static final collectionReport = '$cusWs/m11.api.collection_report';
  static final depoDetails = '$cusWs/m11.api.depot_master_details';
  static final depositSummary = '$cusWs/m11.api.new_deposit_summary';
  static final canReqSummary = '$cusWs/m11.api.can_req_summary';
  static final canReqDetails = '$jsonWs/${Doctype.canRequest}'; // Can Request
  static final canIssue = '$cusWs/m11.api.updatecanrequest';
  static final updateFssai = '$cusWs/m11.api.update_supplier';

  // FBO
  static final ucoPrice = '$cusWs/m11.api.get_uco_price';
  static final enrollbusiness = '$cusWs/m11.api.enrollbusiness';
  static final fboStatus = '$cusWs/m11.api.fbo_status';
  static final canRequest = '$cusWs/m11.api.can_request';
  static final requestUCO = '$cusWs/m11.api.request_uco';
  static final fboSummary = '$cusWs/m11.api.fbo_summary';

  // DEO
  static final ceVehicleMaster = '$cusWs/m11.api.ce_vehicle_master';
  static final bdeUsers = '$cusWs/m11.api.bde_users';
  static final createVehicleTracking = '$cusWs/m11.api.createVehicleTracking';
  static final updateVehicleTracking = '$cusWs/m11.api.updateVehicleTracking';
  static final fboCanRequests = '$cusWs/m11.api.fbo_can_requests';
  static final canAppReject = '$cusWs/m11.api.can_approve_reject';
  static final assignCEList = '$cusWs/m11.api.assign_ce_list';
  static final assignCE = '$cusWs/m11.api.assign_ce';
  static final assignBDE = '$cusWs/m11.api.assign_bde';
  static final ceSummaryReport = '$cusWs/m11.api.ce_summary_report';
  static final gateExitList = '$cusWs/m11.api.getgateexit';
  static final monthlyReport = '$cusWs/m11.api.deo_monthly_report';
  static final ucoDeposit = '$cusWs/m11.api.uco_deposit';
} 

abstract class Doctype {
  static const user = 'User';
  static const routeMaster = 'Route Master';
  static const supplier = 'Supplier';
  static const canRequest = 'Can Request';
  static const vehicleMaster = 'Vehicle Master';
  static const vehicleTracking = 'Vehicle Tracking';
}