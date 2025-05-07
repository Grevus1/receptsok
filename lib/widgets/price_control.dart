import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:provider/provider.dart';

class PriceControl extends StatefulWidget {
  const PriceControl({super.key});

  @override
  State<PriceControl> createState() => _PriceControlState();
}

class _PriceControlState extends State<PriceControl> {
  double _price = 0;

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
    
    return Column(
      children: [
        Slider(
          value: _price,
          max: 200,
          divisions: 40,
          onChanged: (value) {
            setState(() {
              _price = value;
            });
            recipeHandler.setMaxPrice(value.toInt());
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: AppTheme.paddingLarge),
              child: Text('${_price.round()} kr'),
            ),
          ],
        ),
      ],
    );
  }
}