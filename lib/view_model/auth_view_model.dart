
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_architecture/repository/auth_repository.dart';
import 'package:flutter_mvvm_architecture/utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  AuthRepository _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data,BuildContext context) async{

    _myRepo.loginApi(data).then((value){
   if (kDebugMode) {
     print(value.toString());
     Utils.flushBarErrorMessage("login successfully", context);
   }
    }).onError((error,stackTree){
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}