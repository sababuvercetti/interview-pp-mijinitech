import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_app/utils/authentication_util.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authUtilProvider = Provider<AuthenticationUtil>((ref) {
  return AuthenticationUtil(ref.read(firebaseAuthProvider));
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authUtilProvider).authStateChange;
});
