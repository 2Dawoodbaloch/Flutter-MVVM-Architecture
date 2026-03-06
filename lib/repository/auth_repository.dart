import 'package:flutter_mvvm_architecture/data/network/BaseApiServices.dart';
import 'package:flutter_mvvm_architecture/data/network/NetworkApiServices.dart';
import 'package:flutter_mvvm_architecture/res/app_url.dart';

class AuthRepository {

  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndpoint, data);
      return response;

  } catch(e) {

      throw e;

    }
  }


  Future<dynamic> registerApi(dynamic data) async {
    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndpoint, data);
      return response;

    } catch(e) {

      throw e;

    }
  }



}