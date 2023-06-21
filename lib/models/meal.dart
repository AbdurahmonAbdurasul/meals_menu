class Meal {
  final String id;
  final String title;
  final List<String> imageURLs;
  final String descriptioin;
  final List<String> ingredients;
  final int preparingTime;
  final double price;
  final String categoryId;

  Meal({
    required this.id,
    required this.title,
    required this.imageURLs,
    required this.descriptioin,
    required this.ingredients,
    required this.preparingTime,
    required this.price,
    required this.categoryId,
  });
}

class Meals {
  List<Meal> _list = [
    Meal(
      id: "m1",
      title: "Lavash",
      imageURLs: [
        "assets/images/lavash.png",
        "assets/images/lavash1.png",
        "assets/images/lavash2.png",
        "assets/images/lavash3.png",
      ],
      descriptioin: "Ajoyib lavash",
      ingredients: ["go'sht", "pamidor", "bodring"],
      preparingTime: 15,
      price: 10,
      categoryId: "c5",
    ),
    Meal(
      id: "m2",
      title: "Burger",
      imageURLs: [
        "assets/images/burger.png",
        "assets/images/burger1.png",
        "assets/images/burger2.png",
        "assets/images/burger3.png",
      ],
      descriptioin: "Ajoyib burger",
      ingredients: ["go'sht", "pamidor", "bodring"],
      preparingTime: 11,
      price: 9,
      categoryId: "c5",
    ),
    Meal(
      id: "m3",
      title: "Osh",
      imageURLs: [
        "assets/images/osh.png",
        "assets/images/osh1.png",
        "assets/images/osh2.png",
        "assets/images/osh3.png",
      ],
      descriptioin: "Ajoyib osh",
      ingredients: ["go'sht", "pamidor", "bodring"],
      preparingTime: 10,
      price: 13,
      categoryId: "c2",
    ),
    Meal(
      id: "m4",
      title: "Cassoulet",
      imageURLs: [
        "assets/images/cassoulet.png",
        "assets/images/cassoulet1.png",
        "assets/images/cassoulet2.png",
        "assets/images/cassoulet3.png",
      ],
      descriptioin: "Ajoyib fransiya ovqati",
      ingredients: ["go'sht", "pamidor", "bodring"],
      preparingTime: 10,
      price: 15,
      categoryId: "c4",
    ),
    Meal(
      id: "m5",
      title: "Coca-Cola",
      imageURLs: [
        "assets/images/colaa.png",
        "assets/images/cola1.png",
        "assets/images/cola2.png",
        "assets/images/cola3.png",
      ],
      descriptioin: "Ajoyib coca-cola",
      ingredients: ["Suv", "shakar"],
      preparingTime: 1,
      price: 3,
      categoryId: "c1",
    ),
    Meal(
      id: "m6",
      title: "Flamiche",
      imageURLs: [
        "assets/images/flamiche.png",
        "assets/images/flamiche1.png",
        "assets/images/flamiche2.png",
        "assets/images/flamiche3.png",
      ],
      descriptioin: "Ajoyib flamiche ovqati",
      ingredients: ["go'sht", "pamidor", "bodring"],
      preparingTime: 10,
      price: 17,
      categoryId: "c4",
    ),
    Meal(
      id: "m7",
      title: "Pepsi",
      imageURLs: [
        "assets/images/pepsi.png",
        "assets/images/pepsi1.png",
        "assets/images/pepsi2.png",
        "assets/images/pepsi3.png",
      ],
      descriptioin: "Ajoyib pepsi",
      ingredients: ["Suv", "shakar"],
      preparingTime: 1,
      price: 2,
      categoryId: "c1",
    ),
    Meal(
      id: "m8",
      title: "Pitsa",
      imageURLs: [
        "assets/images/pizzaa.png",
        "assets/images/pizzaa1.png",
        "assets/images/pizzaa2.png",
        "assets/images/pizzaa3.png",
      ],
      descriptioin: "Ajoyib pitsa",
      ingredients: ["go'sht", "pamidor", "bodring"],
      preparingTime: 7,
      price: 11,
      categoryId: "c3",
    ),
    Meal(
      id: "m9",
      title: "Cesar",
      imageURLs: [
        "assets/images/salad.png",
        "assets/images/salad1.png",
        "assets/images/salad2.png",
        "assets/images/salad3.png",
      ],
      descriptioin: "Ajoyib Cesar salad",
      ingredients: ["go'sht", "pamidor", "bodring"],
      preparingTime: 11,
      price: 5,
      categoryId: "c6",
    ),
    Meal(
      id: "m10",
      title: "Somsa",
      imageURLs: [
        "assets/images/somsa.jpg",
        "assets/images/somsa1.jpg",
        "assets/images/somsa2.jpg",
        "assets/images/somsa3.jpg",
      ],
      descriptioin: "Ajoyib somsa",
      ingredients: ["go'sht", "pamidor", "bodring"],
      preparingTime: 4,
      price: 3,
      categoryId: "c2",
    ),
    Meal(
      id: "m11",
      title: "Tarte-tatin",
      imageURLs: [
        "assets/images/tarte-tatin.png",
        "assets/images/tarte-tatin1.png",
        "assets/images/tarte-tatin2.png",
        "assets/images/tarte-tatin3.png",
      ],
      descriptioin: "Ajoyib tarte-tatin ovqati",
      ingredients: ["go'sht", "pamidor", "bodring"],
      preparingTime: 11,
      price: 13,
      categoryId: "c3",
    ),
  ];

  List<Meal> _favourites = [];

  List<Meal> get list {
    return _list;
  }

  List<Meal> get favourites {
    return _favourites;
  }

  void toggleLike(String mealId) {
    final mealIndex = favourites.indexWhere((meal) => meal.id == mealId);
    if (mealIndex < 0) {
      _favourites.add(list.firstWhere((meal) => meal.id == mealId));
    } else {
      _favourites.removeWhere((meal) => meal.id == mealId);
    }
  }

  void addNewMeal(Meal meal) {
    _list.add(meal);
  }

  void deleteMeal(String id) {
    _list.removeWhere((meal) => meal.id == id);
  }
}
