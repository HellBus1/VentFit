import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawer_state.freezed.dart';

@freezed
class DrawerState with _$DrawerState {
  const factory DrawerState.initial() = InitialDrawerState;

  const factory DrawerState.loadedOpenUrl() = LoadedOpenUrlDrawerState;

  const factory DrawerState.error(String message) = ErrorDrawerState;
}
