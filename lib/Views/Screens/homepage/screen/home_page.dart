import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:more_chat/Views/Screens/recipe_page/like_page.dart';
import '../../../../controllers/homepage_controllers/recipe_controller.dart';
import '../../../../models/recipe_model.dart';

class HomePage extends StatelessWidget {
  get Ats => TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
      letterSpacing: 4);

  @override
  Widget build(BuildContext context) {
    Get.put(RecipeController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffEEE0C3),
        title: Text('Gujju Dhaba', style: Ats),
      ),
      body: GetX<RecipeController>(
        init: RecipeController(),
        builder: (controller) {
          return Container(
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage("assets/images/bckg.jpg"),
              ),
            ),
            child: ListView.builder(
              itemCount: controller.recipes.length,
              itemBuilder: (context, index) {
                var recipe = controller.recipes[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage("assets/images/menu.jpeg"),
                    ),
                  ),
                  child: ListTile(
                    leading: Image.asset(recipe.image),
                    title: Text(recipe.name),
                    subtitle: Text(recipe.description),
                    onTap: () {
                      Get.to(recipeLikedPage());
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddRecipeDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddRecipeDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Recipe'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Quanity '),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.find<RecipeController>().addRecipe(
                  Recipe(
                    name: nameController.text,
                    description: descriptionController.text,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
