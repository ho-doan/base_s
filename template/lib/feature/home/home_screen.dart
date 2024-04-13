import 'dart:developer';

import 'package:common/common.dart';
import 'package:domain/domain.dart';
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
                buildWhen: (p, c) => (p, c).build,
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
                              category: cateLst[index],
                            ),
                          );
                        },
                      ),
                    null => Container(),
                  };
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
