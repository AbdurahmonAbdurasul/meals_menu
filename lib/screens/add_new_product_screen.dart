import 'package:flutter/material.dart';
import 'package:meals/widgets/custom_image_input.dart';
import '../models/category.dart';
import '../models/meal.dart';

class AddNewProductScreen extends StatefulWidget {
  List<Category> categories;
  final Function addNewMeal;
  AddNewProductScreen(
      {super.key, required this.categories, required this.addNewMeal});

  static const routeName = "add-new-product";

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  late String categryId;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _priceController = TextEditingController();
  final _preparingTimeController = TextEditingController();
  final _mainImageController = TextEditingController();
  final _firstImageController = TextEditingController();
  final _secondImageController = TextEditingController();
  final _thirdImageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    categryId = widget.categories[0].id;
  }

  void _save() {
    final tit = _titleController.text;
    final desc = _descriptionController.text;
    final ingre = _ingredientsController.text;
    final price = _priceController.text;
    final prep = _preparingTimeController.text;
    final mainImage = _mainImageController.text;
    final firImage = _firstImageController.text;
    final secImage = _secondImageController.text;
    final thirImage = _thirdImageController.text;

    if (tit.isEmpty ||
        desc.isEmpty ||
        ingre.isEmpty ||
        price.isEmpty ||
        prep.isEmpty ||
        mainImage.isEmpty ||
        firImage.isEmpty ||
        secImage.isEmpty ||
        thirImage.isEmpty) {
      return;
    }

    List<String> ingreds = ingre.split(",");
    List<String> imageUrls = [
      mainImage,
      firImage,
      secImage,
      thirImage,
    ];
    widget.addNewMeal(
      Meal(
        id: UniqueKey().toString(),
        title: tit,
        imageURLs: imageUrls,
        descriptioin: desc,
        ingredients: ingreds,
        preparingTime: int.parse(prep),
        price: double.parse(price),
        categoryId: categryId,
      ),
    );

    Navigator.of(context).pop(true);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yangi Ovqat"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _save,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              DropdownButton(
                isExpanded: true,
                value: categryId,
                items: widget.categories
                    .map(
                      (category) => DropdownMenuItem(
                        child: Text(category.title),
                        value: category.id,
                      ),
                    )
                    .toList(),
                onChanged: (id) => setState(
                  () {
                    categryId = id as String;
                  },
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Ovqat nomi",
                ),
                controller: _titleController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Ovqat tarifi",
                ),
                maxLines: 5,
                controller: _descriptionController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Ovqat tarkibi(Go'sht,pamidor,...)",
                ),
                controller: _ingredientsController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Narxi",
                ),
                keyboardType: TextInputType.number,
                controller: _priceController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Tayyorlanish vaqti(minutda)",
                ),
                keyboardType: TextInputType.number,
                controller: _preparingTimeController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomImageInput(
                imageController: _mainImageController,
                label: "Asosiy rasm linkini kiriting",
              ),
              SizedBox(
                height: 10,
              ),
              CustomImageInput(
                imageController: _firstImageController,
                label: "1-rasm linkini kiriting",
              ),
              SizedBox(
                height: 10,
              ),
              CustomImageInput(
                imageController: _secondImageController,
                label: "2-rasm linkini kiriting",
              ),
              SizedBox(
                height: 10,
              ),
              CustomImageInput(
                imageController: _thirdImageController,
                label: "3-rasm linkini kiriting",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
