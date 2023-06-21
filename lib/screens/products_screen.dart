import 'package:flutter/material.dart';
import 'package:meals/screens/add_new_product_screen.dart';
import 'package:meals/widgets/main_drawer.dart';
import '../models/meal.dart';

class ProductsScreen extends StatefulWidget {
  final List<Meal> meals;
  final Function deleteMeal;

  const ProductsScreen({
    super.key,
    required this.meals,
    required this.deleteMeal,
  });

  static const routeName = "/products";

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void _goToAddNewProduct(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AddNewProductScreen.routeName)
        .then((value) {
      if (value != null) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mahsulotlar"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => _goToAddNewProduct(context),
              icon: Icon(Icons.add),
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: ListView.builder(
            itemCount: widget.meals.length,
            itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          widget.meals[index].imageURLs[0].startsWith("assets")
                              ? AssetImage(widget.meals[index].imageURLs[0])
                              : NetworkImage(widget.meals[index].imageURLs[0])
                                  as ImageProvider,
                    ),
                    title: Text(widget.meals[index].title),
                    subtitle: Text("\$${widget.meals[index].price}"),
                    trailing: IconButton(
                      onPressed: () => widget.deleteMeal(widget.meals[index].id),
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                )));
  }
}
