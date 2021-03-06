import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationUtil {
  final FirebaseAuth firebaseAuth;
  AuthenticationUtil(this.firebaseAuth);

  Stream<User?> get authStateChange => firebaseAuth.authStateChanges();

  Future<UserCredential?> signIn(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    }
  }

  Future<UserCredential> signUp(
      {required String email, required String password}) async {
    try {
      var response = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response;
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    }
  }

  Future resetPassword({
    required String email,
  }) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    }
  }

  Future enterResetVerifyCode(
      {required String code, required String newPassword}) async {
    try {
      await firebaseAuth.confirmPasswordReset(
          code: code, newPassword: newPassword);
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    }
  }

  Future<void> signout() async {
    await firebaseAuth.signOut();
  }
}
