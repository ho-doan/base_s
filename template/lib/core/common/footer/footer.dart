part of '../common.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        if (constraints.maxWidth < 600) {
          return const SizedBox.shrink();
        }
        return Wrap(
          children: [
            for (final item in _drawers)
              Container(
                constraints: const BoxConstraints(maxWidth: 300),
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      title: Text(
                        item.title,
                        style: context.theme.styles.c1,
                      ),
                    ),
                    for (final subItem in item.children.lst)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5)
                            .copyWith(left: 26),
                        child: Text.rich(
                          TextSpan(
                            text: subItem.title,
                            style: context.theme.styles.c1.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = subItem.action,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                    title: Text(
                      'Newsletter'.hardcode,
                      style: context.theme.styles.c1,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email Address'.hardcode,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
