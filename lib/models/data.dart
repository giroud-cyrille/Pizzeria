import 'entree.dart';
import 'pizza.dart';

class Data {
  static List<Pizza> buildList() {
    List<Pizza> list = [];
    list.add(Pizza(1, 'Barbecue', 'La garniture', 'pizza-bbq.jpg', 8.0, 0));
    list.add(Pizza(3, 'Tomate', 'La garniture', 'pizza-vegetable.jpg', 9.0, 0));
    list.add(Pizza(2, 'Tomate', 'La garniture', 'pizza-spinach.jpg', 9.0, 0));
    list.add(Pizza(4, 'Tomate', 'La garniture', 'pizza-salami.png', 9.0, 0));
    return list;
  }

  static List<Entree> buildEntreeList() {
   List<Entree> list = [];
   list.add(Entree(1, "Salade", 'entree.png', 3.8, 1));
   list.add(Entree(2, "Salade", 'entree.png', 5.2,1 ));
   list.add(Entree(3, "Salade", 'entree.png', 2.3, 1));
   return list;
  }
}