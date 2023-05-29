import 'package:get_it/get_it.dart';
import 'package:ventfit/presentation/ui/bloc/bmi_bloc.dart';

final getIt = GetIt.instance;

initializeDependencies() {
  getIt.registerFactory(() => BMIBloc());
}
