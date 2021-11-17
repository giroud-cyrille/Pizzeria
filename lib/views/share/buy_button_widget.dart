import 'package:flutter/material.dart';
import 'package:pizzeria_good/models/cart.dart';
import 'package:pizzeria_good/models/product.dart';
import 'package:provider/provider.dart';

class BuyButtonWidget extends StatelessWidget {
  final Product _product;

  const BuyButtonWidget(this._product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(onPressed: () { cart.addProduct(_product); },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
          ),
        ),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40)
          ),
          child: const Center(
            child: Text('Ajouter au panier',
                style: TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'nunito',
                    fontWeight: FontWeight.bold
                )
            ),
          ),
        ),
      ),
    );
  }
}
