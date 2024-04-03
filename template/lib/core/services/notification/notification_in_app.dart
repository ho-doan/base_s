import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../firebase/notifications/firebase_core_app.dart';

class NotificationArgs {
  const NotificationArgs({
    this.notificationModel,
    this.category,
    required this.title,
    required this.content,
  });

  final NotificationModel? notificationModel;
  final NotificationCategory? category;
  final String title;
  final String content;
}

class NotificationInApp {
  NotificationInApp._();

  static late OverlayEntry? _overlayEntry;

  static Future<void> showNotification({
    required NotificationArgs notificationArgs,
    required BuildContext context,
  }) async {
    _overlayEntry = _getOverLay(
      context: context,
      notificationArgs: notificationArgs,
    );
    Overlay.of(context).insert(_overlayEntry!);
    await Future.delayed(const Duration(seconds: 5), () {
      try {
        _overlayEntry?.remove();
      } catch (e) {}
    });
  }

  static OverlayEntry _getOverLay({
    required BuildContext context,
    required NotificationArgs notificationArgs,
  }) {
    switch (notificationArgs.category) {
      case NotificationCategory.home:
        return OverlayEntry(
          builder: (context) => NotificationInAppWidget(
            notificationArgs: notificationArgs,
          ),
        );
      default:
        return OverlayEntry(
          builder: (context) => NotificationInAppWidget(
            notificationArgs: notificationArgs,
          ),
        );
    }
  }

  static void onRemoveNotification() => _overlayEntry?.remove();
}

class NotificationInAppWidget extends StatefulWidget {
  const NotificationInAppWidget(
      {super.key, required this.notificationArgs, this.buildBody});
  final NotificationArgs notificationArgs;
  final Widget Function(BuildContext context)? buildBody;

  @override
  State<StatefulWidget> createState() => NotificationInAppWidgetState();
}

class NotificationInAppWidgetState extends State<NotificationInAppWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> position;
  NotificationArgs get _notificationArgs => widget.notificationArgs;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350));
    position = Tween<Offset>(begin: const Offset(0.0, -4.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    controller.forward();
  }

  bool _showDismissible = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: _showDismissible
                ? Dismissible(
                    direction: DismissDirection.vertical,
                    key: UniqueKey(),
                    movementDuration: const Duration(seconds: 1),
                    onDismissed: (direction) {
                      setState(() => _showDismissible = false);
                    },
                    child: SlideTransition(
                      position: position,
                      child: Column(
                        children: [
                          _buildContent(),
                          InkWell(
                            onTap: () {
                              // TODO(hodoan): click
                              NotificationInApp.onRemoveNotification();
                            },
                            child: _buildContainerBoxWidget(
                              child: Text('Action'.hardcode),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }

  Widget _buildContainerBoxWidget({required Widget child}) {
    return Builder(builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: ShapeDecoration(
          color: context.theme.colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: child,
      );
    });
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 10),
      child: Text(_notificationArgs.content),
    );
  }
}
