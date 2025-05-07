import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/logo.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/time_control.dart';

class ControlPanel extends StatelessWidget {
  final double width;

  const ControlPanel({super.key, this.width = 320});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218),
      child: Padding(
        padding: EdgeInsets.all(AppTheme.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Logo(),
            Text(
              'Hitta ett recept som passar\ngenom att ändra inställningarna nedanför',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: AppTheme.paddingMedium),
            Padding(
              padding: EdgeInsets.only(right: AppTheme.paddingSmall),
              child: const IngredientControl(),
            ),
            SizedBox(height: AppTheme.paddingSmall),
            Padding(
              padding: EdgeInsets.only(right: AppTheme.paddingSmall),
              child: const KitchenControl(),
            ),
            SizedBox(height: AppTheme.paddingSmall),
            Row(
              children: [
                Text(
                  'Svårighetsgrad:',
                  style: AppTheme.smallHeading,
                ),
              ],
            ),
            const DifficultyControl(),
            SizedBox(height: AppTheme.paddingSmall),
            Row(
              children: [
                Text(
                  'Max pris:',
                  style: AppTheme.smallHeading,
                ),
              ],
            ),
            const PriceControl(),
            SizedBox(height: AppTheme.paddingSmall),
            Row(
              children: [
                Text(
                  'Max tid:',
                  style: AppTheme.smallHeading,
                ),
              ],
            ),
            const TimeControl(),
          ],
        ),
      ),
    );
  }
}
