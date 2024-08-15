import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:totalxtest/constants/colors.dart';

class Custom_Textformfeild extends StatelessWidget {
  String unvaildText;
  final String hinttext;
  final Color hintcolor;
  final int maxline;
  final Color iconColor;
  final TextInputType keybordtype;
  final bool obscureText;
  Custom_Textformfeild(
      {super.key,
      this.keybordtype = TextInputType.name,
      this.obscureText = false,
      required this.hinttext,
      this.hintcolor = Colors.black,
      this.maxline = 1,
      this.iconColor = AppColors.dark,
      required this.unvaildText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        cursorColor: Colors.blue,
        maxLines: maxline,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a $unvaildText';
          } else {
            return null;
          }
        },
        keyboardType: keybordtype,
        decoration: InputDecoration(
          hintText: hinttext,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          hintStyle: GoogleFonts.montserrat(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
          labelText: hinttext,
          labelStyle: TextStyle(color: hintcolor),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.grey,
                width: 1,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.dark,
                width: 2,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.error,
                width: 2,
              )),
        ));
  }
}
