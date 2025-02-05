import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/model/enroll_fbo.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';

typedef FBODetailsCubit = NetworkRequestCubit<FBODetails, String>;
typedef FBODetailsCubitState = NetworkRequestState<FBODetails>;

typedef UpdateFssaiCubit = NetworkRequestCubit<String, EnrollFBO>;
typedef UpdateFssaiCubitState = NetworkRequestState<String>;
