import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/view/widgets/auth/custom_field.dart';
import 'package:flutter_mvvm_architecture/view/widgets/primary_button.dart';
import 'package:flutter_mvvm_architecture/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../../res/constant/app_dimentions.dart';
import '../../utils/utils.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
            padding: AppDimensions.padding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               CustomField(
                 controller: _emailController,
                 hint: "email",
                 focusNode: emailFocusNode,
                 nextFocusNode: passwordFocusNode,
                 isCircular: true,
                 keyboardType: TextInputType.emailAddress,
                 prefix: Icon(Icons.alternate_email),
               ),
                AppDimensions.space2,
                ValueListenableBuilder(
                    valueListenable: _obsecurePassword,
                    builder: (context,value , child){
                      return  CustomField(
                        controller: _passwordController,
                        hint: "password",
                        maxLines: 1,
                        focusNode: passwordFocusNode,
                        isPassword: _obsecurePassword.value,
                        isCircular: true,
                        keyboardType: TextInputType.visiblePassword,
                        prefix: Icon(Icons.lock),
                        suffix:InkWell(
                          onTap: (){
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                            child: _obsecurePassword.value ? 
                            Icon(Icons.visibility_off_outlined) : Icon(Icons.visibility) ),
                      );
                    }),

                // AppDimensions.space2,
                SizedBox(height: height * .02,),
                PrimaryButton(text: "Login",onTap: (){
                  if(_emailController.text.isEmpty){
                    Utils.flushBarErrorMessage("please enter email", context);
                  }
                  else if (_passwordController.text.isEmpty){
                    Utils.flushBarErrorMessage("please enter password", context);
                  }

                  else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage("password must be greator then 6 digit", context);
                  }
                  else {
                    Map data = {
                      "email" : _emailController.text.toString(),
                      "password": _passwordController.text.toString()
                    };
                    authViewModel.loginApi(data, context);
                    // Utils.flushBarErrorMessage("successfully login", context);
                    // _passwordController.clear();
                    // _emailController.clear();
                  }
                },)
              ],
            ),
          ))
    );
  }
}
