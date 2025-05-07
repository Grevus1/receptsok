import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/widgets/recipe_list_item.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeHandler = context.watch<RecipeHandler>();
    var uiController = context.watch<UIController>();
    var recipes = recipeHandler.bestMatches;

    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return RecipeListItem(
          recipe,
          onTap: () {
            uiController.selectRecipe(recipe);
          },
        );
      },
    );
  }
} 