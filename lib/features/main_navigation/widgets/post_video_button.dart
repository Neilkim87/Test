import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatefulWidget {
  final bool onTapDown;
  const PostVideoButton({super.key, required this.onTapDown});

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 3),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 20,
            child: Container(
              height: widget.onTapDown ? 35 : 30, // 30
              width: widget.onTapDown ? 30 : 25, // 25
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(
                  Sizes.size8,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            child: Container(
              height: widget.onTapDown ? 35 : 30, // 30
              width: widget.onTapDown ? 30 : 25, // 25
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(
                  Sizes.size8,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: widget.onTapDown
                  ? Sizes.size12 + Sizes.size1
                  : Sizes.size11, // 11
            ),
            height: widget.onTapDown ? 35 : 30, // 30
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                Sizes.size6,
              ),
            ),
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: Colors.black,
                size: Sizes.size18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
