import 'package:flutter/material.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/widgets/recipe_detail.dart';
import 'package:lab2/widgets/recipe_list.dart';
import 'package:provider/provider.dart';

class RecipeArea extends StatelessWidget {
  const RecipeArea({super.key});

  @override
  Widget build(BuildContext context) {
    var uiController = context.watch<UIController>();
    Widget contents;

    if (uiController.showRecipeList) {
      contents = const RecipeList();
    } else {
      contents = const RecipeDetail();
    }
    return Expanded(child: contents);
  }
} 