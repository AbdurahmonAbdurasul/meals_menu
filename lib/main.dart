import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/add_new_product_screen.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/products_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import 'models/meal.dart';
import 'screens/meals_details_screen.dart';

void main(List<String> args) {
  runApp(MealsMenu());
}

class MealsMenu extends StatefulWidget {
  @override
  State<MealsMenu> createState() => _MealsMenuState();
}

class _MealsMenuState extends State<MealsMenu> {
  final _categoryModel = Categories();

  final _mealModel = Meals();

  void _toggleLike(String mealId) {
    setState(() {
      _mealModel.toggleLike(mealId);
    });
  }

  bool isFavourite(String mealId) {
    return _mealModel.favourites.any((meal) => meal.id == mealId);
  }

  void addNewMeal(Meal meal) {
    setState(() {
      _mealModel.addNewMeal(meal);
    });
  }

  void _deleteMeal(String id) {
    setState(() {
      _mealModel.deleteMeal(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.adventPro().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      // home: CategoriesScreen(
      //           categories: _categoryModel.list, meals: _mealModel.list)));
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (context) => TabsScreen(
              categories: _categoryModel.list,
              mealModel: _mealModel,
              toggleLike: _toggleLike,
              isFavourite: isFavourite,
            ),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
            toggleLike: _toggleLike, isFavourite: isFavourite),
        MealsDetailsScreen.routeName: (context) => MealsDetailsScreen(),
        ProductsScreen.routeName: (context) => ProductsScreen(
              meals: _mealModel.list,
              deleteMeal: _deleteMeal,
            ),
        AddNewProductScreen.routeName: (context) => AddNewProductScreen(
              categories: _categoryModel.list,
              addNewMeal: addNewMeal,
            ),
      },

      onGenerateRoute: (settings) {
        // if (settings.name == "/category-meal") {
        //   return ...;
        // }else{
        //   return ...;
        // }
        return MaterialPageRoute(
            builder: ((context) => CategoriesScreen(
                categories: _categoryModel.list, meals: _mealModel.list)));
      },

      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (context) => NotFoundPage());
      // },
    );
  }
}
