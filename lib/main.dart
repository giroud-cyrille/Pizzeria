import 'package:flutter/material.dart';
import 'package:pizzeria_good/services/pizza_storage.dart';
import 'package:pizzeria_good/views/main.dart';
import 'package:pizzeria_good/views/panier.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';
import 'views/account.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => Cart(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Messenger Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/main': (context) => const MainView(),
          '/panier': (context) => const Panier(),
          '/account': (context) => const Account()
        },
        home: MainView()
    );
  }
}
