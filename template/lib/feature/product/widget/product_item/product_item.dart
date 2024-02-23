import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product_item_bloc.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({required this.bloc, super.key});
  final ProductItemBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              bloc.category.name ?? '--',
              textAlign: TextAlign.center,
              style: context.theme.styles.c1,
            ),
          ),
          Center(
            child: BlocProvider(
              create: (context) => bloc,
              child: BlocBuilder<ProductItemBloc, ProductItemState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    error: (err) => SizedBox(
                      height: 100,
                      child: Center(
                        child: IconButton(
                          onPressed: bloc.reload,
                          icon: const Icon(Icons.replay_outlined),
                        ),
                      ),
                    ),
                    data: (lst) => Wrap(
                      children: [
                        for (final item in lst)
                          Container(
                            padding: const EdgeInsets.all(5),
                            constraints: const BoxConstraints(maxWidth: 230),
                            child: Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: 200 / 150,
                                  child: Image.network(
                                    item.image ?? '--',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  item.name ?? '--',
                                  style: context.theme.styles.c1,
                                ),
                                Text(
                                  item.name ?? '--',
                                  style: context.theme.styles.c2,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
