import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:locations_work/core/utils/strings_manager.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> words=[
      UserAppStrings.continueC,
      UserAppStrings.signUp,
      UserAppStrings.sendCode,
      UserAppStrings.signIn,
      UserAppStrings.firstName,
      UserAppStrings.orderNow,
      UserAppStrings.subscribe,
      UserAppStrings.soon,
      UserAppStrings.processed,
      UserAppStrings.confirm,
      UserAppStrings.check,
      UserAppStrings.home,
      UserAppStrings.pay,
      UserAppStrings.wallet,
      UserAppStrings.active,
      UserAppStrings.history,
      UserAppStrings.notifications,
      UserAppStrings.booking,
    ];
    return Scaffold(
      appBar:AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ListView.separated(
              itemCount: words.length,
              itemBuilder: (context, index){
                return Text(words[index]);
              },
              separatorBuilder: (context, index){
                return const SizedBox(height: 10);
              },
              ),
              const SizedBox(width: 10),
              ListView.separated(
              itemCount: words.length,
              itemBuilder: (context, index){
                return Text(words[index]).tr();
              },
              separatorBuilder: (context, index){
                return const SizedBox(height: 10);
              },
              )
          ],
        ),
      ),
    );
  }
}