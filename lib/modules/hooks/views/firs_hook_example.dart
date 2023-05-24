import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FirstHookExample extends HookWidget {
  const FirstHookExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          counter.value++;
        },
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("you have tapped counter ${counter.value} times",style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
