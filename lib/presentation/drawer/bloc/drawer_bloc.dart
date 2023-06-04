import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ventfit/presentation/drawer/bloc/drawer_event.dart';
import 'package:ventfit/presentation/drawer/bloc/drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(const DrawerState.initial()) {
    on<LaunchUrlEvent>(_handleLaunchUrl);
  }

  _handleLaunchUrl(LaunchUrlEvent event, Emitter<DrawerState> emit) async {
    try {
      await launchUrl(Uri.parse(event.url));
      emit(const LoadedOpenUrlDrawerState());
    } on Exception catch (e) {
      emit(ErrorDrawerState(e.toString()));
    }
  }
}
