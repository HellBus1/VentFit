import 'package:dartz/dartz.dart';
import 'package:ventfit/commons/failures.dart';
import 'package:ventfit/commons/value_objects.dart';
import 'package:ventfit/commons/value_validators.dart';

class Height extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Height(String input) {
    return Height._(
      validateInputLength(input),
    );
  }

  const Height._(this.value);
}

class Weight extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Weight(String input) {
    return Weight._(
      validateInputLength(input),
    );
  }

  const Weight._(this.value);
}
