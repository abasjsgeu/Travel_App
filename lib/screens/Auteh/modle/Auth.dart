import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_app1/constants.dart';
import 'package:travel_app1/main.dart';
import 'package:travel_app1/screens/Auteh/controller/services.dart';

abstract class Auth1 {
  static Future signUp1(
      String email, String password, String phon, Function v) async {
    try {
      await v();
      await supabase.auth.signUp(
        password: password,
        email: email.toString(),
        data: {"phon": phon},
      );
      Get.snackbar(
        "welcom ${email} ! ",
        '',
        icon: Icon(
          Icons.close,
          color: colorwhite,
        ),
        duration: Duration(seconds: 3),
        backgroundColor: colorwhite,
        colorText: colorblue,
      );
      // final userId = supabase.auth.currentUser!.toJson();
      // print(userId);

      print("ooooooooooooooooooo");
      Get.offAllNamed('/HomeScreenView');
    } on Exception catch (e) {
      // TODO
      Get.snackbar(
        "Error please try agin  ! ",
        '',
        icon: Icon(
          Icons.close,
          color: colorwhite,
        ),
        duration: Duration(seconds: 3),
        backgroundColor: colorblue,
        colorText: colorwhite,
      );
      sharedPreferences!.clear();
    }
  }

  static Future Login(
    String email,
    String pass,
  ) async {
    try {
      await supabase.auth.signInWithPassword(password: pass, email: email);
      // await supabase.auth.signInWithPassword(password: pass, email: email);
      Get.snackbar(
        "welcom back ${email} ! ",
        '',
        icon: Icon(
          Icons.close,
          color: colorwhite,
        ),
        duration: Duration(seconds: 3),
        backgroundColor: colorwhite,
        colorText: colorblue,
      );
      // if (res.user != null) await _saveFCMToken(res.user!.id, res.user!.email);

      Get.offAllNamed('/HomeScreenView');
    } on Exception catch (e) {
      // TODO
      Get.snackbar(
        "Error please try agin  ! ",
        '',
        icon: Icon(
          Icons.close,
          color: colorwhite,
        ),
        duration: Duration(seconds: 3),
        backgroundColor: colorblue,
        colorText: colorwhite,
      );
      sharedPreferences!.clear();
    }
  }

  static Future<void> _saveFCMToken(String userId, String? em) async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken == null) return;

    await supabase
        .from('profiles')
        .update({'fcm_token': fcmToken, 'email': em}).eq('id', userId);
  }

  static Future ResetPasswor({required String emai}) async {
    try {
      await supabase.auth.resetPasswordForEmail(emai);
      sharedPreferences!.setString('another_email', emai!);
      Get.toNamed('/ConfirmPassworView');
    } on Exception catch (e) {
      // TODO
    }
  }

  static Future chack(String? token) async {
    try {
      await supabase.auth.verifyOTP(
          type: OtpType.email,
          token: token,
          email: sharedPreferences!.getString('another_email'));

      Get.showSnackbar(
        GetSnackBar(
          title: "Good!",
          message: ' Successfully',
          icon: Icon(
            Icons.check,
            color: colorwhite,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      AutehController cc = Get.put(AutehController());

      cc.Tocen.value = "";
      Get.toNamed("/ResetpasswordView");
    } on Exception catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: "ERROR",
        message: 'Error Token',
        icon: Icon(
          Icons.close,
          color: colorwhite,
        ),
        duration: Duration(seconds: 3),
      ));
    }
  }

  static Future<void> Messaging_Segin() async {
    supabase.auth.onAuthStateChange.listen((event) async {
      if (event.event == AuthChangeEvent.signedIn) {
        final fcmoken = await FirebaseMessaging.instance.getToken();
        if (fcmoken != null) {
          await supabase.from('user').insert(
            {
              // 'id': userId,
              'created_at': 'saawwwwww',
            },
          );
          print("---------hhhhhhhhhhhhhhhhhhhhhh------");
        }
      }
    });
    print("--------xxxxxxxxxxxxxxxxxxxxxxx------------------------------");

    FirebaseMessaging.instance.onTokenRefresh.listen(
      (fcmoken) async {
        supabase.from('user').insert(
          {
            // 'id': userId,
            'created_at': 'saawwwwww',
          },
        );
      },
    );
  }

  // static Future<User?> getuser() async {
  //   final res = await supabase.auth.currentUser!(Au);
  //   final user = res.user;
  //   print('-lllllllllllllllllllllllll');
  //   print(user);
  //   return user;
  // }

  static void setupAuthListener() {
    supabase.auth.onAuthStateChange.listen((data) async {
      final event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        final fcmoken = await FirebaseMessaging.instance.getToken();
        if (fcmoken != null) {
          print("---------nnnnnnnnnnnnnnnnnnnnnnn------");

          await _updaetToken(fcmoken);
        }
      }
    });
    FirebaseMessaging.instance.onTokenRefresh.listen((prover) {
      _updaetToken(prover);
    });
  }

  static Future<void> _updaetToken(String fcmoken) async {
    final userID = supabase.auth.currentUser?.id;
    final email = supabase.auth.currentUser?.email;

    print(email);

    await supabase.from('profiles').upsert(
      {'id': userID, 'fcm_token': fcmoken, 'email': email},
    );
  }

  ///Reset_Password
  static Future<void> updatepassward(String newpass, Function f) async {
    try {
      f();
      await supabase.auth.updateUser(UserAttributes(password: newpass));

      Get.showSnackbar(
        GetSnackBar(
          title: "Good Reset Password ! ",
          message: ' Successfully',
          icon: Icon(
            Icons.check,
            color: colorwhite,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      Get.offAllNamed("/");
    } on Exception catch (e) {
      // TODO
      Get.showSnackbar(
        GetSnackBar(
          title: "ERROR Reset Password ! ",
          message: ' ERROR',
          icon: Icon(
            Icons.close,
            color: colorwhite,
          ),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
