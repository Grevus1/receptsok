import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/constants/assets.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:lab2/widgets/recipe_image_with_flag.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var uiController = context.watch<UIController>();
    var recipe = uiController.selectedRecipe;

    if (recipe == null) {
      return const Center(child: Text('Inget recept valt'));
    }

    return Padding(
      padding: EdgeInsets.all(AppTheme.paddingMedium),
      child: SingleChildScrollView(
        child: Card(
          elevation: AppTheme.cardElevation,
          shape: AppTheme.cardShape,
          child: Padding(
            padding: EdgeInsets.all(AppTheme.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with close button
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        recipe.name,
                        style: AppTheme.largeHeading,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        uiController.deselectRecipe();
                      },
                    ),
                  ],
                ),
                
                SizedBox(height: AppTheme.paddingMedium),
                
                // Main content: image and right column
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recipe image with flag
                    RecipeImageWithFlag(
                      recipe: recipe,
                      width: 240, 
                      height: 240,
                      flagWidth: 60,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    
                    SizedBox(width: AppTheme.paddingMedium),
                    
                    // Right column with info and ingredients
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Description
                          Text(
                            recipe.description,
                            style: const TextStyle(fontSize: 16),
                          ),
                          
                          SizedBox(height: AppTheme.paddingMedium),
                          
                          // Info row
                          Row(
                            children: [
                              // Ingredient icon
                              MainIngredient.icon(recipe.mainIngredient, width: 24) ?? Container(),
                              
                              SizedBox(width: AppTheme.paddingMedium),
                              
                              // Difficulty icon
                              Difficulty.icon(recipe.difficulty, width: 48) ?? Container(),
                              
                              SizedBox(width: AppTheme.paddingMedium),
                              
                              // Time information
                              Image.asset(Assets.timeIcon, height: 16),
                              SizedBox(width: AppTheme.paddingTiny),
                              Text('${recipe.time} min'),
                              
                              SizedBox(width: AppTheme.paddingMedium),
                              
                              // Price information
                              Text('${recipe.price} kr'),
                              
                              SizedBox(width: AppTheme.paddingMedium),
                              
                              // Servings information
                              Text('${recipe.servings} portioner'),
                            ],
                          ),
                          
                          SizedBox(height: AppTheme.paddingMedium),
                          
                          // Ingredients section
                          Text('Ingredienser', style: AppTheme.smallHeading),
                          SizedBox(height: AppTheme.paddingSmall),
                          _buildIngredientsList(recipe),
                          
                          SizedBox(height: AppTheme.paddingMedium),
                        ],
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: AppTheme.paddingMedium),
                
                // Instructions section
                Text('Tillagning', style: AppTheme.smallHeading),
                SizedBox(height: AppTheme.paddingSmall),
                Text(
                  recipe.instruction,
                  style: const TextStyle(height: 1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIngredientsList(Recipe recipe) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final ingredient in recipe.ingredients)
          Padding(
            padding: EdgeInsets.only(bottom: AppTheme.paddingTiny),
            child: Text(ingredient.toString()),
          ),
      ],
    );
  }
}