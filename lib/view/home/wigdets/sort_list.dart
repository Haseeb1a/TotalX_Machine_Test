import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalxtest/constants/colors.dart';
import 'package:totalxtest/constants/style.dart';
import 'package:totalxtest/controller/home_user_controller.dart';

class SortList extends StatelessWidget {
  SortList({super.key});

  @override
  Widget build(BuildContext context) {
    final userSortController = Provider.of<HomeUserController>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: AppStyles.normalText(
              title: 'Sort',
              size: 19,
              color: AppColors.dark,
              fontWeight: FontWeight.w700,
            ),
          ),
          RadioListTile<int>(
            title: AppStyles.normalText(
              title: 'All',
              color: AppColors.dark,
              fontWeight: FontWeight.w500,
            ),
            value: 1,
            groupValue: userSortController.selectedValue,
            onChanged: (value) {
              userSortController.sortchanger(value!);
            },
          ),
          RadioListTile<int>(
            title: AppStyles.normalText(
              title: 'Age: Elder',
              color: AppColors.dark,
              fontWeight: FontWeight.w500,
            ),
            value: 2,
            groupValue: userSortController.selectedValue,
            onChanged: (value) {
              userSortController.sortchanger(value!);
            },
          ),
          RadioListTile<int>(
            title: AppStyles.normalText(
              title: 'Age: Younger',
              color: AppColors.dark,
              fontWeight: FontWeight.w500,
            ),
            value: 3,
            groupValue: userSortController.selectedValue,
            onChanged: (value) {
              userSortController.sortchanger(value!);
            },
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
