import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ThirdHookExample extends HookWidget {
  const ThirdHookExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = useState(0);
    count.value++;
    Future<String> fetchData() async {
      await Future.delayed(const Duration(seconds: 1));
      return 'Hello World ${count.value}';
    }

    // final future = fetchData();
    final future = useMemoized(fetchData,[count.value]);
    final snapshot = useFuture(future);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          snapshot.hasData
              ? Text(
                  '${snapshot.data}',
                  style: const TextStyle(fontSize: 36),
                )
              : const Center(child: CircularProgressIndicator()),
        ],
      )),
    );
  }
}
