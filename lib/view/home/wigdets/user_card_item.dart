import 'package:flutter/material.dart';
import 'package:totalxtest/constants/colors.dart';
import 'package:totalxtest/constants/style.dart';

class UserCardItem extends StatelessWidget {
  const UserCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 1.5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 1,
        color: AppColors.white,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkXhhV-hg6bniQ8V2oY6WFTcOiEUmC_qZy0XGUuh0q3SMXn6DvbtM7HTsIj9YOpLTEcK0&usqp=CAU',
              fit: BoxFit.cover,
            ).image,
          ),
          title: AppStyles.normalText(
              title: 'Amal',
              size: 15,
              color: AppColors.dark,
              fontWeight: FontWeight.w600),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mqSize.height * 0.007,
              ),
              AppStyles.normalText(
                  title: 'Age: 24',
                  size: 15,
                  color: AppColors.dark,
                  fontWeight: FontWeight.w500)
            ],
          ),
        ),
      ),
    );
  }
}
