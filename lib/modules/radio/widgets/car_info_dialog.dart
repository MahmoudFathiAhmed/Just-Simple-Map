import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CarInfoWidget extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String title;
  const CarInfoWidget({Key? key, required this.imageUrl, required this.description, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(10),
              child: const Icon(Icons.close, size: 20),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Image.network(
              width: 40,
              height: 23,
              fit: BoxFit.cover,
              imageUrl),
          const SizedBox(
            height: 8,
          ),
          Text(
            description,
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(fontSize: 15),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: AutoSizeText.rich(
                  minFontSize: 8,
                  stepGranularity: 8,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: Colors.grey.shade200),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Ex: ',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(fontSize: 15),
                      ),
                       TextSpan(
                        text: title,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}