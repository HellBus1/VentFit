import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ventfit/presentation/drawer/bloc/drawer_event.dart';
import 'package:ventfit/presentation/drawer/bloc/drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(const DrawerState.initial()) {
    on<GetAppVersionEvent>(_handleGetAppVersion);
    on<LaunchUrlEvent>(_handleLaunchUrl);
  }

  _handleGetAppVersion(
      GetAppVersionEvent event, Emitter<DrawerState> emit) async {
    try {
      var packageInfo = await PackageInfo.fromPlatform();
      emit(LoadedAppVersionDrawerState(packageInfo));
    } on Exception catch (e) {
      emit(ErrorDrawerState(e.toString()));
    }
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
