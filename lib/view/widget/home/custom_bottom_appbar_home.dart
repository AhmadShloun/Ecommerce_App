import 'package:ecommerce/controller/home_controller/homescreen_controller.dart';
import 'package:ecommerce/view/widget/home/custom_button_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtomAppBarHome extends StatelessWidget {
  const CustomButtomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            children: [
              ...List.generate(controller.listPage.length + 1, (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomButtonAppBar(
                        textButton: controller.bottomAppBar[i]['title'],
                        iconData: controller.bottomAppBar[i]['icon'],
                        onPressed: () {
                          controller.changePage(i);
                        },
                        activate: controller.currentPage == i ? true : false,
                      );
              }),
            ],
          ),
        );
      },
    );
  }
}
