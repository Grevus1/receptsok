import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/constants/assets.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:lab2/widgets/recipe_image_with_flag.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppTheme.cardElevation,
      shape: AppTheme.cardShape,
      margin: EdgeInsets.symmetric(
        vertical: AppTheme.paddingSmall,
        horizontal: AppTheme.paddingMedium,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: Container(
          height: 128,
          child: Row(
            children: [
              RecipeImageWithFlag(
                recipe: recipe,
                width: 104,
                height: 104,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppTheme.paddingMedium,
                        top: AppTheme.paddingSmall,
                        right: AppTheme.paddingMedium,
                      ),
                      child: Text(
                        recipe.name,
                        style: AppTheme.mediumHeading,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppTheme.paddingMedium,
                        vertical: AppTheme.paddingTiny,
                      ),
                      child: Text(
                        recipe.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppTheme.paddingMedium,
                        bottom: AppTheme.paddingSmall,
                        right: AppTheme.paddingMedium,
                      ),
                      child: Row(
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
                        ],
                      ),
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