import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ventfit/presentation/ui/widgets/weight_metric.dart';

class BMIPage extends StatelessWidget {
  const BMIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: WeightMetric(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
