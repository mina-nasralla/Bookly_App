import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.Errormssg});
  final String Errormssg;

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: Center(child: Text(Errormssg,style: const TextStyle(fontSize: 25,color: Colors.red),)));
  }
}
