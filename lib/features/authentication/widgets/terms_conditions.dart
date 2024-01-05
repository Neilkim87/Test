import 'package:flutter/material.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class TermsandConditions extends StatelessWidget {
  const TermsandConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: 'By continuing, you agree to our ',
            style: TextStyle(
              height: 1.2,
              letterSpacing: -0.2,
              color: Colors.black54,
              fontWeight: FontWeight.w300,
              fontSize: Sizes.size14,
            ),
            children: [
              TextSpan(
                text: 'Terms of Service',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: ' and acknowledge that you have read our ',
              ),
              TextSpan(
                text: 'Privacy Policy ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: ' to learn how we collect, use, and share your data.',
              ),
            ],
          ),
        ),
        Gaps.v28,
      ],
    );
  }
}
