import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String? buttonName;
  final Function()? onPressed;


  LoginButton({@required this.buttonName, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        height:50,
        width: 150,
        padding: const EdgeInsets.only(top:11),
        child: Text(buttonName!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "acme",
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}