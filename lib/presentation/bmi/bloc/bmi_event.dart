import 'package:freezed_annotation/freezed_annotation.dart';

part 'bmi_event.freezed.dart';

@freezed
class BMIEvent with _$BMIEvent {
  const factory BMIEvent.heightChanged(String height) = HeightChangedEvent;
  const factory BMIEvent.weightChanged(String weight) = WeightChangedEvent;
  const factory BMIEvent.calculateBMI() = CalculateBMIEvent;
  const factory BMIEvent.getBMICategory(
    double bmiResult,
    double height,
    double weight,
  ) = GetBMICategoryEvent;
}
