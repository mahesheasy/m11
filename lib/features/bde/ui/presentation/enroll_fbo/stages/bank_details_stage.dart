import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/data/static_data.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_fbo_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/mobile_scanner_overlay.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class BankDetailsStage extends StatefulWidget {
  const BankDetailsStage({super.key});

  @override
  State<BankDetailsStage> createState() => _BankDetailsStageState();
}

class _BankDetailsStageState extends State<BankDetailsStage> {
  final beneficiaryName = TextEditingController();
  final bankName = TextEditingController();
  final bankAccNumber = TextEditingController();
  final reEnterBankAccNum = TextEditingController();
  final ifscCode = TextEditingController();
  final upiId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bankdetails = context.read<EnrollFboCubit>().state.form.bankDetails;

    return SpacedColumn(
      divider: const Divider(color: AppColors.green),
      defaultHeight: 0,
      children: [
        AppDropDown(
          title: 'Payment Type :',
          isMandatory: true,
          defaultSelection: bankdetails?.paymentType ?? StaticData.paymentTypes.first,
          items: StaticData.paymentTypes,
          onSelected: (type) {
            context.cubit<EnrollFboCubit>().addBankDetails(
                  paymentType: type,
                );
            setState(() {});
          },
          listItemBuilder: (_, value, b, __) =>
              DropdownMenuItem(value: value, child: Text(value)),
        ),
        if(bankdetails?.paymentType == 'UPI')...[
          AppTextField(
            title: 'UPI ID :',
            initialValue: bankdetails?.upiId,
            controller: upiId,
            suffixIcon: IconButton(
              icon: const Icon(Icons.qr_code_scanner_outlined),
              onPressed: () async {
                final scannedUPI = await showModalBottomSheet<String?>(
                  context: context, 
                  builder: (BuildContext _) => const MobileScannerOverlay(),
                );

                if(scannedUPI.containsValidValue && context.mounted) {
                  setState(() {
                    upiId.text = scannedUPI.valueOrEmpty;
                  });
                  context.cubit<EnrollFboCubit>().addBankDetails(
                    upiId: scannedUPI,
                  );

                }
              }, 
            ),
            onChanged: (upiId) {
              context.cubit<EnrollFboCubit>().addBankDetails(
                    upiId: upiId,
                  );
            },
          ),
        ] else if(bankdetails?.paymentType == 'Credit')...[
          AppTextField(
            title: 'Beneficiary name :',
            initialValue: bankdetails?.beneficiaryName,
            controller: beneficiaryName,
            isRequired: true,
            inputFormatters: [UpperCaseTextFormatter()],
            onChanged: (beneficiaryName) {
              context.cubit<EnrollFboCubit>().addBankDetails(
                    beneficiaryName: beneficiaryName,
                  );
            },
          ),
          AppTextField(
            title: 'Bank Name :',
            initialValue: bankdetails?.bankName,
            controller: bankName,
            isRequired: true,
            inputFormatters: [UpperCaseTextFormatter()],
            onChanged: (bankName) {
              context.cubit<EnrollFboCubit>().addBankDetails(
                    bankName: bankName,
                  );
            },
          ),
          AppTextField(
            title: 'Bank Account Number :',
            initialValue: bankdetails?.accountNumber,
            controller: bankAccNumber,
            inputType: TextInputType.number,
            isRequired: true,
            onChanged: (bankAccNumber) {
              context.cubit<EnrollFboCubit>().addBankDetails(
                    bankAccNumber: bankAccNumber,
                  );
            },
          ),
          AppTextField(
            title: 'Reenter Bank Account Number :',
            initialValue: bankdetails?.reenterAccNumber,
            controller: reEnterBankAccNum,
            inputType: TextInputType.number,
            isRequired: true,
            onChanged: (bankAccNumber) {
              context.cubit<EnrollFboCubit>().addBankDetails(
                    reEnterBankAccNum: bankAccNumber,
                  );
            },
          ),
          BankIFSCField(
            title: 'IFSC Code :',
            initialValue: bankdetails?.ifscCode,
            isMandatory: true,
            controller: ifscCode,
            onChanged: (ifscCode) {
              context.cubit<EnrollFboCubit>().addBankDetails(
                    ifscCode: ifscCode,
                  );
            },
            onSubmit: (p0) {},
          ),
        ],
        
        AppButton(
          label: 'Next',
          margin: const EdgeInsets.all(12.0),
          onPressed: context.cubit<EnrollFboCubit>().completeBankDetails,
        ),
      ],
    );
  }
}
