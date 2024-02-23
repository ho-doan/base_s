import 'dart:developer';

import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/common/common.dart';
import '../product/widget/product_item/product_item.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc get _bloc => context.read<HomeBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {
            log(state.runtimeType.toString());
          },
          loading: (_) {
            // TODO(hodoan): handle loading
          },
          error: (e) {
            // TODO(hodoan): handle error
          },
          data: (_) {
            // TODO(hodoan): handle data
          },
        );
      },
      child: BScaffold(
        title: 'Home'.hardcode,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (p, c) =>
                    c.isData && (p.data?.categories != c.data?.categories),
                builder: (context, state) {
                  final categories = state.data?.categories;
                  return switch (categories) {
                    Categories() => categories.maybeMap(
                        orElse: SizedBox.shrink,
                        loading: (_) => const CircularProgressIndicator(),
                        error: (error) => _CateError(error.error),
                        data: (data) {
                          final cateLst = data.categories;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cateLst.length,
                            itemBuilder: (_, index) => ProductItemWidget(
                              bloc: _bloc.products[index],
                            ),
                          );
                        },
                      ),
                    null => Container(),
                  };
                },
              ),
              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (p, c) =>
                    c.isData && !listEquals(p.entries, c.entries),
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
                    c.isData && !listEquals(p.entries1, c.entries1),
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
                    c.isData && !listEquals(p.entries2, c.entries2),
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
                buildWhen: (p, c) {
                  return true;
                },
                // buildWhen: (p, c) =>
                //     (c.isData && !listEquals(p.entries3, c.entries3)) ||
                //     c.isError ||
                //     p.isData && c.isData,
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () => const SizedBox.shrink(),
                    error: (e) => const Text('Error'),
                    data: (_) {
                      final entries = _.entries3 ?? <EntryModel>[];
                      if (entries.isEmpty) {
                        return const Text('Data empty');
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: entries.length,
                        itemBuilder: (_, index) => Text(
                          entries[index].getName(),
                        ),
                      );
                    },
                  );
                },
              ),
              const Footer(),
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

class _CateError extends StatelessWidget {
  const _CateError(this.errorState);

  final ErrorState errorState;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Opp! error ${errorState.errorMessage}.'.hardcode,
      ),
    );
  }
}
