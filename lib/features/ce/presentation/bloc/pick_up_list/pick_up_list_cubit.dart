import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';

typedef PickUpListCubit = InfiniteListCubit<FBO, Triple<DateTime, String,String?>, Triple<DateTime, String,String?>>;
typedef PickUpListCubitState = InfiniteListState<FBO>;