import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalxtest/constants/colors.dart';
import 'package:totalxtest/constants/sort.dart';
import 'package:totalxtest/constants/style.dart';
import 'package:totalxtest/controller/home_user_controller.dart';

class SortList extends StatelessWidget {
  SortList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<HomeProvider>(
        builder: (context, sortProvider, child) {
          return Column(
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
              RadioListTile(
                title: AppStyles.normalText(
                  title: 'All',
                  color: AppColors.dark,
                  fontWeight: FontWeight.w500,
                ),
                value: AgeType.all,
                groupValue: sortProvider.selectedValue,
                onChanged: (value) {
                  sortProvider.clearData();
                  sortProvider.changeValue(value!);

                  sortProvider.getUsers(value);
                },
              ),
              RadioListTile(
                title: AppStyles.normalText(
                  title: 'Age: Elder',
                  color: AppColors.dark,
                  fontWeight: FontWeight.w500,
                ),
                value: AgeType.elder,
                groupValue: sortProvider.selectedValue,
                onChanged: (value) {
                  sortProvider.clearData();
                  sortProvider.changeValue(value!);

                  sortProvider.getUsers(value);
                },
              ),
              RadioListTile(
                title: AppStyles.normalText(
                  title: 'Age: Younger',
                  color: AppColors.dark,
                  fontWeight: FontWeight.w500,
                ),
                value: AgeType.younger,
                groupValue: sortProvider.selectedValue,
                onChanged: (value) {
                  sortProvider.clearData();
                  sortProvider.changeValue(value!);

                  sortProvider.getUsers(value);
                },
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          );
        },
      ),
    );
  }
}
