import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({Key? key, required this.htext, required this.secure, required this.type, required this.cONtroller, required this.validation}) : super(key: key);
  final String htext;
  final bool secure;
  final TextInputType type;
  final TextEditingController cONtroller;
  final String validation;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        // border: Border(bottom: BorderSide(color: Colors.grey))
      ),
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return "$validation";
          }
        },
        controller: cONtroller ,
        obscureText: secure,
        keyboardType: type ,
        decoration: InputDecoration(

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color:  Color.fromRGBO(143, 148, 251, 1)),
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: htext,
            labelStyle: TextStyle(
                color: Colors.grey[400]
            )
        ),
      ),
    );
  }
}