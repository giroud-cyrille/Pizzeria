import 'package:pizzeria_good/models/product.dart';

import 'option_item.dart';

class Pizza extends Product {
  final String garniture;

  double get total {
    double total = price;

    total += pates[pate].supplement;
    total += tailles[taille].supplement;
    total += sauces[sauce].supplement;

    return total;
  }

  // Select by user
  int pate = 0;
  int taille = 1;
  int sauce = 0;

  static final List<OptionItem> pates = [
    OptionItem(0, 'Pate fine'),
    OptionItem(1, 'Pâte épaisse', supplement: 2),
  ];

  static final List<OptionItem> tailles = [
    OptionItem(0, "Petite", supplement: -1),
    OptionItem(1, "Normal"),
    OptionItem(2, "Large", supplement: 2),
    OptionItem(3, "Extra Large", supplement: 4),
  ];

  static final List<OptionItem> sauces = [
    OptionItem(0, "Base sauce tomate"),
    OptionItem(1, "Base sauce Samourai", supplement: 2),
  ];

  @override
  Pizza.fromJson(Map<String, dynamic> json) :
        garniture = json['garniture'],
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
    'id': super.id,
    'title': super.title,
    'image': super.image,
    'price': super.price,
    'garniture': garniture,
  };

  Pizza(id, title, this.garniture, image, price, type) : super(id, title, image, price, type);
}