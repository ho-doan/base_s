import 'package:flutter/material.dart';

import '../../../utils/extensions/list_ext.dart';
import '../app_bar/app_bar.dart';

class _$BaseScaffold extends Scaffold {
  const _$BaseScaffold({
    super.appBar,
    super.body,
    super.floatingActionButton,
    this.actions = const [],
    this.drawers = const [],
    this.currentLocation,
    this.title,
    this.toolbarHeight = 132,
  });

  final String? title;
  final String? currentLocation;
  final List<ActionAppBar> actions;
  final List<ActionAppBar> drawers;
  final double toolbarHeight;

  @override
  Widget? get endDrawer => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // const DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            //   child: Text('Drawer Header'),
            // ),
            for (final item in actions.withoutDraw) ...[
              ListTile(
                title: Text(item.title),
                leading: item.icon,
                onTap: item.children.isNullOrEmpty ? item.action : null,
              ),
              for (final subItem in item.children.lst)
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 25),
                  title: Text(subItem.title),
                  leading: subItem.icon,
                  onTap: subItem.action,
                ),
              const Divider(),
            ],
            for (final item in drawers) ...[
              ListTile(
                title: Text(item.title),
                leading: item.icon,
                onTap: item.children.isNullOrEmpty ? item.action : null,
              ),
              for (final subItem in item.children.lst)
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 25),
                  title: Text(subItem.title),
                  leading: subItem.icon,
                  onTap: subItem.action,
                ),
              const Divider(),
            ],
          ],
        ),
      );
  @override
  PreferredSizeWidget? get appBar => BaseAppBar(
        title: title,
        currentLocation: currentLocation,
        children: actions,
        toolbarHeight: toolbarHeight,
      );
}

class ScaffoldBase extends StatelessWidget {
  const ScaffoldBase({
    this.actions = const [],
    super.key,
    this.title,
    this.currentLocation,
    this.drawers = const [],
    this.appBar,
    this.body,
    this.floatingActionButton,
  });

  final String? title;
  final String? currentLocation;
  final List<ActionAppBar> actions;
  final List<ActionAppBar> drawers;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return _$BaseScaffold(
          toolbarHeight: constraints.maxWidth > 600 ? 132 : kToolbarHeight,
          actions: actions,
          appBar: appBar,
          body: body,
          currentLocation: currentLocation,
          floatingActionButton: floatingActionButton,
          title: title,
          drawers: drawers,
        );
      },
    );
  }
}
