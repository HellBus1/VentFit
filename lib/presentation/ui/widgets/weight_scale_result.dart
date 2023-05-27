import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:ventfit/ui/color.dart';

class WeightScaleResult extends StatelessWidget {
  const WeightScaleResult({super.key});

  @override
  Widget build(BuildContext context) {
    var localText = AppLocalizations.of(context);
    var theme = Theme.of(context);

    return Column(
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: localText?.bmiScore,
              style: theme.textTheme.titleMedium,
            ),
            const TextSpan(text: " "),
            TextSpan(
              text: "20",
              style: theme.textTheme.titleMedium,
            )
          ]),
        ),
        const SizedBox(height: 16),
        SfLinearGauge(
          minimum: 16,
          maximum: 40,
          interval: 8,
          axisLabelStyle: theme.textTheme.bodySmall,
          ranges: [
            LinearGaugeRange(
              color: Colors.blue,
              startValue: 16,
              endValue: 24,
              midWidth: 30,
              endWidth: 30,
              startWidth: 30,
              edgeStyle: LinearEdgeStyle.startCurve,
              child: Center(
                child: Text(
                  localText?.underweight ?? "",
                  style: const TextStyle(color: white),
                ),
              ),
            ),
            LinearGaugeRange(
              color: Colors.green,
              startValue: 24,
              endValue: 32,
              midWidth: 30,
              endWidth: 30,
              startWidth: 30,
              child: Center(
                child: Text(
                  localText?.normal ?? "",
                  style: const TextStyle(color: white),
                ),
              ),
            ),
            LinearGaugeRange(
              color: Colors.red,
              startValue: 32,
              endValue: 40,
              midWidth: 30,
              endWidth: 30,
              startWidth: 30,
              edgeStyle: LinearEdgeStyle.endCurve,
              child: Center(
                child: Text(
                  localText?.overweight ?? "",
                  style: const TextStyle(color: white),
                ),
              ),
            ),
          ],
          markerPointers: [
            LinearShapePointer(
              value: 20,
              position: LinearElementPosition.cross,
              shapeType: LinearShapePointerType.triangle,
              color: theme.textTheme.bodyLarge?.color,
              width: 10,
            ),
          ],
        ),
      ],
    );
  }
}
