import 'dart:developer';

import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/common/common.dart';
import 'bloc/figma_bloc.dart';

class FigmaScreen extends StatefulWidget {
  const FigmaScreen({super.key});

  @override
  State<FigmaScreen> createState() => _FigmaScreenState();
}

class _FigmaScreenState extends State<FigmaScreen> {
  // FigmaBloc get _bloc => context.read<FigmaBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<FigmaBloc, FigmaState>(
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
        body: SelectionArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                BlocBuilder<FigmaBloc, FigmaState>(
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
                      error: (e) => _Error(e.error),
                      data: (_) {
                        final file = _.file;
                        if (file == null)
                          return Container(
                            child: Center(
                              child: Text('file figma is null'),
                            ),
                          );

                        // return ListView.builder(
                        //   shrinkWrap: true,
                        //   physics: const NeverScrollableScrollPhysics(),
                        //   itemCount: entries.length,
                        //   itemBuilder: (_, index) => Text(
                        //     entries[index].getName(),
                        //   ),
                        // );
                        final documents = file.document.documents;
                        return Container(
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Text('All text figma'),
                              ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  for (final item in documents
                                      .where((e) => e.characters != null)
                                      .toList())
                                    Row(
                                      children: [
                                        Text(
                                          item.characters!,
                                          style: TextStyle(
                                            fontFamily: item.style?.fontFamily,
                                          ),
                                        ),
                                        // Text(item,),
                                      ],
                                    ),
                                  // for (final item in file.document.allText)
                                  //   Row(
                                  //     children: [
                                  //       Text(item,
                                  //       style: TextStyle(
                                  //         fontFamily: item.
                                  //       ),),
                                  //       Text(item,),
                                  //     ],
                                  //   ),
                                ],
                              ),
                            ],
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

class _Error extends StatelessWidget {
  const _Error(this.errorState);

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

extension on FigmaDocument? {
  // ignore: unused_element
  List<String> get allText {
    if (this == null) return [];
    final lst = <String>[];
    if (this!.characters != null) {
      lst.add(this!.characters!);
    }
    if (this!.children != null) {
      for (final item in this!.children!) {
        lst.addAll(item.allText);
      }
    }
    return lst;
  }

  List<FigmaDocument> get documents {
    if (this == null) return [];
    final lst = <FigmaDocument>[];

    lst.add(this!);

    if (this!.children != null) {
      for (final item in this!.children!) {
        lst.addAll(item.documents);
      }
    }
    return lst;
  }
}
