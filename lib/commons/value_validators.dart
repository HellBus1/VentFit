import 'package:dartz/dartz.dart';

import 'failures.dart';

Either<ValueFailure<String>, String> validateInputLength(String input) {
  if (input.isNotEmpty && input.length <= 3) {
    return right(input);
  } else {
    return left(ValueFailure.exceedingLength(failedValue: input, max: 3));
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}
