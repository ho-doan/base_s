import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

final mockDraws = [
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

class HomeCallback {
  void homeCallback() {}
  void profileCallback() {}
  void settingsCallback() {}
  void productsCallback() {}
  void infoCallback() {}
  void openEndDrawer() {}
}

class MockHomeAction extends Mock implements HomeCallback {}

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.homeCallback,
    required this.profileCallback,
    required this.settingsCallback,
    required this.productsCallback,
    required this.infoCallback,
  });
  final VoidCallback homeCallback;
  final VoidCallback profileCallback;
  final VoidCallback settingsCallback;
  final VoidCallback productsCallback;
  final VoidCallback infoCallback;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      currentLocation: '/',
      actions: [
        ActionAppBar(
          path: '/',
          icon: Icon(Icons.home),
          title: 'Home',
          action: homeCallback,
          isDraw: true,
        ),
        ActionAppBar(
          path: '/settings',
          icon: Icon(Icons.settings),
          title: 'Settings',
          action: settingsCallback,
          isDraw: true,
        ),
        ActionAppBar(
          path: '/products',
          icon: Icon(Icons.category),
          title: 'Products',
          action: productsCallback,
        ),
        ActionAppBar(
          icon: Icon(Icons.person),
          title: 'Profile',
          action: profileCallback,
          children: [
            ActionAppBar(
              path: '/info',
              icon: Icon(Icons.category),
              title: 'Info',
              action: infoCallback,
            ),
            ActionAppBar(
              path: '/info2',
              icon: Icon(Icons.category),
              title: 'Info2',
              action: () {},
            ),
          ],
        ),
      ],
      drawers: mockDraws,
    );
  }
}

void main() {
  testWidgets('ScaffoldBase', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    addTearDown(tester.view.reset);
    tester.view.physicalSize = Size(600, 1000);
    tester.view.devicePixelRatio = 1;

    final home = MockHomeAction();

    await tester.pumpWidget(MaterialApp(
      theme: AppThemes.internal().lightTheme,
      darkTheme: AppThemes.internal().dartTheme,
      home: Home(
        homeCallback: home.homeCallback,
        profileCallback: home.profileCallback,
        productsCallback: home.productsCallback,
        settingsCallback: home.settingsCallback,
        infoCallback: home.infoCallback,
      ),
    ));

    await tester.tap(find.byIcon(Icons.list));
    await tester.pump();
    expect(find.text('Template'), findsOneWidget);
  });
}
