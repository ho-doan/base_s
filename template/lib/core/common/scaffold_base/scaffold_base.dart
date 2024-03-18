part of '../common.dart';

final _drawers = [
  ActionAppBar(
    icon: const Icon(Icons.collections),
    title: 'Template'.hardcode,
    action: () {},
    children: [
      ActionAppBar(
        icon: const Icon(Icons.search),
        title: 'About US'.hardcode,
        action: () {},
      ),
      ActionAppBar(
        icon: const Icon(Icons.search),
        title: 'Contact US'.hardcode,
        action: () {},
      ),
      ActionAppBar(
        icon: const Icon(Icons.search),
        title: 'Order Instruction'.hardcode,
        action: () {},
      ),
    ],
  ),
  ActionAppBar(
    icon: const Icon(Icons.collections),
    title: 'Term of use'.hardcode,
    action: () {},
    children: [
      ActionAppBar(
        icon: const Icon(Icons.search),
        title: 'Privacy policy'.hardcode,
        action: () {},
      ),
      ActionAppBar(
        icon: const Icon(Icons.search),
        title: 'Term & conditions'.hardcode,
        action: () {},
      ),
      ActionAppBar(
        icon: const Icon(Icons.search),
        title: 'Shipping & return'.hardcode,
        action: () {},
      ),
    ],
  ),
];

class BScaffold extends StatelessWidget {
  const BScaffold({
    super.key,
    this.title,
    this.appBar,
    this.body,
    this.floatingActionButton,
  });

  final String? title;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      actions: [
        ActionAppBar(
          icon: const Icon(Icons.home),
          title: 'Home'.hardcode,
          action: () {},
          path: AppRouter.root.path,
        ),
        ActionAppBar(
          icon: const Icon(Icons.collections),
          title: 'Collections'.hardcode,
          action: () {},
          children: [
            ActionAppBar(
              icon: const Icon(Icons.search),
              title: 'Home'.hardcode,
              action: () {},
            ),
            ActionAppBar(
              icon: const Icon(Icons.search),
              title: 'Cosmetic'.hardcode,
              action: () {},
            ),
          ],
        ),
        ActionAppBar(
          icon: const Icon(Icons.child_care_outlined),
          title: 'Blogs'.hardcode,
          action: () {
            FigmaRouter().go(context);
          },
        ),
        ActionAppBar(
          icon: const Icon(Icons.search),
          title: 'Search'.hardcode,
          action: () {},
          isDraw: true,
        ),
        ActionAppBar(
          icon: const Icon(Icons.person),
          title: 'Account'.hardcode,
          action: () {},
          isDraw: true,
        ),
        ActionAppBar(
          icon: const Icon(Icons.card_travel_rounded),
          title: 'Cart'.hardcode,
          action: () {},
          isDraw: true,
        ),
      ],
      title: title,
      currentLocation: Routers.ins.$router.location,
      drawers: _drawers,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
