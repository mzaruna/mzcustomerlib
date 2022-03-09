
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:mzlibsample/Model/authentication_exception.dart';
import 'package:mzlibsample/Model/jsonresponsestaus_error.dart';
import 'package:mzlibsample/repository/authRepo.dart';
import 'package:mzlibsample/service/service.dart';

class AuthenticationService  extends AuthenticationRepository{
  Service service=new Service();
@override
  Future<String> getAuthenticationToken(String key,String secret) async {
    
    Map<String, dynamic> jsonMap = {"grant_type": "client_credentials"};
   
    String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$key:$secret'));
   var tokenApi ='https://auth.mzapiqc.mezzofy.com/v2/token';
   
    debugPrint(tokenApi);

      String jsonString = json.encode(jsonMap);
      try {
      dynamic ver= service.postMethod(tokenApi, basicAuth, jsonString);
      return ver;
      } on JsonResponseStatusException catch (e) {
      debugPrint('Error Exception' + (e.toString()));
      throw (e);
    }on Exception catch (e) {
      debugPrint(e.toString());
      throw AuthenticationException(message: 'Unknown Error !!!');
    }
  }

@override
  Future<dynamic> getCouponlistByStatus(
      int skip, int limit, String status,String customerId,String accessToken) async {
  
    String url= 'https://serial.mzapiqc.mezzofy.com/v2/customer/' +
          customerId +
          "?include_merchant=S&status=" +
          status +
          "&" "skip=" +
          skip.toString() +
          "&limit=" +
          limit.toString();
String bearer = 'Bearer ' +accessToken;
    debugPrint(url);
    try {
        dynamic ver= service.getMethod(url, bearer);
      return ver;

    }  on JsonResponseStatusException catch (e) {
      debugPrint('Error Exception' + (e.toString()));
      throw (e);
    }on Exception catch (e) {
      debugPrint(e.toString());
      throw AuthenticationException(message: 'Unknown Error !!!');
    }
  }

}
