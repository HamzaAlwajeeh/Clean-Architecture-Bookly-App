import 'package:bookly_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DetailsActions extends StatelessWidget {
  const DetailsActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'Free',
            textColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: CustomButton(
            text: 'Preview',
            textColor: Colors.white,
            backgroundColor: Color(0xffEF8262),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
