import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/fbo/models/enroll_business_form.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';
import 'package:m11_ind/features/fbo/models/request_extra_cans.dart';

abstract interface class FBORepo {
  AsyncValueOf<Pair<String, bool>> getStatus();
  
  AsyncValueOf<bool> enrollBusiness(EnrollBusinessForm form);

  AsyncValueOf<FBODetails> getFBODetails(String fboId);

  AsyncValueOf<bool> requestCans(RequestExtraCans request);
  AsyncValueOf<bool> requestFBO(RequestExtraCans request);
}