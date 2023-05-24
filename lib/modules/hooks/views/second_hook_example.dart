import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SecondHookExample extends HookWidget {
  const SecondHookExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _count = useState(0);
    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _count.value=timer.tick;
      });
      return timer.cancel;
    },[]);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${_count.value}',style: const TextStyle(fontSize: 36),)
          ],
        ),
      ),
    );
  }
}
