import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ventfit/presentation/ui/bloc/auth_value_objects.dart';

part 'bmi_state.freezed.dart';

@freezed
class BMIState with _$BMIState {
  const factory BMIState({
    required Height height,
    required Weight weight,
    required double weightDiffrence,
    required double bmiScore,
    required int bmiCategory,
    required double bestWeightLowerBound,
    required double bestWeightUpperBound,
    required bool showErrorMessages,
  }) = _BMIState;

  factory BMIState.initial() => BMIState(
        height: Height(''),
        weight: Weight(''),
        weightDiffrence: 0,
        bmiCategory: 0,
        bmiScore: 0,
        bestWeightLowerBound: 0,
        bestWeightUpperBound: 0,
        showErrorMessages: false,
      );
}
