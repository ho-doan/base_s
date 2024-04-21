import 'package:common/common.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HomeCallback {
  void homeCallback() {}
  void profileCallback() {}
  void settingsCallback() {}
  void productsCallback() {}
  void infoCallback() {}
  void openEndDrawer() {}
}

class MockHomeAction extends Mock implements HomeCallback {}

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.homeCallback,
    required this.profileCallback,
    required this.settingsCallback,
    required this.productsCallback,
    required this.infoCallback,
    this.location,
  });

  final VoidCallback homeCallback;
  final VoidCallback profileCallback;
  final VoidCallback settingsCallback;
  final VoidCallback productsCallback;
  final VoidCallback infoCallback;
  final String? location;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        currentLocation: widget.location ?? '/',
        children: [
          ActionAppBar(
            path: '/',
            icon: Icon(Icons.home),
            title: 'Home',
            action: widget.homeCallback,
            isDraw: true,
          ),
          ActionAppBar(
            path: '/settings',
            icon: Icon(Icons.settings),
            title: 'Settings',
            action: widget.settingsCallback,
            isDraw: true,
          ),
          ActionAppBar(
            path: '/products',
            icon: Icon(Icons.category),
            title: 'Products',
            action: widget.productsCallback,
          ),
          ActionAppBar(
            icon: Icon(Icons.person),
            title: 'Profile',
            action: widget.profileCallback,
            children: [
              ActionAppBar(
                path: '/info',
                icon: Icon(Icons.category),
                title: 'Info',
                action: widget.infoCallback,
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
      ),
      body: Container(),
    );
  }
}

void main() {
  group('ActionAppBar', () {
    test('with default isDraw', () {
      final mock = ActionAppBar(
        action: () {},
        icon: Icon(Icons.home),
        title: 'home',
      );
      expect(mock.isDraw, false);
    });
    test('with isDraw true', () {
      final mock = ActionAppBar(
        action: () {},
        icon: Icon(Icons.home),
        title: 'home',
        isDraw: true,
      );
      expect(mock.isDraw, true);
    });
  });
  group('List<ActionAppBar>?', () {
    test('with draw', () {
      final List<ActionAppBar>? mock = [
        ActionAppBar(
          action: () {},
          icon: Icon(Icons.home),
          title: 'home',
        ),
      ];
      expect(mock.draw.length, 0);
      expect(mock.withoutDraw.length, 1);
    });
    test('with not draw', () {
      final List<ActionAppBar>? mock = [
        ActionAppBar(
          action: () {},
          icon: Icon(Icons.home),
          title: 'home',
          isDraw: true,
        ),
      ];
      expect(mock.draw.length, 1);
      expect(mock.withoutDraw.length, 0);
    });
  });

  testWidgets('BaseAppBar', (tester) async {
    final home = MockHomeAction();

    addTearDown(tester.view.reset);
    tester.view.physicalSize = Size(5000, 5000);
    TestWidgetsFlutterBinding.ensureInitialized();

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
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();
    await tester.pumpAndSettle();
    verifyNever(home.homeCallback());
    when(home.settingsCallback()).thenAnswer((_) {
      print('settings');
    });
    await tester.ensureVisible(find.byIcon(Icons.settings));
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();
    verify(home.settingsCallback());

    when(home.productsCallback()).thenAnswer((_) {
      print('category');
    });
    await tester.ensureVisible(find.text('Products'));
    await tester.tap(find.text('Products'));
    await tester.pumpAndSettle();
    verify(home.productsCallback());
  });
  testWidgets('BaseAppBar UI width > 600', (tester) async {
    final home = MockHomeAction();

    TestWidgetsFlutterBinding.ensureInitialized();
    addTearDown(tester.view.reset);
    tester.view.physicalSize = Size(5000, 5000);

    await tester.pumpWidget(MaterialApp(
      theme: AppThemes.internal().lightTheme,
      darkTheme: AppThemes.internal().dartTheme,
      home: Home(
        location: '/products',
        homeCallback: home.homeCallback,
        profileCallback: home.profileCallback,
        productsCallback: home.productsCallback,
        settingsCallback: home.settingsCallback,
        infoCallback: home.infoCallback,
      ),
    ));

    final homeAction = tester.elementList(find.byType(InkWell)).toList().first;
    final inWell = homeAction.widget as InkWell;
    final container = inWell.child as Container;
    final text = (container.child as Text).data;

    expect(text, 'Products');

    final border = (container.decoration as BoxDecoration).border;
    final color = border?.bottom.color;
    expect(color, isNotNull);

    when(home.infoCallback()).thenAnswer((_) {
      print('info');
    });
    await tester.tap(find.byType(DropdownButton2<ActionAppBar>));
    await tester.pump();
    await tester.tap(find.text('Info'));
    await tester.pumpAndSettle();
    verify(home.infoCallback()).called(1);
  });
  testWidgets('BaseAppBar UI width < 600', (tester) async {
    final home = MockHomeAction();

    TestWidgetsFlutterBinding.ensureInitialized();
    addTearDown(tester.view.reset);
    tester.view.physicalSize = Size(600, 1000);
    tester.view.devicePixelRatio = 1;

    await tester.pumpWidget(MaterialApp(
      theme: AppThemes.internal().lightTheme,
      darkTheme: AppThemes.internal().dartTheme,
      home: Home(
        location: '/products',
        homeCallback: home.homeCallback,
        profileCallback: home.profileCallback,
        productsCallback: home.productsCallback,
        settingsCallback: home.settingsCallback,
        infoCallback: home.infoCallback,
      ),
    ));

    when(home.settingsCallback()).thenAnswer((_) {
      print('settings');
    });

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pump();
    verify(home.settingsCallback()).called(1);

    openEndDrawer = home.openEndDrawer;
    when(home.openEndDrawer()).thenAnswer((_) {});
    await tester.tap(find.byIcon(Icons.list));
    await tester.pump();
    verify(home.openEndDrawer()).called(1);
  });
}
