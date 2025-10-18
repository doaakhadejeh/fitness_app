import 'package:flutter/material.dart';

class Customcardhome extends StatelessWidget {
  final String? url;
  final String? text;
  final void Function()? ontap;
  const Customcardhome({super.key, this.url, this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Column(children: [
          Image.asset(
            url!,
            height: 140,
            width: 140,
          ),
          Text(
            text!,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
          )
        ]),
      ),
    );
  }
}
