import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_flutter_app/screens/login_screen/login_state.dart';
// import 'package:http/http.dart' as http;

// import 'login_state.dart';

// final loginControllerProvider =
//     StateNotifierProvider<LoginController, LoginState>(
//   (ref) => LoginController(),
// );

// final loginControllerProvider =
//     NotifierProvider<LoginController, LoginState>(
//   LoginController.new,
//   isAutoDispose: true,
// );

final loginControllerProvider = NotifierProvider.family<LoginController, LoginState, String?>(
      (arg) => LoginController(arg),
      isAutoDispose: true,
);

class LoginController extends Notifier<LoginState> {

  LoginController(this.initialState);

  final String? initialState;

   @override
  LoginState build() {
    print(initialState);
    emailController.text = initialState ?? "---";
    // updateEmail(initialState ?? "");
    // print("2");

    return LoginState(email: initialState ?? "");
  }

  final TextEditingController emailController = TextEditingController(text: "email");

  void updateEmail(String email) {
    emailController.text = email;
    state = state.copyWith(email: email);
    print("updating email: $email");
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<void> login() async {
    if (!state.isButtonEnabled) return;

    state = state.copyWith(isLoading: true);

    try {
      final response = null;

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print('Login Success');
        print('Token: ${data['token']}');
      } else {
        print('Login Failed');
        print(response.body);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}