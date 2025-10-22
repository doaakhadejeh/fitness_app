import 'package:flutter/material.dart';

class Mytextform extends StatelessWidget {
  final Widget widg;
  final String text;
  final String hinttext;
  final TextEditingController controller;
  final String? Function(String?)? validat;
  final bool isnumber;
  final bool? secpass;
  final void Function()? ontapicon;

  const Mytextform({
    super.key,
    required this.widg,
    required this.text,
    required this.hinttext,
    required this.controller,
    required this.validat,
    required this.isnumber,
    this.secpass,
    this.ontapicon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secpass == null || secpass == false ? false : true,
      keyboardType: isnumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: validat,
      controller: controller,
      decoration: InputDecoration(
        label: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        hintText: hinttext,
        suffixIcon: InkWell(
          onLongPress: ontapicon,
          child: widg,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(90)),
      ),
    );
  }
}
