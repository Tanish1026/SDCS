enum UserRole { customer, admin }

class AuthUser {
  final String email;
  final UserRole role;

  const AuthUser({required this.email, required this.role});
}

class AuthService {
  const AuthService();

  Future<AuthUser> signIn({required String email, required String password, required UserRole role}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (email.isEmpty || password.isEmpty) {
      throw ArgumentError('Email and password are required.');
    }
    return AuthUser(email: email.trim(), role: role);
  }

  Future<AuthUser> signUp({required String email, required String password, required UserRole role}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (email.isEmpty || password.isEmpty) {
      throw ArgumentError('Email and password are required.');
    }
    return AuthUser(email: email.trim(), role: role);
  }

  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
  }
}
