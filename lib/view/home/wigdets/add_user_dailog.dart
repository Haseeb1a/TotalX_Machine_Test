import 'package:flutter/material.dart';
import 'package:totalxtest/constants/colors.dart';
import 'package:totalxtest/constants/style.dart';
import 'package:totalxtest/view/home/wigdets/image_picker_card.dart';
import 'package:totalxtest/view/widgets/textformfield.dart';

class AddUserDailog extends StatelessWidget {
  const AddUserDailog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SingleChildScrollView(
          child: SizedBox(
              height: mqSize.height * .56,
              width: mqSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppStyles.normalText(
                    title: "Add A New User",
                    size: 15,
                    color: AppColors.dark,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                            radius: mqSize.height * 0.08,
                            backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkXhhV-hg6bniQ8V2oY6WFTcOiEUmC_qZy0XGUuh0q3SMXn6DvbtM7HTsIj9YOpLTEcK0&usqp=CAU')),
                        Positioned(
                          left: mqSize.width * 0.01,
                          top: mqSize.height * 0.10,
                          child: Transform.rotate(
                            angle: 3.14 / 1,
                            child: ClipRect(
                              child: Align(
                                alignment: Alignment.topCenter,
                                heightFactor: 0.4,
                                child: CircleAvatar(
                                  radius: mqSize.height * 0.075,
                                  backgroundColor:
                                      AppColors.dark.withOpacity(0.1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: mqSize.height * 0.1,
                          left: mqSize.width * 0.10,
                          child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    context: context,
                                    builder: (builder) {
                                      return const ImagePickerCard(); //imagepicker card
                                    });
                              },
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                size: 25,
                                color: AppColors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: AppStyles.normalText(
                        title: "Name",
                        fontWeight: FontWeight.w500,
                        size: 14,
                        color: AppColors.grey),
                  ),
                  SizedBox(
                    height: mqSize.height * 0.005,
                  ),
                  Custom_Textformfeild(
                    hinttext: "Name",
                    unvaildText: "Please Enter the Name",
                    feildheight: 5,
                  ),
                  SizedBox(
                    height: mqSize.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: AppStyles.normalText(
                        title: "Age",
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                        size: 14),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Custom_Textformfeild(
                    hinttext: " Age",
                    unvaildText: "Please Enter the Age",
                    feildheight: 5,
                  ),
                  SizedBox(
                    height: mqSize.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: mqSize.width * .28,
                          height: mqSize.height * 0.04,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: const WidgetStatePropertyAll(
                                    AppColors.offWhiteside)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: AppStyles.normalText(
                                title: 'Cancel',
                                color: AppColors.grey,
                                size: 13,
                                fontWeight: FontWeight.w500),
                          )),
                      SizedBox(
                        width: mqSize.width * 0.03,
                      ),
                      SizedBox(
                          width: mqSize.width * .27,
                          height: mqSize.height * 0.04,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: WidgetStatePropertyAll(
                                    AppColors.styleBlueshade)),
                            onPressed: () {},
                            child: AppStyles.normalText(
                                title: 'Save',
                                color: AppColors.white,
                                size: 13,
                                fontWeight: FontWeight.w500),
                          )),
                    ],
                  ),
                ],
              )
              //   },
              // ),
              )),
    );
  }
}
