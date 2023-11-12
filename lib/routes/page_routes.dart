import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:useme_app/views/auth/signin_screen.dart';
import 'package:useme_app/views/base/base_screen.dart';

abstract class AppPage {
  static final pages = <GetPage>[
    GetPage(name: '/login', page: () => SignInScreen()),
    GetPage(name: '/base', page: () => const BaseScreen())
  ];
}
