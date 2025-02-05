import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/data/static_data.dart';
import 'package:m11_ind/features/bde/model/enroll_fbo.dart';
import 'package:m11_ind/features/bde/model/route_master.dart';
import 'package:m11_ind/features/bde/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_fbo_cubit.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/widgets/enroll_fbo_bloc_builder.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_details/fbo_details_cubit.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class FBOEnrollMentForm extends StatefulWidget {
  const FBOEnrollMentForm({super.key});

  @override
  State<FBOEnrollMentForm> createState() => _FBOEnrollMentFormState();
}

class _FBOEnrollMentFormState extends State<FBOEnrollMentForm> {
  late final TextEditingController managerName;
  late final TextEditingController fboName;
  late final TextEditingController address;
  late final TextEditingController mobileNumber;
  late final TextEditingController city;
  late final TextEditingController pincode;
  late final TextEditingController landlineNumber;
  late final TextEditingController email;
  late final TextEditingController gstIn;
  late final TextEditingController fssaiNumber;
  late final TextEditingController country;
  late final TextEditingController website;
  late final TextEditingController ratePerKG;
  //
  late final TextEditingController noOfItems;
  late final TextEditingController noOfFriedItems;
  late final TextEditingController seatingCapacity;

  @override
  void initState() {
    super.initState();
    managerName = TextEditingController();
    fboName = TextEditingController();
    address = TextEditingController();
    noOfItems = TextEditingController();
    noOfFriedItems = TextEditingController();
    seatingCapacity = TextEditingController();
    mobileNumber = TextEditingController();
    city = TextEditingController();
    pincode = TextEditingController();
    landlineNumber = TextEditingController();
    email = TextEditingController();
    gstIn = TextEditingController();
    fssaiNumber = TextEditingController();
    country = TextEditingController();
    website = TextEditingController();
    ratePerKG = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final enrollCubit = context.cubit<EnrollFboCubit>();
    final enrollForm = enrollCubit.state.form;

    return MultiBlocListener(
      listeners: [
        BlocListener<FBODetailsCubit, FBODetailsCubitState>(
          listener: (_, fState) {
            fState.handle(
              context,
              success: (data) {
                setState(() {});
              },
            );
          },
        ),
        BlocListener<UCOPriceCubit, UCOPriceCubitState>(
          listener: (_, state) {
            state.handle(
              context,
              success: (data) {
                if (enrollForm.ratePerKilogram.isNull ||
                    enrollForm.ratePerKilogram == 0.0) {
                  context.cubit<EnrollFboCubit>().initPrice(data);
                  setState(() {
                    ratePerKG.text = data.basePrice.toString();
                  });
                }
              },
            );
          },
        ),
      ],
      child: SpacedColumn(
        divider: const Divider(color: AppColors.grey),
        defaultHeight: 0,
        children: [
          AppTextField(
            title: 'FBO manager name :',
            initialValue: enrollForm.managerName,
            controller: managerName,
            isRequired: true,
            onChanged: (text) => enrollCubit.onFieldChange(managerName: text),
          ),
          AppTextField(
            title: 'Hotel / Restaurant / FBO name :',
            initialValue: enrollForm.fboName,
            controller: fboName,
            isRequired: true,
            onChanged: (text) => enrollCubit.onFieldChange(fboName: text),
          ),
          AppDropDown(
            isMandatory: true,
            title: 'Supplier Type',
            defaultSelection: enrollForm.supplierType,
            items: StaticData.supplierTypes,
            listItemBuilder: (p0, p1, p2, p3) => Text(p1),
            onSelected: (type) {
              enrollCubit.onFieldChange(supplierType: type);
              setState(() {});
            },
          ),
          BlocBuilder<RouteMasterCubit, RouteMasterState>(
            builder: (_, state) {
              final data = state.maybeWhen(
                orElse: () => <RouteMaster>[],
                success: (data) => data,
              );
              
              final defaultSel = data.where((e) => e.name == enrollForm.route).firstOrNull;
              return SearchDropDownList(
                title: 'Route :',
                hint: 'Select Route',
                isMandatory: true,
                items: data,
                listItemBuilder: (_, item, __, ___) => CompactListTile(
                  title: item.routeName,
                  subtitle: item.depo,
                ),
                defaultSelection: defaultSel,
                headerBuilder: (context, item, enabled) => Text(item.routeName),
                futureRequest: (p0) async {
                  final where = data.where((e) {
                    return (e.name.containsIgnoreCase(p0) || e.routeName.containsIgnoreCase(p0));
                  });
                  return where.toList();
                },
                onSelected: (route) => enrollCubit.onFieldChange(route: route?.name),
              );
            },
          ),
          if (!enrollForm.isAgreegator) ...[
            AppDropDown(
              title: 'Restaurant Type :',
              defaultSelection: enrollForm.restaurantType,
              items: StaticData.restaurantType,
              isMandatory: true,
              onSelected: (type) =>
                  enrollCubit.onFieldChange(restaurantType: type),
              listItemBuilder: (_, value, b, __) => Text(value),
            ),
          ],
          AppTextField(
            title: 'No.of items In the Menu :',
            controller: noOfItems,
            isRequired: true,
            initialValue: NumUtils.toStrVal(enrollForm.noOfMenuItems),
            inputType: TextInputType.number,
            maxLength: 3,
            onChanged: (text) => enrollCubit.onFieldChange(noOfItems: text),
          ),
          AppTextField(
            title: 'No.of fried items In the Menu :',
            controller: noOfFriedItems,
            isRequired: true,
            initialValue: NumUtils.toStrVal(enrollForm.noOfFriedItems),
            inputType: TextInputType.number,
            maxLength: 3,
            onChanged: (text) =>
                enrollCubit.onFieldChange(noOfFriedItems: text),
          ),
          AppTextField(
            title: 'Seating Capacity :',
            isRequired: true,
            initialValue: NumUtils.toStrVal(enrollForm.seatingCapacity),
            controller: seatingCapacity,
            inputType: TextInputType.number,
            maxLength: 4,
            onChanged: (text) =>
                enrollCubit.onFieldChange(seatingCapacity: text),
          ),
          AppTextField(
            title: 'Address :',
            initialValue: enrollForm.addressLine1,
            controller: address,
            isRequired: true,
            onChanged: (text) => enrollCubit.onFieldChange(addressLine1: text),
          ),
          SearchDropDownList(
            title: 'State :',
            hint: 'Select State',
            isMandatory: true,
            items: StaticData.stateList,
            defaultSelection: enrollForm.state,
            futureRequest: (p0) async {
              final where =
                  StaticData.stateList.where((e) => e.containsIgnoreCase(p0));
              return where.toList();
            },
            onSelected: (state) => enrollCubit.onFieldChange(fboState: state),
          ), AppTextField(
            title: 'Country :',
            initialValue: enrollForm.country,
            isRequired: true,
            controller: country,
            onChanged: (text) => enrollCubit.onFieldChange(country: text),
          ),
          AppTextField(
            title: 'City :',
            initialValue: enrollForm.city,
            isRequired: true,
            controller: city,
            onChanged: (text) => enrollCubit.onFieldChange(city: text),
          ),
          AppTextField(
            title: 'Pincode :',
            controller: pincode,
            initialValue: enrollForm.pincode,
            inputType: TextInputType.number,
            isRequired: true,
            maxLength: 6,
            onChanged: (text) => enrollCubit.onFieldChange(pincode: text),
          ),
          AppTextField(
            title: 'Mobile Number :',
            controller: mobileNumber,
            initialValue: enrollForm.mobileNumber,
            inputType: TextInputType.number,
            maxLength: 10,
            isRequired: true,
            onChanged: (text) => enrollCubit.onFieldChange(mobileNumber: text),
          ),
          AppTextField(
            title: 'Landline Number :',
            controller: landlineNumber,
            initialValue: enrollForm.landLineNumber,
            inputType: TextInputType.number,
            onChanged: (text) =>
                enrollCubit.onFieldChange(landlineNumber: text),
          ),
          AppTextField(
            title: 'Email :',
            controller: email,
            initialValue: enrollForm.email,
            inputType: TextInputType.emailAddress,
            isRequired: true,
            onChanged: (text) => enrollCubit.onFieldChange(email: text),
          ),
          AppDropDown(
            title: 'Type :',
            items: StaticData.fboTypes,
            isMandatory: true,
            defaultSelection: enrollForm.fboType ?? StaticData.fboTypes.first,
            onSelected: (type) {
              enrollCubit.onFieldChange(fboType: type);
              setState(() {});
            },
            listItemBuilder: (_, value, b, __) => Text(value),
          ),
          if (enrollForm.isRegistered) ...[
            GSTInField(
              title: 'GSTIN Number :',
              isRequired: true,
              initialValue: enrollForm.gstinNumber,
              controller: gstIn,
              onChanged: (text) => enrollCubit.onFieldChange(gstinNumber: text),
            ),
          ],
          AppTextField(
            title: 'FSSAI Number :',
            isRequired: true,
            initialValue: enrollForm.fssaiNumber,
            controller: fssaiNumber,
             maxLength: 14,
            onChanged: (text) => enrollCubit.onFieldChange(fssaiNumber: text),
          ),
          UploadPhotoWidget(
            title: 'FSSAI Certificate Image *',
            defaultValue: enrollForm.certificateImage,
            imageUrl: enrollForm.certificateImageUrl,
            onFileCapture: context.cubit<EnrollFboCubit>().uploadImage,
            ),
          AppTextField(
            title: 'Website :',
            controller: website,
            initialValue: enrollForm.website,
            inputType: TextInputType.url,
            onChanged: (text) => enrollCubit.onFieldChange(website: text),
          ),
          AppTextField(
            title: 'Rate Per Kilogram :',
            controller: ratePerKG,
            initialValue: enrollForm.ratePerKilogram?.toString(),
            inputType: const TextInputType.numberWithOptions(decimal: true),
            prefixIcon:
                const Icon(Icons.currency_rupee, color: AppColors.green),
            suffixIcon: EnrollFBOBlocBuilder(
              builder: (context, state) => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible: state.form.isRegistered,
                    child: Text(
                      '+ ${state.form.gstPercent?.toInt()}%',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: AppColors.green),
                    ),
                  ),
                  const SizedBox(width: 4.0)
                ],
              ),
            ),
            isRequired: true,
            onChanged: (text) => enrollCubit.onFieldChange(ratePerKg: text),
          ),
          BlocBuilder<EnrollFboCubit, EnrollFboState>(
            builder: (_, state) {
              return AppButton(
                bgColor: state.isEnteredAllDetails
                    ? AppColors.green
                    : AppColors.chimneySweep,
                label: 'CONTINUE',
                margin: const EdgeInsets.all(12.0),
                onPressed: () async {
                  if(state.isEnteredAllDetails) {
                    final isConfimed = await AppDialog.askForConfirmation<bool?>(context, 
                      content: 'Please confirm that the entered mobile number is valid and active.', 
                      onTapDismiss: () => context.close(false), 
                      onTapConfirm: () => context.close(true),
                    ) ?? false;
                    if(isConfimed && context.mounted) context.cubit<EnrollFboCubit>().validateDetails();
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
