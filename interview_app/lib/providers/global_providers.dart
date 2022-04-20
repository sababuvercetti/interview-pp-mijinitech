import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailProvider = StateProvider<EmailProvider>((ref) {
  return EmailProvider();
});

class EmailProvider extends StateNotifier<String> {
  EmailProvider() : super('');

  void save(String e) {
    state = e;
  }
}

final passwordProvider = StateProvider<PasswordProvider>((ref) {
  return PasswordProvider();
});

class PasswordProvider extends StateNotifier<String> {
  PasswordProvider() : super('');

  void save(String e) {
    state = e;
  }
}
