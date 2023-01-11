import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lpt_client/widgets/display/indicator.dart';

class FutureWidgetBuilder<T> extends HookWidget {
  final Future<T> Function() fetchFunction;
  final Widget Function(T) builder;
  final ValueNotifier? refresher;

  const FutureWidgetBuilder(
      {super.key,
      required this.builder,
      required this.fetchFunction,
      this.refresher});

  @override
  Widget build(BuildContext context) {
    final unique = refresher ?? useState(UniqueKey());
    final future = useMemoized(() => fetchFunction(), [unique.value]);
    final snapshot = useFuture(future);

    if (snapshot.connectionState == ConnectionState.waiting) {
      return const AppIndicator();
    }
    if (snapshot.hasError || snapshot.data == null) {
      return Column(
        children: [
          Text(snapshot.error.toString()),
          TextButton(
              onPressed: () {
                unique.value = UniqueKey();
              },
              child: const Text('reload'))
        ],
      );
    }

    return builder(snapshot.data!);
  }
}
