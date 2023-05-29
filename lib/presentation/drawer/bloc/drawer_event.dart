import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawer_event.freezed.dart';

@freezed
class DrawerEvent with _$DrawerEvent {
  const factory DrawerEvent.getAppVersion() = GetAppVersionEvent;
  const factory DrawerEvent.launchUrl(String url) = LaunchUrlEvent;
}
