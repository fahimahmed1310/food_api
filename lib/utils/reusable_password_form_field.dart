import 'package:flutter/material.dart';
import 'package:food_api/validation/phone_number_validation.dart';

class ReusablePasswordFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textEditingController;
  final String? validText;




  ReusablePasswordFormField({@required this.hintText, @required this.textEditingController, @required this.validText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width:300,
      child: TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
            hintText: hintText,
            hintStyle: TextStyle(
            ),
            errorStyle: const TextStyle(fontSize: 11, height: 0.3),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: .5,
                color: Colors.red,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),

            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)
            ),
          ),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,

          ),
          validator: (value) {
            if(value == " " || value == null){
              return validText;
            }
            else{
               return null;

            }
          }
      ),

    );
  }
}