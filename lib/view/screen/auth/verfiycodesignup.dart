import 'package:ecommerce/controller/auth/verfiycodesignup_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/custom_otp_text_field.dart';
import 'package:ecommerce/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_title_auth.dart';
import 'package:ecommerce/view/widget/auth/text_signup.dart';
import 'package:ecommerce/view/widget/background_body.dart';
import 'package:ecommerce/view/widget/main_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerfiyCodeSignUpControllerImp());
    return Scaffold(
      body: GetBuilder<VerfiyCodeSignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: BackgroundBody(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: CustomTextTitleAuth(
                      text: "34".tr, textColor: AppColor.white),
                ),
                Expanded(
                  flex: 3,
                  child: MainBody(
                    child: ListView(
                      children: [
                        // CustomTextTitleAuth(text: "27".tr),
                        const SizedBox(height: 20),
                        CustomTextBodyAuth(
                            text: "${"37".tr}\n${controller.email!}"),
                        const SizedBox(height: 15),
                        CustomOtpTextField(
                          onSubmit: (String verificationCode) {
                            controller.goToSuccessSignUp(verificationCode);
                          },
                        ),
                        const SizedBox(height: 30),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("59".tr),

                            InkWell(
                              onTap: controller.isButtonEnabled
                                  ? () {
                                      controller.resendCode();
                                    }
                                  : null,
                              child: Text(
                                "60".tr,
                                style: controller.isButtonEnabled
                                    ? const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        controller.isButtonEnabled
                            ? Container()
                            : Center(
                                child: Text(
                                    "${controller.countdown ~/ 60}:${(controller.countdown % 60).toString().padLeft(2, '0')}"),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
