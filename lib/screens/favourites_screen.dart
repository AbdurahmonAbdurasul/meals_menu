import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatefulWidget {
  final List<Meal> favourites;
  final Function toggleLike;
  final Function isFavourite;
  const FavouritesScreen({
    super.key,
    required this.favourites,
    required this.toggleLike,
    required this.isFavourite,
  });

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  
  void _toggleLike(String mealId) {
    setState(() {
      widget.toggleLike(mealId);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Sevimli taom o'chirildi"),
        action: SnackBarAction(
          label: "Bekor qilish",
          onPressed: () {
            setState(
              () {
                widget.toggleLike(mealId);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.favourites.length > 0
        ? ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: widget.favourites.length,
            itemBuilder: (context, index) => MealItem(
              meal: widget.favourites[index],
              toggleLike: _toggleLike,
              isFavourite: widget.isFavourite,
            ),
          )
        : Center(
            child: Text("Sevimlida ovqatlar yo'q!"),
          );
  }
}
