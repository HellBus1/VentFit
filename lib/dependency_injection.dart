import 'package:get_it/get_it.dart';
import 'package:ventfit/presentation/bmi/bloc/bmi_bloc.dart';
import 'package:ventfit/presentation/drawer/bloc/drawer_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerFactory(() => BMIBloc());
  getIt.registerFactory(() => DrawerBloc());
}
