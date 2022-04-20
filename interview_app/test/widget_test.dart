// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:interview_app/UI/auth/login_page.dart';
import 'package:interview_app/UI/auth/reset_password_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:interview_app/mock.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });
  testWidgets('Login Page Test with validation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ProviderScope(
        child: MaterialApp(supportedLocales: const [
      Locale('en'),
    ], localizationsDelegates: const [
      FormBuilderLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ], home: LoginPage())));
    await tester.pumpAndSettle();
    // Verify that the page has the login text.
    expect(find.text('Login'), findsWidgets);

    await tester.tap((find.byType(CupertinoButton)));
    await tester.pumpAndSettle();
// Test to see if required form validation works
    expect(find.textContaining('This field cannot be empty'), findsWidgets);
  });

  testWidgets('Reset Password Page Test with email validation',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ProviderScope(
        child: MaterialApp(supportedLocales: const [
      Locale('en'),
    ], localizationsDelegates: const [
      FormBuilderLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ], home: ResetPasswordPage())));
    await tester.pumpAndSettle();
    // Verify that the page has the login text.
    expect(find.text('Reset password'), findsWidgets);
// input data
    await tester.enterText(find.byType(FormBuilderTextField), 'hello');
    await tester.tap((find.byType(CupertinoButton)));
    await tester.pumpAndSettle();
// Test to see if email validation works
    expect(find.textContaining('a valid email address'), findsWidgets);
  });
}
