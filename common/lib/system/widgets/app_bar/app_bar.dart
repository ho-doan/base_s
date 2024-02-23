import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../generator/assets.gen.dart';
import '../../../utils/utils.dart';

class ActionAppBar {
  ActionAppBar({
    required this.icon,
    required this.title,
    required this.action,
    this.children,
    this.isDraw = false,
    this.path,
  });

  final Widget icon;
  final String title;
  final String? path;
  final VoidCallback action;
  final List<ActionAppBar>? children;
  final bool isDraw;
}

extension ActionAppBarList on List<ActionAppBar>? {
  List<ActionAppBar> get draw {
    return (this ?? <ActionAppBar>[]).where((e) => e.isDraw).toList();
  }

  List<ActionAppBar> get withoutDraw {
    return (this ?? <ActionAppBar>[]).where((e) => !e.isDraw).toList();
  }
}

class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    this.title,
    this.children,
    this.currentLocation,
    this.toolbarHeight = 132,
  });

  final String? title;
  final List<ActionAppBar>? children;
  final String? currentLocation;
  final double toolbarHeight;

  @override
  State<BaseAppBar> createState() => _BaseAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        if (constraints.maxWidth > 600) {
          return Row(
            children: [
              if (constraints.maxWidth > 600)
                Assets.images.logo.image(
                  height: 101,
                  fit: BoxFit.fitHeight,
                ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (final item in widget.children.withoutDraw)
                      InkWell(
                        onTap: () {
                          if (item.path == widget.currentLocation) return;
                          item.action.call();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: item.path != null &&
                                      widget.currentLocation == item.path
                                  ? BorderSide(
                                      color: context.theme.colors.borderColor,
                                    )
                                  : BorderSide.none,
                            ),
                          ),
                          child: item.children != null &&
                                  item.children!.isNotEmpty
                              ? FocusScope(
                                  canRequestFocus: false,
                                  child: DropdownButton2<ActionAppBar>(
                                    items: [
                                      for (final subItem in item.children!)
                                        DropdownMenuItem(
                                          alignment: Alignment.center,
                                          value: subItem,
                                          child: Text(
                                            subItem.title,
                                            style: context.theme.styles.l1,
                                          ),
                                        ),
                                    ],
                                    alignment: Alignment.center,
                                    hint: Text(
                                      item.title,
                                      style: context.theme.styles.l1.copyWith(
                                        color: context
                                            .theme.textTheme.bodyLarge?.color,
                                      ),
                                    ),
                                    underline: const SizedBox.shrink(),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_drop_down_sharp,
                                        size: 16,
                                      ),
                                    ),
                                    onChanged: (_) {
                                      _?.action.call();
                                    },
                                  ),
                                )
                              : Text(
                                  item.title,
                                  style: context.theme.styles.l1,
                                ),
                        ),
                      ),
                    for (final item in widget.children.draw)
                      IconButton(
                        onPressed: () {
                          if (item.path == widget.currentLocation) return;
                          item.action.call();
                        },
                        icon: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 10,
                          ),
                          child: item.icon,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return AppBar(
            title: widget.title != null ? Text(widget.title!) : null,
            actions: [
              for (final item in widget.children.draw)
                IconButton(
                  onPressed: () {
                    if (item.path == widget.currentLocation) return;
                    item.action.call();
                  },
                  icon: item.icon,
                ),
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(Icons.list),
              ),
            ],
          );
        }
      },
    );
  }
}
