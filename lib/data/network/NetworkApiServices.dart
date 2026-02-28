import 'dart:convert';
import 'dart:io';
import 'package:flutter_mvvm_architecture/data/app_exceptions.dart';
import 'package:flutter_mvvm_architecture/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    dynamic responseJson; // Why dynamic? Because API response could be:Map,List,String,Error message
    try {
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException{
      throw FetchDataException("no Internet Connection");
    }

    return responseJson; // Returns processed API data back to:  Repository➡ ViewModel➡ UI
  }

  @override
  Future<dynamic> getPostApiResponse(String url,dynamic data) async {

    dynamic responseJson;
    try {
      Response response = await post(
          Uri.parse(url),
          body: data
      );

      responseJson = returnResponse(response);
    } on SocketException{
      throw FetchDataException("no Internet Connection");
    }

    return responseJson;
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