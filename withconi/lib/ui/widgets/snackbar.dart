import '../../import_basic.dart';

showSnackbar({required String text}) => Get.showSnackbar(GetSnackBar(
      backgroundColor: const Color.fromARGB(227, 41, 41, 41),
      barBlur: 10,
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.fastLinearToSlowEaseIn,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: const EdgeInsets.symmetric(vertical: 15),
      borderRadius: 10,
      titleText: Text(
        text,
        style: GoogleFonts.notoSans(
            fontSize: 16, fontWeight: FontWeight.normal, color: WcColors.white),
        textAlign: TextAlign.center,
      ),
      messageText: const SizedBox.shrink(),
      animationDuration: const Duration(milliseconds: 700),
      duration: const Duration(milliseconds: 900),
      snackPosition: SnackPosition.BOTTOM,
    ));
