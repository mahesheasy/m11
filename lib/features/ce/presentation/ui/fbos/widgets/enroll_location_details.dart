// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
// import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
// import 'package:m11_ind/core/core.dart';
// import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo_location/enroll_location_details_cubit.dart';
// import 'package:m11_ind/styles/app_colors.dart';
// import 'package:m11_ind/widgets/widgets.dart';
// import 'package:geocoding/geocoding.dart';

// class EnrollShopDetailsPage extends StatefulWidget {
//   const EnrollShopDetailsPage({super.key, required this.fboId});

//   final String fboId;

//   @override
//   State<EnrollShopDetailsPage> createState() => _EnrollShopDetailsPageState();
// }

// class _EnrollShopDetailsPageState extends State<EnrollShopDetailsPage> {
//   final shopNameController = TextEditingController();
//   final stateNameController = TextEditingController();
//   final cityNameController = TextEditingController();
//   final localityNameController = TextEditingController();
//   final pinCodeNameController = TextEditingController();
//   final streetNameController = TextEditingController();
//   final shopMainBuildingNameController = TextEditingController();

//   bool _isLoadingLocation = false;
//   bool _hasLocation = false;
//   double? _latitude;
//   double? _longitude;

//   @override
//   void initState() {
//     super.initState();
//     shopNameController.text = widget.fboId;
//   }

//   void _updateFieldsFromLocation(Position position) async {
//     setState(() {
//       _isLoadingLocation = true;
//       _latitude = position.latitude;
//       _longitude = position.longitude;
//     });
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//         position.latitude,
//         position.longitude,
//       );
//       if (placemarks.isNotEmpty) {
//         Placemark placemark = placemarks.first;
//         setState(() {
//           stateNameController.text = placemark.administrativeArea.toString();
//           cityNameController.text = placemark.locality.toString();
//           localityNameController.text = placemark.subLocality.toString();
//           pinCodeNameController.text = placemark.postalCode.toString();
//           streetNameController.text = placemark.street.toString();
//           _hasLocation = true;
//         });
//       } else {
//         print("Placemarks is empty");
//       }
//     } catch (e) {
//       print("Error getting location details: ${e.toString()}");
//     } finally {
//       setState(() {
//         _isLoadingLocation = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AppScaffoldWidget(
//       title: 'Enroll Location Details',
//       headerWidget: const Positioned(
//         top: kTextTabBarHeight + 32,
//         left: 12,
//         child: PageHeaderWidget(title: 'FBO', value: 'Enroll Location'),
//       ),
//       child: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AppTextField(
//                 controller: shopNameController,
//                 focusNode: FocusNode(),
//                 title: 'Fbo name',
//                 readOnly: true,
//               ),
//               AppSpacer.p8(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const CaptionText(
//                     title: 'Address',
//                     isRequired: false,
//                   ),
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       if (!_isLoadingLocation)
//                         IconButton(
//                           onPressed: () async {
//                             setState(() {
//                               _isLoadingLocation = true;
//                             });
//                             try {
//                               final position =
//                                   await Geolocator.getCurrentPosition();
//                               _updateFieldsFromLocation(position);
//                             } catch (e) {
//                               print("Error: ${e.toString()}");
//                             } finally {
//                               setState(() {
//                                 _isLoadingLocation = false;
//                               });
//                             }
//                           },
//                           icon: const Icon(
//                             Icons.location_searching_rounded,
//                             color: AppColors.haintBlue,
//                           ),
//                           tooltip: 'current location',
//                         ),
//                       if (_isLoadingLocation)
//                         const CircularProgressIndicator(
//                           color: AppColors.haintBlue,
//                           strokeWidth: 2,
//                         ),
//                     ],
//                   ),
//                 ],
//               ),
//               BlocListener<EnrollLocationDetailsCubit,
//                   EnrollLocationDetailsState>(
//                 listener: (context, state) async {
//                   if (state.isSuccess) {
//                     await AppDialog.showSuccessDialog(
//                       context,
//                       content: 'Enrolled Location details successfully',
//                       onTapDismiss: context.close,
//                     );
//                   } else if(state.error!= null) {
//                       await AppDialog.showErrorDialog(
//               context,
//               content: state.error!.error,
//               onTapDismiss: context.close,
//             );
//                   }
//                 },
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: AppTextField(
//                             inputType: TextInputType.streetAddress,
//                             controller: stateNameController,
//                             focusNode: FocusNode(),
//                             hintText: 'State',
//                             labelText: 'State',
//                             onChanged: (state) {
//                               context
//                                   .cubit<EnrollLocationDetailsCubit>()
//                                   .updatefields(locationState: state);
//                             },
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: AppTextField(
//                             inputType: TextInputType.streetAddress,
//                             controller: cityNameController,
//                             focusNode: FocusNode(),
//                             hintText: 'City/Town',
//                             labelText: 'City/Town',
//                             onChanged: (city) {
//                               context
//                                   .cubit<EnrollLocationDetailsCubit>()
//                                   .updatefields(locationCity: city);
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     AppSpacer.p8(),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: AppTextField(
//                             inputType: TextInputType.streetAddress,
//                             controller: localityNameController,
//                             focusNode: FocusNode(),
//                             hintText: 'Locality',
//                             labelText: 'Locality',
//                             onChanged: (locality) {
//                               context
//                                   .cubit<EnrollLocationDetailsCubit>()
//                                   .updatefields(locationAddress: locality);
//                             },
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: AppTextField(
//                             controller: pinCodeNameController,
//                             focusNode: FocusNode(),
//                             inputType: TextInputType.number,
//                             hintText: 'code',
//                             labelText: 'PIN code',
//                             onChanged: (pinCode) {
//                               context
//                                   .cubit<EnrollLocationDetailsCubit>()
//                                   .updatefields(locationZip: pinCode);
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     AppSpacer.p8(),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           flex: 2,
//                           child: AppTextField(
//                             inputType: TextInputType.streetAddress,
//                             controller: streetNameController,
//                             focusNode: FocusNode(),
//                             hintText: 'area/street',
//                             labelText: 'Village/Area/Street',
//                             onChanged: (street) {
//                               context
//                                   .cubit<EnrollLocationDetailsCubit>()
//                                   .updatefields(locationStreet: street);
//                             },
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           flex: 1,
//                           child: AppTextField(
//                             inputType: TextInputType.streetAddress,
//                             controller: shopMainBuildingNameController,
//                             focusNode: FocusNode(),
//                             hintText: 'Shop number',
//                             labelText: 'Name',
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           top: context.sizeOfHeight * 0.08,
//                           left: 10,
//                           right: 10),
//                       child: BlocBuilder<EnrollLocationDetailsCubit,
//                           EnrollLocationDetailsState>(
//                         builder: (context, state) {
//                           return AppButton(
//                             isLoading: state.isLoading,
//                             label: 'continue',
//                             onPressed: () {
//                               final shopName = shopNameController.text;
//                               final state = stateNameController.text;
//                               final city = cityNameController.text;
//                               final locality = localityNameController.text;
//                               final pinCode = pinCodeNameController.text;
//                               final street = streetNameController.text;
//                               final buildingName =
//                                   shopMainBuildingNameController.text;

//                               context
//                                   .read<EnrollLocationDetailsCubit>()
//                                   .updatefields(
//                                     latitude: _latitude.toString(),
//                                     longitude: _longitude.toString(),
//                                     fboName: shopName,
//                                     locationName: buildingName,
//                                     locationAddress: locality,
//                                     locationCity: city,
//                                     locationState: state,
//                                     locationZip: pinCode,
//                                     locationStreet: street,
//                                   );
//                               context
//                                   .read<EnrollLocationDetailsCubit>()
//                                   .onCompleted();
//                             },
//                             bgColor:
//                                 _hasLocation ? AppColors.green : AppColors.grey,
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
