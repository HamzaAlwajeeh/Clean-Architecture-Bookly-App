import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({super.key, required this.erroeMessage});
  final String erroeMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        erroeMessage,
        style: Styles.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
