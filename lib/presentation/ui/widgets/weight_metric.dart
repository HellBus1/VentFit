import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ventfit/presentation/ui/bloc/bmi_bloc.dart';
import 'package:ventfit/presentation/ui/bloc/bmi_state.dart';
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
                  false,
                  theme,
                  color,
                ),
                const SizedBox(height: 8),
                _metricItemWidget(
                  localText?.severeUnderweight,
                  localText?.severeUnderweightScale,
                  false,
                  theme,
                  color,
                ),
                const SizedBox(height: 8),
                _metricItemWidget(
                  localText?.underweight,
                  localText?.underweightScale,
                  false,
                  theme,
                  color,
                ),
                const SizedBox(height: 8),
                _metricItemWidget(
                  localText?.normal,
                  localText?.normalScale,
                  false,
                  theme,
                  color,
                ),
                const SizedBox(height: 8),
                _metricItemWidget(
                  localText?.overweight,
                  localText?.overweightScale,
                  false,
                  theme,
                  color,
                ),
                const SizedBox(height: 8),
                _metricItemWidget(
                  localText?.obese1,
                  localText?.obese1Scale,
                  false,
                  theme,
                  color,
                ),
                const SizedBox(height: 8),
                _metricItemWidget(
                  localText?.obese2,
                  localText?.obese2Scale,
                  false,
                  theme,
                  color,
                ),
                const SizedBox(height: 8),
                _metricItemWidget(
                  localText?.obese3,
                  localText?.obese3Scale,
                  false,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text((type ?? "").toTitleCase(), style: theme.textTheme.bodyLarge),
        Text((scale ?? "").toTitleCase(), style: theme.textTheme.bodyLarge),
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
        const Divider(thickness: 2),
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

    return Column(
      children: [
        const SizedBox(height: 8),
        const Divider(thickness: 2),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: Text(
                normalWeight.toCapitalized(),
                style: theme.textTheme.bodyLarge?.copyWith(color: Colors.green),
              ),
            ),
            Text(
              range.toCapitalized(),
              style: theme.textTheme.bodyLarge?.copyWith(color: Colors.green),
            )
          ],
        )
      ],
    );
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
