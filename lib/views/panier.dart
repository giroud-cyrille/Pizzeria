import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria_good/models/cart.dart';
import 'package:pizzeria_good/views/share/appbar_widget.dart';
import 'package:provider/src/provider.dart';

class Panier extends StatefulWidget {
  const Panier({Key? key}) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: const [
                Text('Mon panier', style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ))
              ],
            )
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: cart.itemAmount(),
                itemBuilder: (context, index) {
                  return _buildItem(cart.getCartItem(index), cart);
                }),
          ),
          Text('${cart.total()} €', style: const TextStyle(color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold
          )),
          _buildBuyButton(),
        ],
      ),
      bottomNavigationBar: const AppBarWidget(1),
    );
  }

  _buildItem(CartItem product, Cart cart) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'assets/images/${product.product.image}',
          height: 100,
          width: 100,
        ),
        const SizedBox(width: 30),
        Column(
          children: [
            Text(product.product.title),
            Text(product.product.price.toString())
          ],
        ),
        const SizedBox(width: 40),
        Column(
          children: [
            IconButton(
              onPressed: () { cart.addProduct(product.product); },
              icon: const Icon(Icons.add, size: 20),
            ),
            Text('${product.quantity}'),
            IconButton(
              onPressed: () { cart.removeProduct(product.product); },
              icon: const Icon(Icons.remove, size: 20),
            )
          ],
        ),
      ],
    );
  }

  _buildBuyButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(onPressed: () { },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
          ),
        ),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40)
          ),
          child: const Center(
            child: Text('Payer',
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
