import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:interview_app/firebase_options.dart';
import 'package:interview_app/providers/global_providers.dart';
import 'package:interview_app/routes/router.gr.dart';
import 'package:provider/provider.dart' as s;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return s.MultiProvider(
      providers: [
        s.Provider<EmailProvider>(
          create: (_) => EmailProvider(),
        ),
        s.Provider<PasswordProvider>(
          create: (_) => PasswordProvider(),
        ),
        s.Provider<CodeProvider>(
          create: (_) => CodeProvider(),
        ),
        s.Provider<HomeBottomIndexProvider>(
          create: (_) => HomeBottomIndexProvider(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Interview APP',
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        supportedLocales: const [
          Locale('en'),
        ],
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
