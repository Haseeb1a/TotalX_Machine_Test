import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:totalxtest/controller/home_user_controller.dart';

class ImagePickerCard extends StatelessWidget {
  const ImagePickerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(
          top: mqSize.height * .03, bottom: mqSize.height * .05),
      children: [
        const Text(
          'Pick a Profile Picture',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: mqSize.height * .02),
        Consumer<HomeUserController>(builder: (context, userProvider, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      fixedSize: Size(mqSize.width * .3, mqSize.height * .15)),
                  onPressed: () async {
                      userProvider.setProfilePic(ImageSource.gallery);
                  },
                  child: Image.asset('assets/images/gallery.png')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      fixedSize: Size(mqSize.width * .3, mqSize.height * .15)),
                  onPressed: () {
                    userProvider.setProfilePic(ImageSource.camera);
                  },
                  child: Image.asset('assets/images/camera.png')),
            ],
          );
        })
      ],
    );
  }
}
