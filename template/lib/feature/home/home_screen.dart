import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            // TODO(hodoan): handle loading
          },
          error: (e) {
            // TODO(hodoan): handle error
          },
          data: (e) {
            // TODO(hodona): handle data
          },
        );
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Home Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                error: (e) => const Text('Error'),
                data: (entries) {
                  if (entries.isEmpty) {
                    return const Text('Data empty');
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: entries.length,
                      itemBuilder: (_, index) => Text(
                        entries[index].getName(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
