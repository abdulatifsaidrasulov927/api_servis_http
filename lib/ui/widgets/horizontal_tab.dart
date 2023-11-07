import 'package:flutter/material.dart';

class HorizontalTab extends StatelessWidget {
  const HorizontalTab(
      {Key? key,
      required this.title,
      required this.color,
      this.leftImage = '',
      this.rightImage = '',
      required this.height})
      : super(key: key);

  final String title;
  final Color color;
  final String leftImage;
  final String rightImage;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Text('leftImage'),
            SizedBox(
              width: 8,
            ),
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: color)),
            SizedBox(
              width: 8,
            ),
            Text('rightImage'),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          width: 160,
          height: height,
          color: color,
        )
      ],
    );
  }
}
