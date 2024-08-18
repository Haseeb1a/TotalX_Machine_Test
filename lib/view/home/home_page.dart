import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalxtest/constants/colors.dart';
import 'package:totalxtest/constants/style.dart';
import 'package:totalxtest/controller/auth_controller.dart';
import 'package:totalxtest/controller/home_user_controller.dart';
import 'package:totalxtest/view/auth/login_page.dart';
import 'package:totalxtest/view/home/wigdets/add_user_dailog.dart';
import 'package:totalxtest/view/home/wigdets/search_page.dart';
import 'package:totalxtest/view/home/wigdets/sort_list.dart';
import 'package:totalxtest/view/home/wigdets/user_card_item.dart';
import 'package:totalxtest/view/widgets/textformfield.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: AppColors.whiteshade,
          appBar: AppBar(
            toolbarHeight: mqSize.height * 0.1,
            backgroundColor: AppColors.dark,
            leadingWidth: double.infinity,
            leading: Row(
              children: [
                const SizedBox(width: 5),
                const Icon(
                  Icons.location_on,
                  size: 24,
                  color: Colors.white,
                ),
                const SizedBox(width: 4),
                AppStyles.normalText(
                  title: 'Nilambur',
                  color: AppColors.white,
                  size: 17,
                ),
              ],
            ),
            actions: [
              Consumer<AuthController>(
                builder: (context, authController, child) {
                  return IconButton(
                    onPressed: () {
                      authController
                          .signOut()
                          .then((value) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Loginpage(),
                              )));
                    },
                    icon: const Icon(
                      Icons.logout_outlined,
                      color: AppColors.white,
                    ),
                  );
                },
              ),
              const SizedBox(width: 3),
            ],
          ),
          body: Consumer<HomeProvider>(
            builder: (context, homeProvider, child) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Custom_Textformfeild(
                                ontap: () =>Navigator.push(context,MaterialPageRoute(builder: (context) => SearchUserScreen(),)),
                                  readOnlyacitvate: true,
                                  iconvisible: true,
                                  hinttext: 'Search by name',
                                  unvaildText: 'Enter a valid Name',
                                  onButtonPressed: (value) {
                                  }),
                            ),
                            SizedBox(
                              width: mqSize.width * 0.02,
                            ),
                            IconButton(
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                ),
                                backgroundColor: const WidgetStatePropertyAll(
                                  Colors.black,
                                ),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>
                                      SortList(), // Bottom Sheet
                                );
                              },
                              icon: const Icon(
                                Icons.filter_list_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: mqSize.height * 0.02),
                        Align(
                          alignment: Alignment.topLeft,
                          child: AppStyles.normalText(
                            title: 'Users Lists',
                            size: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 7),
                      child: homeProvider.isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : homeProvider.usersList.isEmpty
                              ? const Center(
                                  child: Text(
                                    'No users found.',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                )
                              : ListView.builder(
                                  controller: homeProvider.scrollController,
                                  itemCount: homeProvider.usersList.length,
                                  itemBuilder: (context, index) {
                                    final data = homeProvider.usersList[index];
                                    return Column(
                                      children: [
                                        UserCardItem(
                                          user: data,
                                        ),
                                        if (index ==
                                                homeProvider.usersList.length -
                                                    1 &&
                                            homeProvider.isMoreDataLoading)
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                strokeWidth: 3,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          )
                                      ],
                                    );
                                  },
                                ),
                    ),
                  ),
                ],
              );
            },
          ),
          floatingActionButton: SizedBox(
            height: mqSize.height * 0.10,
            width: mqSize.width * 0.15,
            child: FittedBox(
              child: FloatingActionButton(
                backgroundColor: AppColors.dark,
                shape: const CircleBorder(),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddUserDailog();
                    },
                  );
                },
                child: const Icon(
                  Icons.add,
                  color: AppColors.white,
                  size: 30,
                ),
              ),
            ),
          )),
    );
  }
}
