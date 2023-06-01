import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ventfit/dependency_injection.dart';
import 'package:ventfit/presentation/drawer/bloc/drawer_event.dart';
import 'package:ventfit/presentation/drawer/bloc/drawer_state.dart';

import 'bloc/drawer_bloc.dart';

class BaseDrawer extends StatefulWidget {
  const BaseDrawer({super.key});

  @override
  State<StatefulWidget> createState() => _BaseDrawerState();
}

class _BaseDrawerState extends State<BaseDrawer> {
  var bloc = getIt<DrawerBloc>();

  @override
  void initState() {
    bloc.add(const GetAppVersionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var localText = AppLocalizations.of(context);
    var theme = Theme.of(context);

    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<DrawerBloc, DrawerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Drawer(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.star,
                    color: theme.iconTheme.color,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: theme.iconTheme.color,
                  ),
                  minLeadingWidth: 0,
                  dense: true,
                  title: Text(localText?.rateApp ?? ""),
                  subtitle: Text(localText?.rateAppDescription ?? ""),
                  onTap: () {
                    bloc.add(const LaunchUrlEvent(
                        "https://play.google.com/store/apps/details?id=com.digiventure.ventfit"));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.apps,
                    color: theme.iconTheme.color,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: theme.iconTheme.color,
                  ),
                  minLeadingWidth: 0,
                  dense: true,
                  title: Text(localText?.moreApps ?? ""),
                  subtitle: Text(localText?.moreAppsDescription ?? ""),
                  onTap: () {
                    bloc.add(const LaunchUrlEvent(
                        "https://play.google.com/store/apps/developer?id=DigiVenture"));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.history,
                    color: theme.iconTheme.color,
                  ),
                  minLeadingWidth: 0,
                  dense: true,
                  title: Text(localText?.appVersion ?? ""),
                  subtitle: (state is LoadedAppVersionDrawerState)
                      ? Text(
                          "${localText?.appVersion} ${state.packageInfo.version}")
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
