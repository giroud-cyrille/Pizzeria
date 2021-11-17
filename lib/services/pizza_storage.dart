import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pizzeria_good/controllers/bdd_controller.dart';
import 'package:pizzeria_good/models/pizza.dart';
import 'package:pizzeria_good/models/product.dart';

class PizzaStorage {

  static List<Product> _products = [];

  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();

    final path = directory.path;

    return File('$path/pizzas.json');
  }

  static Future<List<Product>> loadProducts() async {
    List<Product> products = [];
    var results = await BddController.getData();

    for(var row in results) {
      switch(row['type'])
      {
        case 0:
          products.add(Pizza(row['id'], row['title'], row['garniture'],
              row['image'], row['price'], row['type']));
          break;
        case 2:
          break;
      }
    }

    _products = products;

    return products;
  }

  static List<Product> getProducts() {
    return _products;
  }

  Future<void> save(List<Pizza> liste) async {
    try {
      final file = await _localFile;

      String contents = jsonEncode(liste);
      file.writeAsString(contents);

    } catch(e) {
      print('ERROR=$e');
    }
  }
}