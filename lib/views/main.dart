import 'package:flutter/material.dart';
import 'package:pizzeria_good/controllers/bdd_controller.dart';
import 'package:pizzeria_good/models/cart.dart';
import 'package:pizzeria_good/models/entree.dart';
import 'package:pizzeria_good/models/pizza.dart';
import 'package:pizzeria_good/models/data.dart';
import 'package:pizzeria_good/models/product.dart';
import 'package:pizzeria_good/services/pizza_storage.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pizzeria_good/views/product_details.dart';
import 'package:pizzeria_good/views/share/appbar_widget.dart';
import 'package:provider/src/provider.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _ConversationsState createState() => _ConversationsState();
}

class _ConversationsState extends State<MainView> {

  Widget _body = Container(color: Colors.white, child: const SpinKitWanderingCubes(color: Colors.black, size: 50.0));

  List<Pizza> _pizzas = [];
  List<Product> _products = [];
  List<Entree> _entrees = [];

  @override
  void initState() {
    super.initState();
    _loadPizza();

  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  _loadPizza() async {
    _entrees = Data.buildEntreeList();
    _products = PizzaStorage.getProducts();

    if(_products.isEmpty) {
      _products = await PizzaStorage.loadProducts();
    }

    for(var product in _products)
    {
      switch(product.type) {
        case 0:
          _pizzas.add(product as Pizza);
          break;
        case 1:
          break;
      }
    }

    setState(() => _body = _buildMain());
  }

  _buildMain() {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                  "Valentino Pizzeria",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              Text(
                  "Nos pizzas",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _pizzas.length,
              itemBuilder: (context, index) {
                return _pizzaInfoCard(_pizzas[index]);
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              Text("Nos entrées",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _entrees.length,
              itemBuilder: (context, index) {
                return _pizzaInfoCard(_entrees[index]);
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              Text("Nos boissons",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _entrees.length,
              itemBuilder: (context, index) {
                return _pizzaInfoCard(_entrees[index]);
              },
            ),
          ),
          const SizedBox( height: 20),
        ],
      ),
      bottomNavigationBar: const AppBarWidget(0),
      backgroundColor: Colors.white,
    );
  }

  _pizzaInfoCard(Product pizza)
  {
    var format = NumberFormat("###.00 €");
    var cart = context.watch<Cart>();
    return Container(
        margin: const EdgeInsets.only(right: 15, left: 15),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: const Color(0xfffffe57f),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/${pizza.image}',
              height: 120,
              width: 100,
            ),
            Text(pizza.title, style: const TextStyle(fontSize: 20, color: Colors.black)),
            const SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(format.format(pizza.price),
                      style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.black)),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => ({
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => ProductDetailsView(pizza)),
                        )}),
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () => cart.addProduct(pizza),
                  ),
                ]
            ),
          ],
        )
      );
  }
}