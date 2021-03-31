import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final List<int> _favoriteItems = [];
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  List<int> get items => _favoriteItems;

  Future<bool> check() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (usernameController.text == 'admin' && passwordController.text == '1234') return true;
    return false;
  }
}
