import 'package:flutter/material.dart';

class Custombuttonappbar extends StatelessWidget {
  final void Function()? onPressed;
  final String name;
  final IconData icon;
  final Color colorselect;
  final bool active;

  const Custombuttonappbar({
    super.key,
    this.onPressed,
    required this.name,
    required this.icon,
    required this.colorselect,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active ? Colors.deepPurple[800] : colorselect,
            size: active ? 30 : 25,
          ),
          Text(
            name,
            style: TextStyle(
                color: active ? Colors.deepPurple[800] : colorselect,
                fontSize: active ? 17 : 13),
          ),
        ],
      ),
    );
  }
}
