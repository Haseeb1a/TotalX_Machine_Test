import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeUserController extends ChangeNotifier {

  int selectedValue = 1;
  String imagePath = "";

  // filltering users based on age
  sortchanger(int value) {
    selectedValue = value;
    notifyListeners();
  }

    //set user ProfilePic with diffrent imageSource
  Future<void> setProfilePic(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      imagePath = image.path;
    }
    notifyListeners();
  }

}
