library react_message;

import 'package:flutter/material.dart';
import 'package:react_message/helpers/sizer_custom/sizer.dart';
import 'package:react_message/models/icon_reaction_model.dart';
import 'package:react_message/widgets/reaction_widget.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class ReactionMessage extends StatefulWidget {
  final Widget widgetMessage;
  final EdgeInsetsGeometry? padding;
  final bool isReaction;
  final Function? update;
  final double? positionRight;
  final double? positionBottom;
  final bool isMe;
  const ReactionMessage(
      {Key? key,
      required this.widgetMessage,
      this.padding,
      required this.isReaction,
      this.update,
      this.positionBottom,
      this.positionRight,
      required this.isMe})
      : super(key: key);

  @override
  State<ReactionMessage> createState() => _ReactionMessageState();
}

class _ReactionMessageState extends State<ReactionMessage> {
  late IconReactionModel? iconReaction;
  String? selectedValue;
  List<Widget> items = [];

  @override
  void initState() {
    super.initState();
    iconReaction = null;
    items = [
      ReactionScreen(
          onChange: (iconReactionSelected) {
            // setState(() {
            //   if (widget.messageModel.iconReactionModel != iconReactionSelected) {
            //     iconReaction = iconReactionSelected;
            //     widget.messageModel.iconReactionModel = iconReaction;
            //   } else {
            //     widget.messageModel.iconReactionModel = null;
            //   }
            // });
          },
          currentIconOfMessage: null //widget.messageModel.iconReactionModel,
          ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Container(
          padding: widget.isReaction
              ? EdgeInsets.only(bottom: 8.sp)
              : EdgeInsets.zero,
          child: Stack(
            children: [
              widget.widgetMessage,
              iconReaction != null
                  ? Positioned(
                      bottom: widget.positionBottom ?? 0.0,
                      right: widget.positionRight ?? 0.0,
                      child: Visibility(
                        visible: !widget.isMe,
                        child: Container(
                          padding: EdgeInsets.all(2.4.sp),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.8),
                                  offset: const Offset(0, 1),
                                  blurRadius: 0.8,
                                ),
                                BoxShadow(
                                  color: Colors.black.withOpacity(.35),
                                  offset: const Offset(1, 0),
                                  blurRadius: 1,
                                ),
                              ]),
                          child: Center(
                            child: Image.asset(
                              iconReaction!.iconAsset,
                              width: 13.6.sp,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
