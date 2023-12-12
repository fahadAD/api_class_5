import 'package:e_shop_api_project/Authentication/repo.dart';
import 'package:e_shop_api_project/Authentication/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../home.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _Emailcontroller=TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          TextFormField(
            controller: _Emailcontroller,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _passwordcontroller,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(height: 10,),

          ElevatedButton(onPressed: () async {
         bool isSignupDone=await  getSignupRepo(email: _Emailcontroller.text, password: _passwordcontroller.text);
        if(isSignupDone){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SigninScreen(),));
        }else{
          EasyLoading.showError("   Error");
        }
          }, child: Text("Registration")),
        ],
      ),
    );
  }
}
