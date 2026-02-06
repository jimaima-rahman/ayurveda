import 'package:ayurveda/services/auth_services.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool isLoading = false;
  String? token;
  String? error;

  Future<void> login(String username, String password) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      token = await _authService.login(username: username, password: password);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
