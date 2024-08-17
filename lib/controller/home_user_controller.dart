

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:totalxtest/constants/sort.dart';
import 'package:totalxtest/constants/toast_message.dart';
import 'package:totalxtest/model/user_model.dart';
import 'package:totalxtest/service/user_services.dart';

class HomeProvider extends ChangeNotifier {
  AgeType selectedValue = AgeType.all;
  changeValue(AgeType value) {
    selectedValue = value;
    notifyListeners();
  }


  HomeProvider() {
    getUsers(selectedValue);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getUsers(selectedValue); // lazy loading funtionality
      }
    });
  }
  List<UserModel> usersList = [];
  QueryDocumentSnapshot<Object>? lastDocs;
  UserServices userservices = UserServices();
  final ScrollController scrollController = ScrollController();
  bool isMoreDataLoading = true;
  bool isLoading = false;


  //Get Users Data
  Future<void> getUsers(AgeType ageType) async {
    isLoading = true;
    final data = await userservices.getUsers(ageType);
    data.fold((error) {
      log(error);
      if (error == 'No More Data') {
        isMoreDataLoading = false;
        ToastMessage.showMessage(error, Colors.red);
        notifyListeners();
      } else {
        isMoreDataLoading = false;
        notifyListeners();
      }
    }, (data) {
      if (data.length != 7) {
        isMoreDataLoading = false;
        log(isMoreDataLoading.toString());
      }
      log(isMoreDataLoading.toString());
      usersList = [...usersList, ...data];
      notifyListeners();
    });
    isLoading = false;
    notifyListeners();
  }

  //add user user localy
  void addUserLocaly(UserModel userData) {
    usersList.insert(0, userData);
    notifyListeners();
  }

  //clear previous datas
  void clearData() {
    userservices.lastDocs = null;
    isMoreDataLoading = true;
    usersList.clear();
    notifyListeners();
  }
}