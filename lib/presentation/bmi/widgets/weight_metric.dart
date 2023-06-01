import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ventfit/presentation/bmi/bloc/bmi_bloc.dart';
import 'package:ventfit/presentation/bmi/bloc/bmi_state.dart';
import '../../../commons/extension/string_extension.dart';

class WeightMetric extends StatelessWidget {
  const WeightMetric({super.key});

  @override
  Widget build(BuildContext context) {
    var localText = AppLocalizations.of(context);
    var theme = Theme.of(context);

    return BlocConsumer<BMIBloc, BMIState>(
      listener: (context, state) {},
      builder: (context, state) {
        var severity = _getCategoryText(state.bmiCategory, localText);
        var color = _getColor(state.bmiScore);
        var bmiCategory = state.bmiCategory;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (severity != null && color != null)
              _severityWidget(
                severity,
                color,
                state.weightDiffrence,
                theme,
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _metricItemWidget(
                  localText?.verySevereUnderWeight,
                  localText?.verySevereUnderweightScale,
                  bmiCategory == 1,
                  theme,
                  color,
                ),
                const SizedBox(height: 8),
                _metricItemWidget(
                  localText?.severeUnderweight,
                  localText?.severeUnderweightScale,
                  bmiCategory == 2,
                  theme,
                  color,
                ),
                const SizedBox(height: 8),
                _metricItemWidget(
                  localText?.underweight,
                  localText?.underweightScale,
                  bmiCategory == 3,
                  theme,
                  color,
                ),
                const SizedBox(height: 8),
                _metricItemWidget(
                  localText?.normal,
                  localText?.normalScale,
                  bmiCategory == 4,
                  theme,
                  color,
                ),
                const SizedBox(height: 8),
                _metricItemWidget(
                  localText?.overweight,
                  localText?.overweightScale,
                  bmiCategory == 5,
                  theme,
                  color,
                ),
                const SizedBox(height: 8),
                _metricItemWidget(
                  localText?.obese1,
                  localText?.obese1Scale,
                  bmiCategory == 6,
                  theme,
                  color,
                ),
                const SizedBox(height: 8),
                _metricItemWidget(
                  localText?.obese2,
                  localText?.obese2Scale,
                  bmiCategory == 8,
                  theme,
                  color,
                ),
                const SizedBox(height: 8),
                _metricItemWidget(
                  localText?.obese3,
                  localText?.obese3Scale,
                  bmiCategory == 9,
                  theme,
                  color,
                ),
              ],
            ),
            _normalWeightWidget(
              localText?.normalWeight ?? "",
              state.bestWeightLowerBound,
              state.bestWeightUpperBound,
              theme,
            )
          ],
        );
      },
    );
  }

  _metricItemWidget(
    String? type,
    String? scale,
    bool isSelected,
    ThemeData theme,
    Color? color,
  ) {
    var textStyle = theme.textTheme.bodyLarge;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text((type ?? "").toTitleCase(),
            style:
                (isSelected) ? textStyle?.copyWith(color: color) : textStyle),
        Text((scale ?? "").toTitleCase(),
            style:
                (isSelected) ? textStyle?.copyWith(color: color) : textStyle),
      ],
    );
  }

  _severityWidget(
    String severity,
    Color color,
    double weightDifference,
    ThemeData theme,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Text(
              severity.toCapitalized(),
              style: theme.textTheme.bodyLarge?.copyWith(color: color),
            )),
            (weightDifference != 0)
                ? Text(
                    "${(weightDifference > 0) ? '+' : ''}$weightDifference",
                    style: theme.textTheme.bodyLarge?.copyWith(color: color),
                  )
                : Icon(Icons.check, color: color, size: 20),
          ],
        ),
        const SizedBox(height: 4),
        Divider(
          thickness: 1,
          color: theme.textTheme.bodyMedium?.color ?? Colors.black,
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  _normalWeightWidget(
    String normalWeight,
    double lower,
    double upper,
    ThemeData theme,
  ) {
    var range = (lower == upper) ? "$lower" : "$lower - $upper";

    if (!(range == "0.0")) {
      return Column(
        children: [
          const SizedBox(height: 8),
          Divider(
            thickness: 1,
            color: theme.textTheme.bodyMedium?.color ?? Colors.black,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                  normalWeight.toCapitalized(),
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              Text(
                range.toCapitalized(),
                style: theme.textTheme.bodyLarge,
              )
            ],
          )
        ],
      );
    }

    return const SizedBox();
  }

  String? _getCategoryText(int category, AppLocalizations? localText) {
    var categoryTextMap = {
      1: localText?.verySevereUnderWeight,
      2: localText?.severeUnderweight,
      3: localText?.underweight,
      4: localText?.normal,
      5: localText?.overweight,
      6: localText?.obese1,
      7: localText?.obese2,
      8: localText?.obese3,
    };

    return categoryTextMap[category];
  }

  Color? _getColor(double bmi) {
    if (bmi <= 18.4) {
      return Colors.blue;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return Colors.green;
    } else if (bmi >= 25) {
      return Colors.red;
    }
    return null;
  }
}
