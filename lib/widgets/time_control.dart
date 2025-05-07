import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/constants/assets.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:provider/provider.dart';

class TimeControl extends StatefulWidget {
  const TimeControl({super.key});

  @override
  State<TimeControl> createState() => _TimeControlState();
}

class _TimeControlState extends State<TimeControl> {
  double _time = 0;

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
    
    return Column(
      children: [
        Slider(
          value: _time,
          max: 150,
          divisions: 15, // 15 divisions for 10-minute intervals (0, 10, 20, ..., 150)
          onChanged: (value) {
            setState(() {
              _time = value;
            });
            recipeHandler.setMaxTime(value.toInt());
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(Assets.timeIcon, height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppTheme.paddingSmall),
              child: Text('${_time.round()} min'),
            ),
            SizedBox(width: AppTheme.paddingLarge),
          ],
        ),
      ],
    );
  }
} 