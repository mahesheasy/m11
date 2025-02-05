import 'dart:io';

import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/model/enrollment_report.dart';

typedef DownloadEnrollReportCubit = NetworkRequestCubit<File, List<EnrollmentReport>>;
typedef DownloadReportState = NetworkRequestState<File>;