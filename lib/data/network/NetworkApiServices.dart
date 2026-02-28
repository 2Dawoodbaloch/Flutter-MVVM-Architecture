import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm_architecture/data/app_exceptions.dart';
import 'package:flutter_mvvm_architecture/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class Networkapiservices extends BaseApiServices {
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException{
      throw FetchDataException("no Internet Connection");
    }

    return responseJson;
  }

  @override
  Future<dynamic> getPostApiResponse(String url) {
    // TODO: implement getPostApiResponse
    throw UnimplementedError();
  }
  
}

dynamic returnResponse(http.Response response) {
  switch(response.statusCode){
    case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
    case 404:
      throw BadRequestException(response.body.toString());
    case 400:
      throw UnauthorisedException(response.body.toString());
      default:
      throw FetchDataException("Error occured while communicating with Server with status code ${response.statusCode}");




  }
}