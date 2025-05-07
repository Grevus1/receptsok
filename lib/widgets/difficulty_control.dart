import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:provider/provider.dart';

class DifficultyControl extends StatefulWidget {
  const DifficultyControl({super.key});

  @override
  State<DifficultyControl> createState() => _DifficultyControlState();
}

class _DifficultyControlState extends State<DifficultyControl> {
  String _difficulty = Difficulty.labels[0];

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
    
    return Column(
      children: [
        // Special case for the first item with no icon
        RadioListTile<String>(
          dense: true,
          title: Text(Difficulty.labels[0]),
          value: Difficulty.labels[0],
          groupValue: _difficulty,
          onChanged: (value) {
            setState(() {
              _difficulty = value!;
            });
            recipeHandler.setDifficulty(value);
          },
        ),
        // Items with icons
        for (int i = 1; i < Difficulty.labels.length; i++)
          RadioListTile<String>(
            dense: true,
            title: Row(
              children: [
                Difficulty.icons[i]!,
                SizedBox(width: AppTheme.paddingMedium),
                Text(Difficulty.labels[i]),
              ],
            ),
            value: Difficulty.labels[i],
            groupValue: _difficulty,
            onChanged: (value) {
              setState(() {
                _difficulty = value!;
              });
              recipeHandler.setDifficulty(value);
            },
          ),
      ],
    );
  }
}