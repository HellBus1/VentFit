import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/string_extension.dart';

class WeightMetric extends StatelessWidget {
  const WeightMetric({super.key});

  @override
  Widget build(BuildContext context) {
    var localText = AppLocalizations.of(context);
    var theme = Theme.of(context);

    return Column(
      children: [
        _metricItemWidget(
          localText?.verySevereUnderWeight,
          localText?.verySevereUnderweightScale,
          false,
          theme,
        ),
        const SizedBox(height: 8),
        _metricItemWidget(
          localText?.severeUnderweight,
          localText?.severeUnderweightScale,
          false,
          theme,
        ),
        const SizedBox(height: 8),
        _metricItemWidget(
          localText?.underweight,
          localText?.underweightScale,
          false,
          theme,
        ),
        const SizedBox(height: 8),
        _metricItemWidget(
          localText?.normal,
          localText?.normalScale,
          false,
          theme,
        ),
        const SizedBox(height: 8),
        _metricItemWidget(
          localText?.overweight,
          localText?.overweightScale,
          false,
          theme,
        ),
        const SizedBox(height: 8),
        _metricItemWidget(
          localText?.obese1,
          localText?.obese1Scale,
          false,
          theme,
        ),
        const SizedBox(height: 8),
        _metricItemWidget(
          localText?.obese2,
          localText?.obese2Scale,
          false,
          theme,
        ),
        const SizedBox(height: 8),
        _metricItemWidget(
          localText?.obese3,
          localText?.obese3Scale,
          false,
          theme,
        ),
      ],
    );
  }

  _metricItemWidget(
      String? type, String? scale, bool isSelected, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text((type ?? "").toTitleCase(), style: theme.textTheme.bodyLarge),
        Text((scale ?? "").toTitleCase(), style: theme.textTheme.bodyLarge),
      ],
    );
  }
}
