import 'package:flutter/material.dart';
import '../models/category.dart';
import '../widgets/category_item.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories;
  final List<Meal> meals;
  CategoriesScreen({required this.categories, required this.meals});
  @override
  Widget build(BuildContext context) {
    return categories.length > 0
        ? GridView(
            padding: const EdgeInsets.all(15),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              //childAspectRatio: 3 / 2,
              mainAxisExtent: 135,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: categories.map((category) {
              final categoryMeals = meals
                  .where((meal) => meal.categoryId == category.id)
                  .toList();
              return CategoryItem(
                category: category,
                meals: categoryMeals,
              );
            }).toList(),
          )
        : const Center(
            child: Text("Ovqatlar yo'q!"),
          );
  }
}
