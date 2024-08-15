import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:totalxtest/constants/colors.dart';
import 'package:totalxtest/constants/style.dart';
import 'package:totalxtest/view/widgets/textformfield.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    final mqsize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Center(
                  child: Image.asset(
                'assets/images/login_image.png',
                height: mqsize.height * 0.2,
                width: mqsize.width * 0.4,
                fit: BoxFit.contain,
              )),
              SizedBox(
                height: mqsize.height * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: AppStyles.normalText(
                      title: "Enter Phone Number", size: 18),
                ),
              ),
              SizedBox(
                height: mqsize.height * 0.02,
              ),
              //   ),
              Custom_Textformfeild(
                hinttext: 'Enter Mobile Number',
                unvaildText: "Enter Valid Number",
                keybordtype: TextInputType.number,
              ),
              SizedBox(
                height: mqsize.height * 0.03,
              ),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.montserrat(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  children: [
                    const TextSpan(text: 'By Continuing, I agree to TotalX’s '),
                    TextSpan(
                      text: 'Terms and condition',
                      style: TextStyle(color: AppColors.styleBlue),
                    ),
                    const TextSpan(text: ' & '),
                    TextSpan(
                      text: 'privacy Policy',
                      style: TextStyle(color: AppColors.styleBlue),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mqsize.height * 0.04,
              ),
              SizedBox(
                  height: mqsize.height * 0.06,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                    ),
                    onPressed: () {},
                    child: AppStyles.normalText(
                        title: 'Get OTP', color: Colors.white, size: 15),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
