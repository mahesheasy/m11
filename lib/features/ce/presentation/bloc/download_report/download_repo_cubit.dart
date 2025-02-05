import 'dart:io';

import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/collection_report.dart';

typedef DownloadReportCubit = NetworkRequestCubit<File, List<CollectionReport>>;
typedef DownloadReportState = NetworkRequestState<File>;