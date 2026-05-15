import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_flutter_app/screens/login_screen/login_state.dart';
// import 'package:http/http.dart' as http;

// import 'login_state.dart';

// final loginControllerProvider =
//     StateNotifierProvider<LoginController, LoginState>(
//   (ref) => LoginController(),
// );

final loginControllerProvider =
    NotifierProvider<LoginController, LoginState>(
  LoginController.new,
);

class LoginController extends Notifier<LoginState> {

  @override
  LoginState build() {
    return const LoginState();
  }
  
  void updateEmail(String email) {
    state = state.copyWith(email: email);
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