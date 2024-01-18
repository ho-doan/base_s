import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template/core/services/dependency_injection/service_locator.dart';
import 'package:template/feature/home/bloc/home_bloc.dart';
import 'package:template/feature/home/home_screen.dart';

final homeScreen = MaterialApp(
  home: BlocProvider(
    create: (BuildContext context) =>
        getIt<HomeBloc>()..add(const HomeEvent.started()),
    child: const HomeScreen(),
  ),
);
Future<void> runningCounter(WidgetTester tester) async {
  await tester.pumpWidget(homeScreen);
  await tester.pump();
}
