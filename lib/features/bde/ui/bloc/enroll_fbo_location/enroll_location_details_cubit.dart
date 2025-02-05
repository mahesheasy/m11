// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:injectable/injectable.dart';
// import 'package:m11_ind/core/core.dart';
// import 'package:m11_ind/features/ce/data/ce_repo.dart';
// import 'package:m11_ind/features/ce/models/location_details.dart';
// part 'enroll_location_details_cubit.freezed.dart';

// @injectable
// class EnrollLocationDetailsCubit extends AppBaseCubit<EnrollLocationDetailsState> {
//   EnrollLocationDetailsCubit(this.repo) : super(EnrollLocationDetailsState.initial());

//   final CERepo repo;

//   void updatefields({
//      String? fboName,
//      String? locationName,
//      String? locationAddress,
//      String? locationCity,
//      String? locationState,
//      String? locationZip,
//      String? locationStreet,
//      String? latitude,
//      String? longitude,
//       }) {
//     final lDetails = state.details;
//     var updateDetails = lDetails.copyWith(
//         city: locationCity ?? lDetails.city,
//         name: fboName ?? lDetails.name,
//         locality: locationAddress ?? lDetails.locality,
//         state: locationState ?? lDetails.state,
//         pinCode: locationZip ?? lDetails.pinCode,
//         street: locationStreet ?? lDetails.street,
//         latitude: latitude ?? lDetails.latitude,
//         longitude: longitude ?? lDetails.longitude
//         );
//         emitSafeState(state.copyWith(details: updateDetails,));
//   }

//  Future <void> onCompleted()async {
//         emitSafeState(state.copyWith(isLoading: true));

//     try {
//           final res = await repo.enrollFboLocationDetails(state.details);
//     res.fold(
//       (l) => emitSafeState(state.copyWith(error: l, isLoading: false)), 
//       (r) => emitSafeState(state.copyWith(details: state.details, error: null , isLoading: false,isSuccess: true)), 
//     );
      
//     }on Exception catch (e,st) {
//       emitError(e.toString());
      
//     }

//   }

//   void emitError(String error) {
//     final failure = Failure(error: error);
//     emitSafeState(state.copyWith(error: failure));
//   }
// }

// @freezed
// class EnrollLocationDetailsState with _$EnrollLocationDetailsState {
//   const factory EnrollLocationDetailsState({
//     required EnrollLocationDetails details,
//     required bool isLoading,
//     required bool isSuccess,
//     Failure? error,
//   }) = _EnrollLocationDetailsState;

//   factory EnrollLocationDetailsState.initial() =>
//       const EnrollLocationDetailsState(
//         details: EnrollLocationDetails(),
//         isLoading: false,
//         isSuccess: false,
//         error: null,
//       );
// }
