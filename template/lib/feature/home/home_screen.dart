import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
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
          data: (_, __, ___, ____) {
            // TODO(hodoan): handle data
          },
        );
      },
      buildWhen: (_, __) => false,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Home Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (p, c) =>
                    c.maybeMap(data: (_) => true, orElse: () => false) &&
                    !listEquals(
                      p.maybeMap(
                        orElse: () => <EntryModel>[],
                        data: (p) => p.entries,
                      ),
                      c.maybeMap(
                        orElse: () => <EntryModel>[],
                        data: (p) => p.entries,
                      ),
                    ),
                builder: (context, state) {
                  final data = state.maybeMap(
                    orElse: () => <EntryModel>[],
                    data: (p) => p.entries ?? [],
                  );
                  if (data.isEmpty) return const SizedBox.shrink();
                  return SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) => Container(
                        width: 50,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.green),
                        ),
                        child: Text(
                          data[i].getName(),
                        ),
                      ),
                      itemCount: data.length,
                    ),
                  );
                },
              ),
              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (p, c) =>
                    c.maybeMap(data: (_) => true, orElse: () => false) &&
                    !listEquals(
                      p.maybeMap(
                        orElse: () => <EntryModel>[],
                        data: (p) => p.entries1,
                      ),
                      c.maybeMap(
                        orElse: () => <EntryModel>[],
                        data: (p) => p.entries1,
                      ),
                    ),
                builder: (context, state) {
                  final data = state.maybeMap(
                    orElse: () => <EntryModel>[],
                    data: (p) => p.entries1 ?? [],
                  );
                  if (data.isEmpty) return const SizedBox.shrink();
                  return SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) => Container(
                        width: 50,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.green),
                        ),
                        child: Text(
                          data[i].getName(),
                        ),
                      ),
                      itemCount: data.length,
                    ),
                  );
                },
              ),
              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (p, c) =>
                    c.maybeMap(data: (_) => true, orElse: () => false) &&
                    !listEquals(
                      p.maybeMap(
                        orElse: () => <EntryModel>[],
                        data: (p) => p.entries2,
                      ),
                      c.maybeMap(
                        orElse: () => <EntryModel>[],
                        data: (p) => p.entries2,
                      ),
                    ),
                builder: (context, state) {
                  final data = state.maybeMap(
                    orElse: () => <EntryModel>[],
                    data: (p) => p.entries2 ?? [],
                  );
                  if (data.isEmpty) return const SizedBox.shrink();
                  return SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) => Container(
                        width: 50,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.green),
                        ),
                        child: Text(
                          data[i].getName(),
                        ),
                      ),
                      itemCount: data.length,
                    ),
                  );
                },
              ),
              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (p, c) =>
                    c.maybeMap(data: (_) => true, orElse: () => false) &&
                    !listEquals(
                      p.maybeMap(
                        orElse: () => <EntryModel>[],
                        data: (p) => p.entries3,
                      ),
                      c.maybeMap(
                        orElse: () => <EntryModel>[],
                        data: (p) => p.entries3,
                      ),
                    ),
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    error: (e) => const Text('Error'),
                    data: (_, __, ___, ____) {
                      final entries = ____ ?? <EntryModel>[];
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
