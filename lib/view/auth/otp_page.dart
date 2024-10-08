import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:totalxtest/constants/colors.dart';
import 'package:totalxtest/constants/style.dart';
import 'package:totalxtest/controller/auth_controller.dart';
import 'package:totalxtest/view/home/home_page.dart';
import 'package:totalxtest/view/widgets/snakbar.dart';

class OtpPage extends StatelessWidget {
   final String phoneNumber;
  final String verificationId;
  const OtpPage( {super.key, required this.phoneNumber, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    final mqsize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Consumer<AuthController>(
          builder: (context, authController, child) {
            return Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/otp_image.png',
                    height: mqsize.height * 0.2,
                    width: mqsize.width * 0.4,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: mqsize.height * 0.040,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: AppStyles.normalText(
                        title: "OTP Verification", size: 17)),
                SizedBox(
                  height: mqsize.height * 0.030,
                ),
                AppStyles.normalText(
                    title:
                        "Enter the verification code we just sent to your number +91 ********21",
                    size: 15,
                    color: AppColors.dark.withOpacity(0.7),
                    fontWeight: FontWeight.w400),
                SizedBox(
                  height: mqsize.height * 0.035,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Pinput(
                    length: 6,
                    controller: authController.otpVerificationController,
                    defaultPinTheme: PinTheme(
                        width: 55,
                        height: 55,
                        textStyle: const TextStyle(
                            fontSize: 22, color: AppColors.error),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey, width: 1))),
                    focusedPinTheme: PinTheme(
                        width: 55,
                        height: 55,
                        textStyle: const TextStyle(
                            fontSize: 22, color: AppColors.error),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.dark))),
                  ),
                ),
                SizedBox(
                  height: mqsize.height * 0.020,
                ),
                Align(
                    alignment: Alignment.center,
                    child: AppStyles.normalText(
                      title:  '${authController.counter}Sec',
                      color: AppColors.error,
                      size: 14,
                    )),
                SizedBox(
                  height: mqsize.height * 0.025,
                ),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.montserrat(
                        color: AppColors.dark,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    children: [
                      const TextSpan(text: 'Don\'t Get OTP?'),
                      TextSpan(
                          text: ' Resend',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: AppColors.styleBlue,
                            fontWeight: FontWeight.w700,
                            decorationThickness: 2,
                            decoration: TextDecoration.underline,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: mqsize.height * 0.025,
                ),
                SizedBox(
                    height: mqsize.height * 0.06,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () {
                          if (authController.otpVerificationController.text.length == 6) {
                              authController
                                  .otpSubmit(verificationId)
                                  .then((value) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Homepage(),
                                    ));
                                authController.numberController.clear();
                                authController.otpVerificationController.clear();
                                authController.disposeTimer();
                              });
                            } else if (authController.otpVerificationController.text.length <
                                6) {
                              showSnackBar(context, 'Please enter 6 digit otp',
                                  AppColors.error);
                            }else if(authController.otpVerificationController.text.isEmpty){
                              showSnackBar(
                                    context,
                                    'Please enter the otp code',
                                    AppColors.error);
                            }
                      },
                      child: AppStyles.normalText(
                          title: 'Verify', color: Colors.white, size: 15),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
