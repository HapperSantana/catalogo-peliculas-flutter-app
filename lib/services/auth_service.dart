import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/common/helper/navigation/app_navigation.dart';
import 'package:flutter_application/presentation/auth/pages/signin.dart';

ValueNotifier<AuthService> authService =
    ValueNotifier<AuthService>(AuthService());

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // Implement authentication methods here

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    return await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> createAccount(
      {required String email, required String password}) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut({required BuildContext context}) async {
    await firebaseAuth.signOut();
    await Future.delayed(Duration(seconds: 1));
    // ignore: use_build_context_synchronously
    AppNavigator.pushReplacement(context, SigninPage());
  }

  Future<void> resetPassword({required String email}) async {
    return await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateUsername({required String username}) async {
    return await currentUser!.updateDisplayName(username);
  }

  Future<void> deleteAccount({
    required String password,
    required String email,
  }) async {
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.delete();
    await firebaseAuth.signOut();
  }

  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  }) async {
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: currentPassword);
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.updatePassword(newPassword);
  }
}
