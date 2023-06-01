import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ventfit/presentation/bmi/bloc/auth_value_objects.dart';
import 'package:ventfit/presentation/bmi/bloc/bmi_event.dart';
import 'package:ventfit/presentation/bmi/bloc/bmi_state.dart';

import '../../../commons/extension/double_extension.dart';

class BMIBloc extends Bloc<BMIEvent, BMIState> {
  BMIBloc() : super(BMIState.initial()) {
    on<HeightChangedEvent>(_handleHeightChanged);
    on<WeightChangedEvent>(_handleWeightChanged);
    on<CalculateBMIEvent>(_handleCalculateBMI);
    on<GetBMICategoryEvent>(_handleGetBMICategory);
  }

  _handleHeightChanged(HeightChangedEvent event, Emitter<BMIState> emit) {
    emit(
      state.copyWith(
        height: Height(event.height),
      ),
    );
    add(const CalculateBMIEvent());
  }

  _handleWeightChanged(WeightChangedEvent event, Emitter<BMIState> emit) {
    emit(
      state.copyWith(
        weight: Weight(event.weight),
      ),
    );
    add(const CalculateBMIEvent());
  }

  _handleCalculateBMI(CalculateBMIEvent event, Emitter<BMIState> emit) {
    final isHeightValid = state.height.isValid();
    final isWeightValid = state.weight.isValid();

    if (isHeightValid && isWeightValid) {
      var heightValue = double.parse(state.height.getValue());
      var weightValue = double.parse(state.weight.getValue());

      var result = getBMI(heightValue, weightValue);
      emit(state.copyWith(
        bmiScore: result.toPrecision(2),
        showErrorMessages: false,
      ));
      add(GetBMICategoryEvent(result, heightValue, weightValue));
    } else {
      emit(state.copyWith(showErrorMessages: true));
    }
  }

  _handleGetBMICategory(GetBMICategoryEvent event, Emitter<BMIState> emit) {
    var bmi = event.bmiResult;
    var height = event.height;
    var weight = event.weight;
    var lower = getWeight(18.5, height).toPrecision(2);
    var upper = getWeight(24.9, height).toPrecision(2);
    var weightDifference =
        (weight - (bmi <= 24.9 ? lower : upper)).toPrecision(2);
    var bmiCategory = 0;

    if (bmi <= 15.9) {
      bmiCategory = 1;
    } else if (bmi <= 16.9) {
      bmiCategory = 2;
    } else if (bmi <= 18.4) {
      bmiCategory = 3;
    } else if (bmi <= 24.9) {
      bmiCategory = 4;
      weightDifference = 0;
    } else if (bmi <= 29.9) {
      bmiCategory = 5;
    } else if (bmi <= 34.9) {
      bmiCategory = 6;
    } else if (bmi <= 39.9) {
      bmiCategory = 7;
    } else if (bmi >= 40) {
      bmiCategory = 8;
    }

    emit(state.copyWith(
      bmiCategory: bmiCategory,
      bestWeightLowerBound: bmiCategory != 0 ? lower : 0,
      bestWeightUpperBound: bmiCategory != 0 ? upper : 0,
      weightDiffrence: weightDifference,
    ));
  }

  double getBMI(double height, double weight) {
    return weight / pow((height / 100), 2);
  }

  double getWeight(double bmi, double height) {
    return bmi * pow((height / 100), 2);
  }
}
