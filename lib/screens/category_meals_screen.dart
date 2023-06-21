import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  //final String categoryName;
  final Function toggleLike;
  final Function isFavourite;
  const CategoryMealsScreen({
    super.key,
    required this.toggleLike,
    required this.isFavourite,
  });
  static const routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final categoryData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = categoryData["categoryTitle"];
    final meals = categoryData["categoryMeals"] as List<Meal>;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: meals.length > 0
          ? ListView.builder(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) =>
                  MealItem(meal: meals[index], toggleLike: toggleLike,isFavourite:isFavourite),
              itemCount: meals.length,
            )
          : Center(
              child: Text("Hozircha ovqatlar mavjud emas"),
            ),
    );
  }
}
