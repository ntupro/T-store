import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/navigation_menu.dart';

// import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
// import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
// import 'package:t_store/utils/exceptions/format_exceptions.dart';
// import 'package:t_store/utils/exceptions/platform_exceptions.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  // final _auth = FirebaseAuth.instance;

  /// Called from main.dart app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  Future<void> screenRedirect() async {
    // final user = _auth.currentUser;
    // if (user != null) {
    //   if (user.emailVerified) {
    //     Get.offAll(() => const NavigationMenu());
    //   } else {
    //     Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
    //   }
    // } else {
    // Local Storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnboardingScreen());
    // }
  }

  /* --------------------- Email & Password sign-in ------------------------- */

  /// [EmailAuthentication] - LOGIN
  // Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
  //   try {
  //     return await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  /// [EmailAuthentication] - REGISTER
  // Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
  //   try {
  //     return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  /// [EmailVerification] - MAIL VERIFICATION
  // Future<void> sendEmailVerification() async {
  //   try {
  //     await _auth.currentUser?.sendEmailVerification();
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  /// [ReAuthentication] - ReAuthenticate User

  /// [EmailAuthentication] - Forgot Password

  /* --------------------- Federated identity & social sign-in ------------------------- */

  /// [GoogleAuthentication] - GOOGLE

  /// [FacebookAuthentication] - FACEBOOK

  /* --------------------- ./end Federated identity & social sign-in ------------------------- */

  /// [LogoutUser] - Valid for any authentication
  // Future<void> logout() async {
  //   try {
  //     await FirebaseAuth.instance.signOut();
  //     Get.offAll(() => const LoginScreen());
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  /// DELETE USER - Remove user Auth & Firebase Account
}
