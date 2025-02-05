import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/data/static_data.dart';
import 'package:m11_ind/features/fbo/presentation/bloc/enroll_business/enroll_business_cubit.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class EnrollBusinessScreen extends StatefulWidget {
  const EnrollBusinessScreen({super.key});

  @override
  State<EnrollBusinessScreen> createState() => _EnrollBusinessScreenState();
}

class _EnrollBusinessScreenState extends State<EnrollBusinessScreen> {
  late final TextEditingController managerName;
  late final TextEditingController fboName;
  late final TextEditingController address;
  late final TextEditingController mobileNumber;
  late final TextEditingController city;

  @override
  void initState() {
    managerName = TextEditingController()..addListener(managerNameListener);
    fboName = TextEditingController()..addListener(fboNameListener);
    address = TextEditingController()..addListener(addressListener);
    mobileNumber = TextEditingController(text: context.user.phone)..addListener(mobileNumberListener);
    city = TextEditingController()..addListener(cityListener);
    super.initState();
  }

  void managerNameListener() {
    final manager = managerName.text;
    context.cubit<EnrollBusinessCubit>().onFieldChange(managerName: manager);
  }

  void fboNameListener() {
    final fbo = fboName.text;
    context.cubit<EnrollBusinessCubit>().onFieldChange(businessName: fbo);
  }

  void addressListener() {
    final addressText = address.text;
    context.cubit<EnrollBusinessCubit>().onFieldChange(address: addressText);
  }

  void mobileNumberListener() {
    final mobile = mobileNumber.text;
    context.cubit<EnrollBusinessCubit>().onFieldChange(mobileNumber: mobile);
  }

  void cityListener() {
    final cityText = city.text;
    context.cubit<EnrollBusinessCubit>().onFieldChange(fboCity: cityText);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'Enroll Business',
      headerWidget: const Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: PageHeaderWidget(title: 'Enroll'),
      ),
      child: SingleChildScrollView(
        child: SpacedColumn(
          divider: const Divider(color: AppColors.green),
          children: [
            AppTextField(
              title: 'FBO manager name :',
              controller: managerName,
            ),
            AppTextField(
              title: 'Hotel / Restaurant / FBO name :',
              controller: fboName,
            ),
            AppDropDown(
            title: 'Supplier Type',
            items: StaticData.supplierTypes,
            onSelected: (type) {
              context.cubit<EnrollBusinessCubit>().onFieldChange(
                type: type,
              );
            },
          ),
            AppTextField(
              inputType: TextInputType.multiline,
              title: 'Address :',
              controller: address,
            ),
            AppTextField(
              inputType: TextInputType.phone,
              title: 'Mobile number :',
              maxLength: 10,
              readOnly: context.user.phone.containsValidValue,
              controller: mobileNumber,
            ),
            SearchDropDownList(
              title: 'State :',
              hint: 'Select State',
              isMandatory: true,
              items: StaticData.stateList, 
              futureRequest: (p0) async {
                final where = StaticData.stateList.where((e) => e.containsIgnoreCase(p0));
                return where.toList();
              },
              onSelected: (state) {
                context.cubit<EnrollBusinessCubit>().onFieldChange(fboState: state);
              },
            ),
            AppTextField(
              title: 'City :',
              controller: city,
            ),
            BlocConsumer<EnrollBusinessCubit, EnrollBusinessState>(
              listener: (_, state) async {
                if (state.error.isNotNull) {
                  await AppDialog.showErrorDialog(
                    context,
                    content: state.error!.error,
                    onTapDismiss: context.exit,
                  );
                  if(!context.mounted) return;
                  context.cubit<EnrollBusinessCubit>().errorHandled();
                }
                if (state.isSuccess) {
                  await AppDialog.showSuccessDialog(
                    context,
                    content: 'Enrolled Successfully..! Our Executive will visit location for verification soon. Thank you',
                    onTapDismiss: context.exit,
                  );
                  if(!context.mounted) return;
                  context.close;
                }
              },
              builder: (_, state) => AppButton(
                isLoading: state.isLoading,
                onPressed: context.cubit<EnrollBusinessCubit>().enroll,
                label: 'Submit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
