import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:totalxtest/model/user_model.dart';
import 'package:totalxtest/service/user_add_services.dart';

class UserAddController extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String imagePath = "";
  bool isLoading = false;

  // add user
  Future<void> addUser(UserModel user) async {
    await AddUserService().addUsers(user);
    notifyListeners();
  }

  //set user profile picture
  Future<void> pickImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      imagePath = image.path;
      notifyListeners();
    }
  }

  // user data from textfields
  void clearDatas() {
    nameController.clear();
    ageController.clear();
    imagePath = '';
    notifyListeners();
  }
}
