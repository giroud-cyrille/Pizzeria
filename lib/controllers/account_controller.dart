import 'dart:convert';

import 'bdd_controller.dart';
import 'package:crypto/crypto.dart';

class AccountController {
  static bool _isConnected = false;

  static bool isConnected() {
    return _isConnected;
  }

  static Future<bool> connect(login, password) async {
    var users = await BddController.getUser(login);

    if(users.isEmpty) {
      return false;
    }

    var passwordBytes = utf8.encode(password);
    var hash = sha512.convert(passwordBytes);

    if(users['password'] != hash) {
      return false;
    }

    _isConnected = true;
    return true;
  }

  static void register(login, password, mail) async {

  }
}