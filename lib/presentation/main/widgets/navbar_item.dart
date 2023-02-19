import 'package:flutter/material.dart';

class IconNavBar extends StatelessWidget {
  final String iconPath;

  const IconNavBar({
    required this.iconPath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          iconPath,
          height: 20,
          width: 20,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
