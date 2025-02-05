import 'package:m11_ind/core/model/id_name.dart';

abstract class StaticData {
  static const stateList = [
    'Andaman and Nicobar Islands',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chandigarh',
    'Chhattisgarh',
    'Dadra and Nagar Haveli',
    'Daman and Diu',
    'Delhi',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu and Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Lakshadweep',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttarakhand',
    'Uttar Pradesh',
    'West Bengal',
    'Puducherry',
  ];
  
  static List<String> supplierTypes = ['Aggregator', 'Cafe', 'Hotel', 'Restaurant'];
  static List<String> restaurantType = ['VEG', 'NON VEG', 'VEG & NON VEG'];

  static List<String> fboTypes = ['Unregistered', 'Registered'];

  static List<String> paymentTypes = ['UPI', 'Cash', 'Credit'];
  
  static List<String> otherRemarks = [
    'FBO was not available',
    'FBO was not into Oil Business',
    "FBO don't sell UCO",
    'FBO is linked to other UCO brand',
    'FBO throws UCO into drainage',
    'Price of UCO is less',
    'FBO was not satisfied with Documentation',
    'FBO sells UCO to local vendor'
  ];

  static List<String> visitRemarks = [
    'Compitition bought @ high rate',
    'Sold to competitor as he came early',
    'Production of UCO is less than normal',
    'Restaurent was not operating',
    'Customer not available',
    'FBO closed permanently',
    'FBO Closed today',
  ];

  static final enrollRemarks = <IdName>[
    IdName(id: 'Enrolled', name: 'Enrolling'),
    IdName(id: 'Not Interested', name: 'Not Interested'),
    IdName(id: 'Follow up', name: 'Follow Up'),
  ];

}
