class Category {
  String id;
  String title;
  String imageURL;

  Category({required this.id, required this.title, required this.imageURL});
}

class Categories {
  List<Category> _list = [
    Category(
      id: "c1",
      title: "Ichimliklar",
      imageURL: "assets/images/colaa.png",
    ),
    Category(
      id: "c2",
      title: "Milliy Taomlar",
      imageURL: "assets/images/osh.png",
    ),
    Category(
      id: "c3",
      title: "Italiya Taomlari",
      imageURL: "assets/images/pizzaa.png",
    ),
    Category(
      id: "c4",
      title: "Fransiya Taomlari",
      imageURL: "assets/images/cassoulet.png",
    ),
    Category(
      id: "c5",
      title: "Fast Food",
      imageURL: "assets/images/burger.png",
    ),
    Category(
      id: "c6",
      title: "Saladlar",
      imageURL: "assets/images/salad.png",
    ),
  ];
  List<Category> get list {
    return _list;
  }
}
