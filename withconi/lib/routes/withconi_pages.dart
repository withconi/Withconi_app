import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/home/home_page.dart';
import 'package:withconi/ui/pages/signin/signin_email_page.dart';
import 'package:withconi/ui/pages/signup/disease_search_page.dart';
import 'package:withconi/ui/pages/signup/signup_conimal_edit_page.dart';
import 'package:withconi/ui/pages/signup/signup_profile_page.dart';
import 'package:withconi/ui/pages/signup/signup_pw_page.dart';
import 'package:withconi/ui/pages/signup/signup_conimal_page_1.dart';
import 'package:withconi/ui/pages/splash.dart';
import 'package:withconi/ui/pages/start/start_page.dart';

import '../ui/pages/signup/signup_conimal_page_2.dart';

class WCPages {
  static final pages = [
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        transition: Transition.fade
        //  binding: HomeBinding()
        ),
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashPage(),
        transition: Transition.fade
        //  binding: HomeBinding()
        ),
    GetPage(
      name: Routes.START,
      page: () => StartPage(),
    ),
    GetPage(
      name: Routes.SIGNUP_PW,
      page: () => SignupPwPage(),
    ),
    GetPage(
      name: Routes.SIGNUP_PROFILE,
      page: () => SignupProfilePage(),
    ),
    GetPage(name: Routes.SIGNIN_EMAIL, page: () => SigninEmailPage()),
    GetPage(
      name: Routes.SIGNUP_CONIMAL_STEP1,
      page: () => SignupConimalPage1(),
    ),
    GetPage(
      name: Routes.SIGNUP_CONIMAL_STEP2,
      page: () => SignupConimalPage2(),
    ),
    GetPage(
      name: Routes.SIGNUP_CONIMAL_EDIT,
      page: () => SignupConimalEditPage(),
    ),
    GetPage(
      name: Routes.SIGNUP_DISEASE_SEARCH,
      page: () => DiseaseSearchPage(),
    ),
  ];
}
