import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/cuisine.dart';

class RecipeImageWithFlag extends StatelessWidget {
  final Recipe recipe;
  final double width;
  final double height;
  final double flagWidth;
  final BorderRadius? borderRadius;

  const RecipeImageWithFlag({
    super.key,
    required this.recipe,
    this.width = 104,
    this.height = 104,
    this.flagWidth = 24,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    var image = ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Container(
        width: width,
        height: height,
        child: FittedBox(
          fit: BoxFit.cover,
          child: recipe.image,
        ),
      ),
    );

    var flagImage = Cuisine.flag(recipe.cuisine, width: flagWidth);

    return Stack(
      children: [
        image,
        if (flagImage != null)
          Positioned(bottom: 8, right: 8, child: flagImage),
      ],
    );
  }
}
