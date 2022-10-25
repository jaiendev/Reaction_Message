// Flutter imports:
import 'package:flutter/material.dart';
import 'package:react_message/models/icon_reaction_model.dart';

// Project imports:

class ReactionScreen1 extends StatefulWidget {
  final Function(IconReactionModel?) onChange;
  final List<IconReactionModel> listIcon;
  final IconReactionModel? currentIconOfMessage;
  final bool isTablet;
  final double? emojiSize;
  final String? currentIconOfMessage1;
  const ReactionScreen1(
      {Key? key,
      required this.onChange,
      required this.listIcon,
      this.currentIconOfMessage,
      required this.isTablet,
      this.emojiSize,
      this.currentIconOfMessage1})
      : super(key: key);

  @override
  State<ReactionScreen1> createState() => _ReactionScreen1State();
}

class _ReactionScreen1State extends State<ReactionScreen1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        widget.listIcon.length,
        (index) => Padding(
          padding: widget.isTablet
              ? const EdgeInsets.symmetric(horizontal: 8)
              : const EdgeInsets.symmetric(horizontal: 3),
          child: GestureDetector(
            onTap: () {
              if (widget.currentIconOfMessage1 !=
                  widget.listIcon[index].iconAsset) {
                widget.onChange(widget.listIcon[index]);
              } else {
                widget.onChange(null);
              }

              Navigator.of(context).pop();
            },
            child: Image.asset(
              widget.listIcon[index].iconAsset,
              width: widget.emojiSize ?? 30.0,
              height: widget.emojiSize ?? 30.0,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
