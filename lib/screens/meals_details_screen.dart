import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealsDetailsScreen extends StatefulWidget {
  const MealsDetailsScreen({super.key});

  static const routeName = "/meal-details";

  @override
  State<MealsDetailsScreen> createState() => _MealsDetailsScreenState();
}

class _MealsDetailsScreenState extends State<MealsDetailsScreen> {
  int activeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                viewportFraction: 1,
                initialPage: activeImageIndex,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeImageIndex = index;
                  });
                },
              ),
              items: meal.imageURLs.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: image.startsWith("assets")
                          ? Image.asset(
                              image,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              image,
                              fit: BoxFit.cover,
                            ),
                    );
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: meal.imageURLs.map((image) {
                final imageIndex = meal.imageURLs.indexOf(image);
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      color: activeImageIndex == imageIndex
                          ? Colors.black
                          : Colors.grey,
                      shape: BoxShape.circle),
                );
              }).toList(),
            ),
            Text(
              "\$${meal.price}",
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Ta'rifi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(meal.descriptioin),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: Card(
                child: ListView.separated(
                    padding: EdgeInsets.all(11),
                    itemBuilder: ((context, index) {
                      return Text(meal.ingredients[index]);
                    }),
                    separatorBuilder: ((context, index) {
                      return Divider();
                    }),
                    itemCount: meal.ingredients.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
