import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meals_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function toggleLike;
  final Function isFavourite;
  const MealItem({
    Key? key,
    required this.meal,
    required this.toggleLike,
    required this.isFavourite,
  }) : super(key: key);

  void goToMealDetails(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealsDetailsScreen.routeName, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => goToMealDetails(context)),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 235,
                    child: meal.imageURLs[0].startsWith("assets")
                        ? Image.asset(
                            meal.imageURLs[0],
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            meal.imageURLs[0],
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        width: 200,
                        height: 40,
                        alignment: Alignment.center,
                        color: Colors.black.withOpacity(0.7),
                        child: Text(
                          meal.title,
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () => toggleLike(meal.id),
                      icon: Icon(
                        isFavourite(meal.id)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: Colors.black54,
                        size: 25,
                      ),
                    ),
                    Text(
                      "${meal.preparingTime} minutes",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "\$${meal.price}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
