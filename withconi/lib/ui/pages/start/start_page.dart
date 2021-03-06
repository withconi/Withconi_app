// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/controller/start_controller.dart';
import 'package:withconi/ui/pages/start/start_widgets/sns_button.dart';
import 'package:withconi/ui/theme/colors.dart';
import 'package:withconi/ui/theme/sizes.dart';
import 'package:withconi/ui/widgets/button/loading_button.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import 'package:withconi/ui/widgets/snackbar.dart';
import '../../../data/repository/conimal_repository.dart';
import '../../../data/repository/signup_repository.dart';
import '../../widgets/button/state_button.dart';
import '../../widgets/loading.dart';
import '../../widgets/text_field/textfield.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StartPageController _controller = Get.put(StartPageController());

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SizedBox(
            height: WcHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    'assets/icons/withconi.png',
                    height: 51,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    '?????? ????????????\n??????????????? ???????????????????',
                    style: GoogleFonts.notoSans(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Obx(() => WcTextField(
                        hintText: '???????????? ???????????? ??????????????????',
                        onChanged: _controller.onEmailChange,
                        textController: _controller.emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        errorText: _controller.emailErrorText.value,
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  Obx(
                    () => WcStateButtonWidget(
                      active: _controller.isButtonValid.value,
                      activeButtonColor: WcColors.blue100,
                      activeTextColor: WcColors.white,
                      buttonText: _controller.buttonText.value,
                      buttonWidth: WcWidth - 40,
                      onTap: _controller.goNext,
                      buttonState: _controller.buttonState.value,
                    ),
                  ),
                  // _controller.obx(
                  //   (state) {
                  //     switch (state) {
                  //       case ButtonState.none:
                  //         return WcStateButtonWidget(
                  //           active: _controller.isButtonValid.value,
                  //           activeButtonColor: WcColors.blue100,
                  //           activeTextColor: WcColors.white,
                  //           buttonText: _controller.buttonText.value,
                  //           buttonWidth: WcWidth - 40,
                  //           onTap: _controller.goNext,
                  //         );
                  //       case ButtonState.loading:
                  //         return WcStateButtonWidget(
                  //           active: _controller.isButtonValid.value,
                  //           activeButtonColor: WcColors.blue100,
                  //           activeTextColor: WcColors.white,
                  //           buttonText: _controller.buttonText.value,
                  //           buttonWidth: WcWidth - 40,
                  //           onTap: _controller.goNext,
                  //         );
                  //       case ButtonState.sucess:
                  //         return WcStateButtonWidget(
                  //           active: _controller.isButtonValid.value,
                  //           activeButtonColor: WcColors.blue100,
                  //           activeTextColor: WcColors.white,
                  //           buttonText: _controller.buttonText.value,
                  //           buttonWidth: WcWidth - 40,
                  //           onTap: _controller.goNext,
                  //         );
                  //       default:
                  //         return WcStateButtonWidget(
                  //           active: _controller.isButtonValid.value,
                  //           activeButtonColor: WcColors.blue100,
                  //           activeTextColor: WcColors.white,
                  //           buttonText: _controller.buttonText.value,
                  //           buttonWidth: WcWidth - 40,
                  //           onTap: _controller.goNext,
                  //         );
                  //     }
                  //   },
                  //   // WcWideButtonWidget(
                  //   //   active: _controller.isButtonValid.value,
                  //   //   activeButtonColor: WcColors.blue100,
                  //   //   activeTextColor: WcColors.white,
                  //   //   buttonText: _controller.buttonText.value,
                  //   //   buttonWidth: WcWidth - 40,
                  //   //   onTap: _controller.goNext,
                  //   // ),
                  //   // onLoading: WcLoadingButtonWidget(),
                  //   // onEmpty: WcWideButtonWidget(
                  //   //   active: _controller.isButtonValid.value,
                  //   //   activeButtonColor: WcColors.blue100,
                  //   //   activeTextColor: WcColors.white,
                  //   //   buttonText: _controller.buttonText.value,
                  //   //   buttonWidth: WcWidth - 40,
                  //   //   onTap: _controller.goNext,
                  //   // ),
                  // ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SnsButtonWidget(
                          imageSrc: 'assets/icons/kakao.png',
                          label: '????????????',
                          onTap: () {
                            showLoading(() => _controller.nextStepWithSns(
                                provider: ProviderOptions.kakao));
                          },
                        ),
                        SnsButtonWidget(
                          imageSrc: 'assets/icons/google.png',
                          label: '??????',
                          onTap: () {
                            showLoading(() => _controller.nextStepWithSns(
                                provider: ProviderOptions.google));
                          },
                        ),
                        SnsButtonWidget(
                          imageSrc: 'assets/icons/naver.png',
                          label: '?????????',
                          onTap: () {
                            showLoading(() => _controller.nextStepWithSns(
                                provider: ProviderOptions.naver));
                          },
                        ),
                        SnsButtonWidget(
                          imageSrc: 'assets/icons/apple.png',
                          label: '??????',
                          onTap: () {
                            showLoading(() => _controller.nextStepWithSns(
                                provider: ProviderOptions.apple));
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
