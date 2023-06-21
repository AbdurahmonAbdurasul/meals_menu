import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favourites_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Category> categories;
  final Meals mealModel;
  final Function toggleLike;
  final Function isFavourite;
  const TabsScreen({
    super.key,
    required this.categories,
    required this.mealModel,
    required this.toggleLike,
    required this.isFavourite,
  });

  static const routeName = "/";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int tabIndex = 0;
  List<Map<String, dynamic>> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        "page": CategoriesScreen(
            categories: widget.categories, meals: widget.mealModel.list),
        "title": "Ovqatlar Menyusi",
      },
      {
        "page": FavouritesScreen(
          favourites: widget.mealModel.favourites,
          toggleLike: widget.toggleLike,
          isFavourite: widget.isFavourite,
        ),
        "title": "Sevimli ovqatlar",
      },
    ];
  }

  void _changeTab(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //   return DefaultTabController(
    //     length: 2,
    //     initialIndex: 0,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         centerTitle: true,
    //         title: Text("Ovqatlar Menyusi"),
    //         bottom: TabBar(
    //           tabs: [
    //             Tab(
    //               text: "Barchasi",
    //               icon: Icon(Icons.more_horiz),
    //             ),
    //             Tab(
    //               text: "Sevimli",
    //               icon: Icon(Icons.favorite),
    //             ),
    //           ],
    //         ),
    //       ),
    //       body: TabBarView(children: [
    //         CategoriesScreen(categories: categories, meals: meals),
    //         FavouritesScreen(),
    //       ]),
    //     ),
    //   );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[tabIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pages[tabIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: _changeTab,
        currentIndex: tabIndex,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.more_horiz),
            label: "Barchasi",
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite),
            label: "Sevimli",
          )
        ],
      ),
    );
  }
}
