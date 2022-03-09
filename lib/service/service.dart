import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mzlibsample/Model/authentication_exception.dart';
import 'package:mzlibsample/Model/jsonresponsestaus_error.dart';

class Service{
  Future<String> postMethod(String api,String basicAuth,String jsonString)async{
    try {
      return await http.post(Uri.parse('$api'), body: jsonString, headers: {
        "Accept": "application/json",
        'authorization': basicAuth,
        'Content-Type': 'application/json'
      }).then((http.Response response) async {
        if (response.statusCode == 200) {
          debugPrint(response.body);
          return response.body;
        } else {
          throw JsonResponseStatusException(
              message: response.body);
        }
      });
    } on HttpException catch (e) {
      debugPrint('Error Exception' +
          (e.message));
      throw AuthenticationException(message: e.message);
    } on SocketException catch (e) {
      debugPrint('Error Exception' + (e.message ));
      throw AuthenticationException(message: 'Server connectivity Error !!!');
    } on JsonResponseStatusException catch (e) {
      debugPrint('Error Exception' + (e.toString()));
      throw (e);
    }on Exception catch (e) {
      debugPrint(e.toString());
      throw AuthenticationException(message: 'Unknown Error !!!');
    }
  }


  Future<String>getMethod(String url,String bearer)async{
    try {
      return await http.get(Uri.parse(url), headers: {
        'authorization': bearer
      }).then((response) async {
        if (response.statusCode == 200) {
          debugPrint(response.body);
          return response.body;
        } else {
          throw JsonResponseStatusException(
              message: response.body);
        }
      });
    } on HttpException catch (e) {
      debugPrint('Error Exception' +
          (e.message));
      throw AuthenticationException(message: e.message);
    } on SocketException catch (e) {
      debugPrint('Error Exception' + (e.message ));
      throw AuthenticationException(message: 'Server connectivity Error !!!');
    } on JsonResponseStatusException catch (e) {
      debugPrint('Error Exception' + (e.toString()));
      throw (e);
    }on Exception catch (e) {
      debugPrint(e.toString());
      throw AuthenticationException(message: 'Unknown Error !!!');
    }
  }
}