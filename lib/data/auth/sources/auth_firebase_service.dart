import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_application/data/auth/models/signin_req_params.dart';
import 'package:flutter_application/data/auth/models/signup_req_params.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
  Future<bool> isLoggedIn();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(SignupReqParams params) async {
    try {
      var returnedData =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(returnedData.user?.uid)
          .set({
        'email': params.email,
        // Add other user details here
      });
      return const Right("User signed up successfully with Firebase");
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = e.message ?? 'An unknown error occurred.';
      }
      return Left(errorMessage);
    }
    // Implement Firebase signup logic here
    // Return Either type with success or failure
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      return const Right("User sign in successfully with Firebase");
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else {
        errorMessage = e.message ?? 'An unknown error occurred.';
      }
      /* return Left(errorMessage); */
      errorMessage = 'Algo salio mal';
      return Left(errorMessage);
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
