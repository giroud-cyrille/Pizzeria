import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pizzeria_good/models/option_item.dart';
import 'package:pizzeria_good/models/pizza.dart';
import 'package:pizzeria_good/models/product.dart';
import 'package:pizzeria_good/views/share/buy_button_widget.dart';

import 'share/appbar_widget.dart';

class ProductDetailsView extends StatefulWidget {
  Product _product;

  ProductDetailsView(this._product, {Key? key}) : super(key: key);

  @override
  _ProductDetailsViewState createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    var format = NumberFormat("###.00 €");

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              // Box rose
              Container(
                height: MediaQuery.of(context).size.height - 40,
                width: MediaQuery.of(context).size.width,
                color: Color(0xfffffe57f),
              ),
              // Box blanche avec bords arrondis
              Positioned(
                top: MediaQuery.of(context).size.height / 2,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2 - 20,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    color: Colors.white,
                  ),
                ),
              ),
              // Title and description of product
              Positioned(
                top:25,
                left:25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Text('${widget._product.title}', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.lightBlue)),
                        const SizedBox(height:20),
                        const Text('Lorem ipsum dolore ', style:TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              // Image of product
              Positioned(
                top: MediaQuery.of(context).size.height /  3.5,
                left:MediaQuery.of(context).size.width / 2,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/${widget._product.image}'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              // Options of product
              Positioned(
                left: 25,
                top: MediaQuery.of(context).size.height / 2 + 40,
                child: Container(
                  height: (MediaQuery.of(context).size.height / 2.5),
                  width: MediaQuery.of(context).size.width,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Ingredients'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.local_pizza),
                            const SizedBox(width:20),
                            _buildDropDownPates(),
                          ],
                        ),
                        SizedBox(height:10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/tomato-sauce.png',
                              height: 20,
                            ),
                            const SizedBox(width:20),
                            _buildDropDownSauces(),
                          ],
                        ),
                        SizedBox(height:10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.donut_large),
                            const SizedBox(width:20),
                            _buildDropDownTaille(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(format.format((widget._product as Pizza).total), style: TextStyle(
                              fontSize: 18
                            )),
                            SizedBox(width: MediaQuery.of(context).size.width / 3),
                            BuyButtonWidget(widget._product)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const AppBarWidget(0));
  }

  _buildDropDownSauces() {
    return DropdownButton<OptionItem>(
        value: Pizza.sauces[(widget._product as Pizza).sauce],
        items: _buildDropDownItem(Pizza.sauces),
        onChanged: (item) {
          setState(() {
            (widget._product as Pizza).sauce = item!.value;
          });
        }
    );
  }

  _buildDropDownTaille() {
    return DropdownButton<OptionItem>(
        value: Pizza.tailles[(widget._product as Pizza).taille],
        items: _buildDropDownItem(Pizza.tailles),
        onChanged: (item) {
          setState(() {
            (widget._product as Pizza).taille = item!.value;
          });
        }
    );
  }

  _buildDropDownPates() {
    return DropdownButton<OptionItem>(
        value: Pizza.pates[(widget._product as Pizza).pate],
        items: _buildDropDownItem(Pizza.pates),
        onChanged: (item) {
          setState(() {
            (widget._product as Pizza).pate = item!.value;
          });
        }
    );
  }

  _buildDropDownItem(List<OptionItem> list) {
    return Iterable.generate(
      list.length,
          (i) => DropdownMenuItem<OptionItem>(
        value: list[i],
        child: Text(list[i].name),
      ),
    ).toList();
  }
}
