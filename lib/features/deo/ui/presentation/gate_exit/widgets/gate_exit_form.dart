import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/bloc/geo_permission/geo_permission_handler.dart';
import 'package:m11_ind/app/presentation/bloc/geo_permission/geo_permission_state.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/core/utils/attachment_selection_mixin.dart';
import 'package:m11_ind/features/deo/model/gate_exit_form.dart';
import 'package:m11_ind/features/deo/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/deo/ui/bloc/new_gate_exit/new_gate_exit_cubit.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class GateExitForm extends StatefulWidget {
  const GateExitForm({super.key});

  @override
  State<GateExitForm> createState() => _GateExitFormState();
}

class _GateExitFormState extends State<GateExitForm>
    with AttahcmentSelectionMixin {
  final address = TextEditingController();
  final ceName = TextEditingController();
  final startReading = TextEditingController();
  final eodReading = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.cubit<NewGateExitCubit>();

    return BlocBuilder<GeoPermissionHandler, GeoPermissionState>(
      builder: (_, state) {
        if (state is LocationPermissionGranted) {
          final placemark = state.position;
          final location = StringUtils.readPlacemark(placemark);
          address.text = location;
          context.cubit<NewGateExitCubit>().onUpdate(address: location);
        }
        return SingleChildScrollView(
          child: BlocBuilder<NewGateExitCubit, NewGateExitState>(
            builder: (context, state) {
              final attachedFile = state.form.odoMeter;
              return SpacedColumn(
                divider: const Divider(color: AppColors.green),
                defaultHeight: 0,
                children: [
                  AppDateField(
                    title: 'Date : ',
                    initialDate: DFU.ddMMyyyy(DFU.now()),
                    startDate: DateTime.now(),
                    endDate: DateTime.now(),
                    readOnly: true,
                    onSelected: (p0) {},
                  ),
                  AppTextField(
                    title: 'Address : ',
                    isRequired: true,
                    controller: address,
                    initialValue: bloc.state.form.address,
                    onChanged: (text) => bloc.onUpdate(address: text),
                  ),
                  BlocBuilder<DriverList, NetworkRequestState<List<String>>>(
                    builder: (_, state) {
                      final details = state.maybeWhen(
                        orElse: () => <String>[],
                        success: (data) => data,
                      );
                      return SearchDropDownList(
                        title: 'CE Name : ',
                        hint: 'Select Collection Executive',
                        items: details,
                        isMandatory: true,
                        headerBuilder: (c, selectedItem, _) =>
                            Text(selectedItem),
                        defaultSelection: details
                            .where((e) => bloc.state.form.ceName == e)
                            .firstOrNull,
                        listItemBuilder: (_, value, b, __) => Text(value),
                        futureRequest: (p0) async {
                          final whereList = details.where(
                            (e) =>
                                e.containsIgnoreCase(p0) ||
                                e.containsIgnoreCase(p0),
                          );
                          return whereList.toList();
                        },
                        onSelected: (item) {
                          if (item.isNull) return;
                          bloc.onUpdate(ceName: item!);
                        },
                      );
                    },
                  ),
                  BlocBuilder<VehicleNoList, NetworkRequestState<List<String>>>(
                    builder: (_, state) {

                      final details = state.maybeWhen(
                        orElse: () => <String>[],
                        success: (data) => data,
                      );
                      return SearchDropDownList(
                        title: 'Vechile Number : ',
                        hint: 'Select Vechile',
                        isMandatory: true,
                        items: details,
                        futureRequest: (p0) async {
                          final whereList = details.where((e) => e.containsIgnoreCase(p0));
                          return whereList.toList();
                        },
                        headerBuilder: (c, selectedItem, _) => Text(selectedItem),
                        defaultSelection: details
                            .where((e) =>bloc.state.form.vehicleNumber == e).firstOrNull,
                        listItemBuilder: (_, value, b, __) => Text(value),
                        onSelected: (item) {
                          if (item.isNull) return;
                          bloc.onUpdate(vechileNumber: item!);
                        },
                      );
                    },
                  ),
                  AppTextField(
                    title: 'Start Km Reading : ',
                    controller: startReading,
                    isRequired: true,
                    inputType: TextInputType.number,
                    onChanged: (text) => bloc.onUpdate(startKmReading: text),
                    suffixIcon: IconButton(
                      onPressed: () async => await _capture(context),
                      icon: Icon(
                        Icons.camera,
                        size: 28,
                        color: attachedFile.isNotNull
                            ? AppColors.green
                            : AppColors.black,
                      ),
                    ),
                  ),
                  BlocBuilder<NewGateExitCubit, NewGateExitState>(
                    builder: (_, state) => AppButton(
                        isLoading: state.isLoading,
                        bgColor: state.form.isValid
                            ? AppColors.green
                            : AppColors.black,
                        label: 'SUBMIT',
                        onPressed: context.cubit<NewGateExitCubit>().submit),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _capture(BuildContext context) async {
    final capturedFile = await captureImage();
    if (!context.mounted) return;
    if (capturedFile.isNull) {
      context.showSnackbar('File is not Captured', AppSnackBarType.info);
    } else {
      context.cubit<NewGateExitCubit>().onUpdate(odoMeter: capturedFile!);
    }
  }
}
