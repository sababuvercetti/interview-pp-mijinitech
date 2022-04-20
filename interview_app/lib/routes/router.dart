import 'package:auto_route/auto_route.dart';
import 'package:interview_app/UI/auth/login_page.dart';
import 'package:interview_app/UI/auth/reset_password_page.dart';
import 'package:interview_app/UI/auth/signup_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true),
    AutoRoute(page: SignUpPage),
    AutoRoute(page: ResetPasswordPage),
  ],
)
class $AppRouter {}
