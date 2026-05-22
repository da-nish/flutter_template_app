

class LoginState {
  final String email;
  final String password;
  final bool isLoading;

  const LoginState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
  });

  bool get isButtonEnabled {
    return email.isNotEmpty &&
        password.isNotEmpty &&
        !isLoading;
  }

  LoginState copyWith({
    String? email,
    String? password,
    bool? isLoading,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}