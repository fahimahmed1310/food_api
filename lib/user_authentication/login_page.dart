import 'package:flutter/material.dart';
import 'package:food_api/home/home_page.dart';
import 'package:food_api/provider/food_provider.dart';
import 'package:food_api/utils/custom_toast.dart';
import 'package:food_api/utils/login_button.dart';
import 'package:food_api/utils/reusable_password_form_field.dart';
import 'package:food_api/utils/reusable_text_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController? phoneNumberController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(
      builder: (_,provider,___) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_background.jpg"),
                colorFilter: ColorFilter.mode(
                   Colors.white.withOpacity(0.3), BlendMode.dstATop),
                fit: BoxFit.cover,
              )
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Login".toUpperCase(),style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 40,
                  ),),
                  SizedBox(
                    height:50,
                  ),
                  ReusableTextFormField(
                    hintText: "Enter Your Phone Number",
                    textEditingController: phoneNumberController,
                    validText: "Enter a valid phone number please",
                  ),
                  SizedBox(
                    height:10,
                  ),
                  ReusablePasswordFormField(
                    hintText: "Enter Your Password",
                    textEditingController: passwordController,
                    validText: "Enter your correct password",
                  ),
                  LoginButton(
                    buttonName: "Login".toUpperCase(),
                    onPressed: ()async{
                      if(formKey.currentState!.validate())
                      {
                       await provider.isUserLogin(phoneNumberController!.text,passwordController!.text);
                       if(provider.isUserExist == false){
                         CustomToast.toastShower("Login Failed", Colors.red);
                       }
                       else{
                         CustomToast.toastShower("Successfully Login", Colors.green);
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                           return HomePage();
                             }),
                         );
                       }
                      }else{
                       CustomToast.toastShower("Email or Password is invalid", Colors.red);
                      }
                    },

                  )

                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
