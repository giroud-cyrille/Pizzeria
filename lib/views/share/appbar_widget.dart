import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria_good/models/cart.dart';
import 'package:provider/src/provider.dart';

class AppBarWidget extends StatefulWidget {
  final int _index;
  const AppBarWidget(this._index, {Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();

     return BottomNavigationBar(
       currentIndex: widget._index,
       onTap: (i) => setState(() {
         String page = '/';
         switch(i) {
           case 0:
             page = '/main';
             break;
           case 1:
             page = '/panier';
             break;
           case 2:
             page = '/account';
             break;
         }
         Navigator.pushNamed(context, page);
       }),
       items: [
         const BottomNavigationBarItem(
           icon: Icon(Icons.home),
           label: 'Acceuil'
         ),
         BottomNavigationBarItem(
           icon: cart.itemAmount() == 0 ? const Icon(Icons.shopping_cart) : Badge( badgeContent: Text('${cart.itemAmount()}'), child: const Icon(Icons.shopping_cart)),
           label: 'Panier'
         ),
         const BottomNavigationBarItem(
           icon: Icon(Icons.account_circle),
           label: 'Compte'
         ),
       ],
    );

  }
}
