import 'package:flutter/material.dart';

class Product {

  final int id;
  final String title;
  final String image;
  final double price;
  final int type;

  Product(this.id, this.title, this.image, this.price, this.type);

  Product.fromJson(Map<String, dynamic> json):
        id = json['id'],
        title = json['title'],
        image = json['image'],
        price = json['price'],
        type = json['type'];

  Map<String, dynamic> toJson() => {
    'id':id,
    'title':title,
    'image':image,
    'price':price,
    'type':type
  };
}