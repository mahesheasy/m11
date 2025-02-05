import 'package:m11_ind/core/core.dart';

class FBOListInp {
  const FBOListInp({required this.status, this.query, this.route});

  final String status;
  final String? query;
  final String? route;

  static Map<String, dynamic> toJson(final FBOListInp inp) {
    return {
      'status': inp.status,
      if(inp.query.containsValidValue) 'query': inp.query,
      if(inp.route.containsValidValue) 'route': inp.route,
    };
  }
}
