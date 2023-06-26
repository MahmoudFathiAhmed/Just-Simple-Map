import 'package:flutter/material.dart';

class OfferWidget extends StatelessWidget {
  final Widget contentWidget;

  const OfferWidget({
    super.key,
    required this.contentWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: contentWidget,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: (){},
                child: Container(
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(15)),
                  ),
                  child: const Center(child: Text('قبول')),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: (){},
                child: Container(
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(15)),
                  ),
                  child: const Center(child: Text('رفض')),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
