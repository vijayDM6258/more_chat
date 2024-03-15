import 'package:get/get.dart';

import '../../models/recipe_model.dart';

class RecipeController extends GetxController {
  var recipes = <Recipe>[
    Recipe(
      name: 'Rooti ',
      description: '25',
    ),
    Recipe(
      name: 'Dal',
      description: '15',
    ),
    Recipe(
      name: 'Bhat',
      description: '20',
    ),
  ].obs;

  void addRecipe(Recipe recipe) {
    recipes.add(recipe);
  }

  void DeletRecipe(Recipe recipe) {
    recipes.remove(recipe);
  }
}
