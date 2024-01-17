import 'package:flutter/material.dart';
import 'package:trading_app/helpers/colors.dart';
class TextFormFieldWithSuffix extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  TextInputType inputType;
  ValueChanged onChanged;
  String? Function(String?)? validator;
  dynamic prefixIcon;
   TextFormFieldWithSuffix({Key? key,required this.hintText,required this.controller,required this.onChanged,required this.inputType,required this.validator,required this.prefixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
          color: COLORS.black,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
          letterSpacing: 0.3,
          ),
      onChanged: onChanged,
      validator: validator,
      keyboardType: inputType,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.next,
      cursorColor: COLORS.black,
      decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          contentPadding:const EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 4,
            right: 3,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: COLORS.whiteBorder,
                width: 1.5,
              ),

              borderRadius: BorderRadius.circular( 20)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: COLORS.whiteBorder,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(20)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.2,
              ),
              borderRadius: BorderRadius.circular(20)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: COLORS.whiteBorder,
                width: 1.2,
              ),
              borderRadius: BorderRadius.circular(20)),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: COLORS.blackLight,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              fontSize:12),
          prefixIcon: Icon(prefixIcon,color: COLORS.blackLight,)),
    );
  }
}
