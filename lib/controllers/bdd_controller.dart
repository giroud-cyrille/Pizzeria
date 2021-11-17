import 'package:flutter/gestures.dart';
import 'package:mysql1/mysql1.dart';
import 'package:pizzeria_good/constants/bdd_constant.dart';

class BddController {

  static final _connectionInformations = ConnectionSettings(
      host: BddConstants.host,
      port: BddConstants.port,
      user: BddConstants.user,
      password: BddConstants.password,
      db: BddConstants.db);

  static Future<List<dynamic>> getData() async {
    var connection = await MySqlConnection.connect(_connectionInformations);

    var results = await connection.query('select * from products');

    await connection.close();

    return results.toList();
  }

  static Future<dynamic> getUser(login) async {
    var connection = await MySqlConnection.connect(_connectionInformations);

    var results = await connection.query('select * from users where email = ?', [login]);

    await connection.close();

    return results.toList();
  }
}