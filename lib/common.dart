import 'package:flutter/material.dart';

class Common{

 static  Widget textField({TextEditingController? controller,String? text,Widget? preicon }){
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: preicon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        )
      ),
    );
  }
}