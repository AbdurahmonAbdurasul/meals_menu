import 'package:flutter/material.dart';
import 'package:meals/screens/category_meals_screen.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final List<Meal> meals;
  const CategoryItem({Key? key, required this.category, required this.meals})
      : super(key: key);

  void _goToCategoryMealsScreen(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder:(context) =>  CategoryMealsScreen(categoryName: category.title,)));
    Navigator.of(context)
        .pushNamed(CategoryMealsScreen.routeName, arguments: {
          "categoryTitle":category.title,
          "categoryMeals":meals,
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToCategoryMealsScreen(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                category.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
