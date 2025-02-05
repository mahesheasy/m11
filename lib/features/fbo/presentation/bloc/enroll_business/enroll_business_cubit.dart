import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/fbo/data/fbo_repo.dart';
import 'package:m11_ind/features/fbo/models/enroll_business_form.dart';

part 'enroll_business_cubit.freezed.dart';

@injectable
class EnrollBusinessCubit extends AppBaseCubit<EnrollBusinessState> {
  EnrollBusinessCubit(this.repo) : super(EnrollBusinessState.initial());

  final FBORepo repo;

  void onFieldChange({
    String? managerName,
    String? businessName,
    String? address,
    String? mobileNumber,
    String? type,
    String? fboState,
    String? fboCity,
  }) {
    final form = state.form;
    emitSafeState(state.copyWith(
      form: form.copyWith(
        managerName: managerName ?? form.managerName,
        businessName: businessName ?? form.businessName,
        address: address ?? form.address,
        mobileNumber: mobileNumber ?? form.mobileNumber,
        state: fboState ?? form.state,
        city: fboCity ?? form.city,
        type: type ?? form.type,
      ),
    ));
  }

  void enroll() async {
    final validation = _validate();
    return validation.fold(
      () async {
        final enrolledForm = state.form;
        final modifiedForm = enrolledForm.copyWith(mobileNumber: '+91 ${enrolledForm.mobileNumber}');
        emitSafeState(state.copyWith(isLoading: true, isSuccess: false, error: null));
        final response = await repo.enrollBusiness(modifiedForm);
        return response.fold(
          (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
          (r) => emitSafeState(state.copyWith(isLoading: false, isSuccess: r)),
        );
      }, 
      _emitError,
    );
  }

  void _emitError(String error) {
    final failure = Failure(error: error);
    emitSafeState(state.copyWith(error: failure));
  }

  void errorHandled() {
    emitSafeState(state.copyWith(error: null));
  }

  Option<String> _validate() {
    final form = state.form;
    if(form.managerName.doesNotHaveValue) {
      return optionOf('Enter FBO Manager Name');
    } else if(form.businessName.doesNotHaveValue) {
      return optionOf('Enter Business Name');
    } else if(form.type.doesNotHaveValue) {
      return optionOf('Select Supplier Type');
    } else if(form.address.doesNotHaveValue) {
      return optionOf('Enter Address');
    } else if(form.mobileNumber.doesNotHaveValue) {
      return optionOf('Enter your Mobile Number');
    } else if(form.mobileNumber!.length != 10) {
      return optionOf('Enter valid Mobile Number');
    } else if(form.state.doesNotHaveValue) {
      return optionOf('Select State');
    } else if(form.city.doesNotHaveValue) {
      return optionOf('Enter City');
    }
    return const None();
  }
}

@freezed
class EnrollBusinessState with _$EnrollBusinessState {
  const factory EnrollBusinessState({
    required EnrollBusinessForm form,
    required bool isLoading,
    required bool isSuccess,
    Failure? error,
  }) = _EnrollBusinessState;

  factory EnrollBusinessState.initial() => EnrollBusinessState(
      form: EnrollBusinessForm(),
      isLoading: false,
      isSuccess: false,
    );
}