// Flutter imports:
import 'package:flutter/material.dart';
import 'package:react_message/helpers/sizer_custom/sizer.dart';
import 'package:react_message/models/icon_reaction_model.dart';

// Project imports:

class ReactionScreen1 extends StatefulWidget {
  final Function(IconReactionModel?) onChange;
  final List<IconReactionModel> listIcon;
  final IconReactionModel? currentIconOfMessage;
  const ReactionScreen1(
      {Key? key,
      required this.onChange,
      required this.listIcon,
      this.currentIconOfMessage})
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
          padding: SizerUtil.isTablet
              ? EdgeInsets.symmetric(horizontal: 8.sp)
              : EdgeInsets.symmetric(horizontal: 3.sp),
          child: GestureDetector(
            onTap: () {
              if (widget.currentIconOfMessage != widget.listIcon[index]) {
                widget.onChange(widget.listIcon[index]);
              } else {
                widget.onChange(null);
              }

              Navigator.of(context).pop();
            },
            child: Image.asset(
              widget.listIcon[index].iconAsset,
              width: 30.0.sp,
              height: 30.0.sp,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
