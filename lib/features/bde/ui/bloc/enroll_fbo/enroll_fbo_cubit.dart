import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/data/bde_repo.dart';
import 'package:m11_ind/features/bde/data/static_data.dart';
import 'package:m11_ind/features/bde/model/bank_details.dart';
import 'package:m11_ind/features/bde/model/current_uco_price.dart';
import 'package:m11_ind/features/bde/model/enroll_fbo.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_stage.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';

part 'enroll_fbo_cubit.freezed.dart';

@injectable
class EnrollFboCubit extends AppBaseCubit<EnrollFboState> {
  EnrollFboCubit(this.repo) : super(EnrollFboState.initial());

  final BDERepo repo;

  void initPrice(CurrentUCOPrice price) {
    final form = state.form;
    final updatedForm = form.copyWith(
      ratePerKilogram: price.basePrice,
      gstPercent: price.gstPercent,
      basePrice: price.basePrice,
    );
    emitSafeState(state.copyWith(form: updatedForm));
  }

  void initDetails(Object? fbo) {
    if (fbo.isNull) return;
    if (fbo is FBO) {
      final form = EnrollFBO.fromFBO(fbo);
      emitSafeState(state.copyWith(form: form));
    } else if (fbo is FBODetails) {
      final form = EnrollFBO.fromDetails(fbo);
      emitSafeState(state.copyWith(form: form));
    }
  }

  void onFieldChange({
    String? managerName,
    String? fboName,
    String? fboType,
    String? addressLine1,
    String? supplierType,
    String? restaurantType,
    String? primaryAddress,
    String? route,
    String? country,
    String? fboState,
    String? city,
    String? pincode,
    String? mobileNumber,
    String? landlineNumber,
    String? email,
    String? gstinNumber,
    String? fssaiNumber,
    String? certificateImageUrl,
    String? website,
    String? ratePerKg,
    double? latitude,
    double? longitude,
    String? otherRemarks,
    String? followDate,
    String? ucoDate,
    String? ucoTime,
    String? photoUrl,
    //
    String? noOfItems,
    String? noOfFriedItems,
    String? seatingCapacity,
  }) {
    final form = state.form;
    var updatedForm = form.copyWith(
      managerName: managerName ?? form.managerName,
      businessName: fboName ?? form.fboName,
      fboName: fboName ?? form.fboName,
      fboType: fboType ?? form.fboType,
      noOfMenuItems:
          noOfItems.isNotNull ? int.tryParse(noOfItems!) : form.noOfMenuItems,
      noOfFriedItems: noOfFriedItems.isNotNull
          ? int.tryParse(noOfFriedItems!)
          : form.noOfFriedItems,
      seatingCapacity: seatingCapacity.isNotNull
          ? int.tryParse(seatingCapacity!)
          : form.seatingCapacity,
      addressLine1: addressLine1 ?? form.addressLine1,
      address: primaryAddress ?? form.address,
      country: country ?? form.country,
      state: fboState ?? form.state,
      city: city ?? form.city,
      followupDate: followDate ?? form.followupDate,
      pincode: pincode ?? form.pincode,
      mobileNumber: mobileNumber ?? form.mobileNumber,
      landLineNumber: landlineNumber ?? form.landLineNumber,
      email: email ?? form.email,
      gstinNumber: gstinNumber ?? form.gstinNumber,
      fssaiNumber: fssaiNumber ?? form.fssaiNumber,
      route: route ?? form.route,
      website: website ?? form.website,
      ratePerKilogram: ratePerKg.isNotNull
          ? double.tryParse(ratePerKg!)
          : form.ratePerKilogram,
      latitude: latitude ?? form.latitude,
      longitude: longitude ?? form.longitude,
      ucoCollectionDate: ucoDate ?? form.ucoCollectionDate,
      ucoCollectionTime: ucoTime ?? form.ucoCollectionTime,
      otherRemarks: otherRemarks ?? form.otherRemarks,
      supplierType: supplierType ?? form.supplierType,
      photoUrl: photoUrl ?? form.photoUrl,
      certificateImageUrl: certificateImageUrl ?? form.certificateImageUrl,
      restaurantType: restaurantType ?? form.restaurantType,
    );
    if (fboType.isNotNull) {
      if (updatedForm.isRegistered) {
        final basePrice = state.form.basePrice;
        final gstPercent = state.form.gstPercent;
        if (gstPercent.isNotNull && basePrice.isNotNull) {
          final netPrice = NumUtils.calcGST(basePrice!, gstPercent!);
          updatedForm = updatedForm.copyWith(ratePerKilogram: netPrice);
        }
      } else {
        updatedForm =
            updatedForm.copyWith(ratePerKilogram: state.form.basePrice);
      }
    }

    emitSafeState(state.copyWith(form: updatedForm));
  }

  void onUpdateRemarks(final String remarks) {
    late final EnrollStage nextStep;
    if (remarks == 'Follow up') {
      nextStep = EnrollStage.followup;
    } else if (remarks == 'Not Interested') {
      nextStep = EnrollStage.notinterested;
    } else {
      nextStep = EnrollStage.bankdetails;
    }
    final formWithRemarks = state.form.copyWith(remarks: remarks);
    emitSafeState(
        state.copyWith(finishedStage: nextStep, form: formWithRemarks));
  }

  void uploadPhoto(File? file) {
    if (file.isNotNull) {
      final form = state.form;
      final fileByteData = file!.readAsBytesSync();
      final decodedData = base64Encode(fileByteData);
      
      $logger.devLog('decod:$decodedData');
      emitSafeState(state.copyWith(
          form: form.copyWith(
        photo: decodedData,
      )));
    }
  }

  void uploadImage(File? file) {
    $logger.devLog('IN CUBIT METHOS: $file');
    if (file.isNotNull) {
      final form = state.form;
      final fileByteData = file!.readAsBytesSync();
      final decodedData = base64Encode(fileByteData);
      emitSafeState(state.copyWith(
          form: form.copyWith(
        certificateImage: decodedData,
      )));
    }
  }

  void addBankDetails({
    String? beneficiaryName,
    String? bankName,
    String? bankAccNumber,
    String? reEnterBankAccNum,
    String? ifscCode,
    String? paymentType,
    String? upiId,
  }) {
    final bankDetails = state.form.bankDetails ?? BankDetails();
    final updatedBankDetails = bankDetails.copyWith(
      beneficiaryName: beneficiaryName ?? bankDetails.beneficiaryName,
      accountNumber: bankAccNumber ?? bankDetails.accountNumber,
      bankName: bankName ?? bankDetails.bankName,
      reenterAccNumber: reEnterBankAccNum ?? bankDetails.reenterAccNumber,
      ifscCode: ifscCode ?? bankDetails.ifscCode,
      paymentType: paymentType ?? bankDetails.paymentType,
      upiId: upiId ?? bankDetails.upiId,
    );
    final form = state.form.copyWith(bankDetails: updatedBankDetails);
    emitSafeState(state.copyWith(
        form: form.copyWith(paymentType: updatedBankDetails.paymentType)));
  }

  void emitLoader() => emitSafeState(state.copyWith(isLoading: true));

  void validateDetails() async {
    final validation = _validateBasicDetails();
    return validation.fold(
      () => emitSafeState(state.copyWith(stage: EnrollStage.location)),
      emitError,
    );
  }

  void emitError(String error) {
    final failure = Failure(error: error);
    emitSafeState(state.copyWith(error: failure));
  }

  Option<String> _validateBasicDetails() {
    final form = state.form;
    if (form.managerName.doesNotHaveValue) {
      return optionOf('Enter FBO Manager Name');
    } else if (form.fboName.doesNotHaveValue) {
      return optionOf('Enter FBO Name');
    } else if (form.supplierType.doesNotHaveValue) {
      return optionOf('Select Supplier Type');
    } else if (form.route.doesNotHaveValue) {
      return optionOf('Select Route');
    } else if (form.noOfMenuItems.isNull) {
      return optionOf('Enter No.of Items in the Menu');
    } else if (form.noOfFriedItems.isNull) {
      return optionOf('Enter No.of Fried Items in the Menu');
    } else if (form.seatingCapacity.isNull) {
      return optionOf('Enter Seating Capacity');
    } else if (form.addressLine1.doesNotHaveValue) {
      return optionOf('Enter FBO Address');
    } else if (form.state.doesNotHaveValue) {
      return optionOf('Select State');
    } else if (form.country.doesNotHaveValue) {
      return optionOf('Enter Country');
    } else if (form.city.doesNotHaveValue) {
      return optionOf('Enter City');
    } else if (form.mobileNumber.doesNotHaveValue) {
      return optionOf("Enter FBO's Mobile Number");
    } else if (!StringUtils.isValidIndianMobile(form.mobileNumber!)) {
      return optionOf("Enter valid FBO's Mobile Number");
    } else if (form.email.doesNotHaveValue) {
      return optionOf("Enter FBO's Email Address");
    } else if (!StringUtils.validateEmail(form.email!)) {
      return optionOf("Enter Valid FBO's Email Address");
    } else if (form.pincode.doesNotHaveValue) {
      return optionOf('Enter Pincode');
    } else if (form.pincode?.length != 6) {
      return optionOf('Enter Valid 6 digit Pincode');
    } else if (form.isRegistered) {
      if (form.gstinNumber.doesNotHaveValue) {
        return optionOf('Enter registered GSTIN No.');
      } else if (form.gstinNumber.containsValidValue) {
        final isvalid = StringUtils.validateGSTIn(form.gstinNumber!);
        if (!isvalid) return optionOf('Enter Valid GSTIN No.');
      }
    }
    if (form.fssaiNumber.doesNotHaveValue) {
      return optionOf(
          'Please enter the FSSAI Number. It is a 14-digit numeric code.');
    } else if (!StringUtils.isValidFSSAINumber(form.fssaiNumber!)) {
      return optionOf(
        'The FSSAI Number entered is invalid. Ensure it is exactly 14 digits and contains only numbers.',
      );
    } else if (form.certificateImage.isNull &&
        form.certificateImageUrl.isNull) {
      return optionOf('Capture FSSAI Cerificate Image');
    }

    return const None();
  }

  void completeBankDetails() =>
      _validateBankDetails().fold(nextStep, emitError);

  Option<String> _validateBankDetails() {
    final bankDetails = state.form.bankDetails;
    if (bankDetails.isNull) {
      return optionOf('Enter Bank Details');
    }
    if (bankDetails!.upiId.doesNotHaveValue) {
      return optionOf('Enter UPI ID');
    }
    // else if (StringUtils.validateUPI(bankDetails.upiId!)) {
    //   print(bankDetails.upiId);
    //   return optionOf('Enter Valid UPI ID');
    // }
    else if (bankDetails.paymentType.doesNotHaveValue) {
      return optionOf('Select Payment Type');
    }
    final isCreditBased = bankDetails.paymentType == 'Credit';

    if (isCreditBased) {
      if (bankDetails.beneficiaryName.doesNotHaveValue) {
        return optionOf('Enter Beneficiary Name');
      } else if (bankDetails.bankName.doesNotHaveValue) {
        return optionOf('Enter Bank Name');
      } else if (bankDetails.accountNumber.doesNotHaveValue) {
        return optionOf('Enter Bank Account Number');
      } else if (bankDetails.reenterAccNumber.doesNotHaveValue) {
        return optionOf('Re Enter Bank Account Number');
      }
      if (bankDetails.ifscCode.doesNotHaveValue) {
        return optionOf('Enter Bank IFSC Code');
      }
      final bankAccNumber = bankDetails.accountNumber;
      final reenterAccNumber = bankDetails.reenterAccNumber;
      final isMacthed =
          bankAccNumber?.toLowerCase() == reenterAccNumber?.toLowerCase();
      if (isMacthed.isFalse) {
        return optionOf(
            'Entered BankAccout Number & ReEntered BankAccout Number are not matching');
      }
    }
    return const None();
  }

  void complete() async {
    emitSafeState(state.copyWith(isLoading: true));
    final enrollForm = state.form;
    final mobileNumber = enrollForm.mobileNumber;
    final mobileNumberWithCode = '+91-$mobileNumber';
    var form = enrollForm.copyWith(
      mobileNumber: mobileNumberWithCode,
      managerContactNum: mobileNumberWithCode,
    );

    final ucoDate = enrollForm.ucoCollectionDate;
    final ucoTime = enrollForm.ucoCollectionTime;
    if (ucoDate.containsValidValue && ucoTime.containsValidValue) {
      final formattedDateTime = DFU.toYYYYmmDDHHmmss(ucoDate, ucoTime);
      form = form.copyWith(ucoCollectionDate: formattedDateTime);
    }
    final res = await repo.enrollFBO(form);
    res.fold(
      (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
      (r) => emitSafeState(state.copyWith(isLoading: false, isSuccess: true)),
    );
  }

  Future<void> getAddressFromLatLng(
    double? latitude,
    double? longitude,
  ) async {
    if (latitude.isNull || longitude.isNull) return;
    emitSafeState(state.copyWith(isLoading: true));
    try {
      final placemarks =
          await GeocodingPlatform.instance?.placemarkFromCoordinates(
        latitude!,
        longitude!,
      );
      final place = placemarks?.firstOrNull;
      final addressStr = StringUtils.readPlacemark(place);
      final form = state.form;
      final formWithAddress = form.copyWith(
          location: addressStr, latitude: latitude, longitude: longitude);
      emitSafeState(state.copyWith(form: formWithAddress, isLoading: false));
    } on Exception catch (e, st) {
      $logger.error('[bloc] cant able to read address', e, st);
    } finally {
      emitSafeState(state.copyWith(isLoading: false));
    }
  }

  bool validateIFSCode(String value) {
    const pattern = r'^[A-Za-z]{4}0[A-Z0-9a-z]{7}$';
    return !RegExp(pattern).hasMatch(value);
  }

  void errorHandled() {
    emitSafeState(state.copyWith(error: null));
  }

  void previousStep() {
    final isFirstStage = EnrollStage.values.indexOf(state.stage) == 0;
    if (isFirstStage) return;

    final prevStage = switch (state.stage) {
      EnrollStage.editdetails => EnrollStage.editdetails,
      EnrollStage.location => EnrollStage.editdetails,
      EnrollStage.photo => EnrollStage.location,
      EnrollStage.remarks => EnrollStage.photo,
      EnrollStage.notinterested => EnrollStage.remarks,
      EnrollStage.followup => EnrollStage.remarks,
      EnrollStage.bankdetails => EnrollStage.remarks,
      EnrollStage.ucodateselection => EnrollStage.bankdetails,
      EnrollStage.complete => switch (state.form.remarks) {
          'Enrolled' => EnrollStage.bankdetails,
          'Not Interested' => EnrollStage.notinterested,
          'Follow Up' => EnrollStage.followup,
          null || String() => EnrollStage.followup,
        },
    };
    emitSafeState(state.copyWith(stage: prevStage));
  }

  void moveNextStep() {
    final maxStageIndx = state.finishedStage.indx;
    final currStageIndx = state.stage.indx;
    if (currStageIndx >= maxStageIndx) return;
    final nextStage = switch (state.stage) {
      EnrollStage.editdetails => EnrollStage.location,
      EnrollStage.location => EnrollStage.photo,
      EnrollStage.photo => EnrollStage.remarks,
      EnrollStage.remarks => switch (state.form.remarks) {
          'Enrolled' => EnrollStage.bankdetails,
          'Not Interested' => EnrollStage.notinterested,
          'Follow Up' => EnrollStage.followup,
          null || String() => EnrollStage.remarks,
        },
      EnrollStage.bankdetails => EnrollStage.ucodateselection,
      EnrollStage.ucodateselection => EnrollStage.complete,
      EnrollStage.notinterested => EnrollStage.complete,
      EnrollStage.followup => EnrollStage.complete,
      EnrollStage.complete => EnrollStage.complete,
    };
    emitSafeState(state.copyWith(stage: nextStage));
  }

  EnrollStage _mapNextStage() => switch (state.stage) {
        EnrollStage.editdetails => EnrollStage.location,
        EnrollStage.location => EnrollStage.photo,
        EnrollStage.photo => EnrollStage.remarks,
        EnrollStage.remarks => EnrollStage.notinterested,
        EnrollStage.notinterested => EnrollStage.complete,
        EnrollStage.followup => EnrollStage.complete,
        EnrollStage.bankdetails => EnrollStage.ucodateselection,
        EnrollStage.ucodateselection => EnrollStage.complete,
        EnrollStage.complete => EnrollStage.complete,
      };

  void nextStep([EnrollStage? stage]) {
    final nextStage = stage ?? _mapNextStage();
    final form = state.form;
    final isEnrolling =
        stage != null ? stage == EnrollStage.bankdetails : form.isEnrolling;
    final isNotInterested = stage != null
        ? stage == EnrollStage.notinterested
        : form.isNotInterested;
    final isFollowUp =
        stage != null ? stage == EnrollStage.followup : form.isFollowUp;

    var updatedForm = form.copyWith(
      isEnrolling: isEnrolling,
      isNotInterested: isNotInterested,
      isFollowUp: isFollowUp,
      bankDetails: isEnrolling.isTrue
          ? state.form.bankDetails ??
              BankDetails(paymentType: StaticData.paymentTypes.first)
          : null,
    );

    emitSafeState(state.copyWith(
        stage: nextStage, form: updatedForm, finishedStage: nextStage));

    // if (nextStage == EnrollStage.complete) {
    //   complete();
    // }
  }
}

@freezed
class EnrollFboState with _$EnrollFboState {
  const factory EnrollFboState({
    required EnrollFBO form,
    required bool isLoading,
    required bool isSuccess,
    required bool isOTPSent,
    required bool isOTPVerified,
    Failure? error,
    required EnrollStage stage,
    required EnrollStage finishedStage,
  }) = _EnrollBusinessState;

  factory EnrollFboState.initial() => EnrollFboState(
        form: EnrollFBO(
          isEnrolling: false,
          isFollowUp: false,
          isNotInterested: false,
          paymentType: StaticData.paymentTypes.first,
          fboType: StaticData.fboTypes.first,
        ),
        isLoading: false,
        isSuccess: false,
        isOTPSent: false,
        isOTPVerified: false,
        stage: EnrollStage.editdetails,
        finishedStage: EnrollStage.editdetails,
      );
}

extension EnrollStateAPI on EnrollFboState {
  bool get isEnteredAllDetails => BooleanUtls.isAllTrue([
        form.fboName,
        form.businessName,
        form.supplierType,
        form.route,
        form.noOfMenuItems,
        form.noOfFriedItems,
        form.seatingCapacity,
        form.addressLine1,
        form.mobileNumber,
        form.email,
        form.ratePerKilogram
      ]);
}
