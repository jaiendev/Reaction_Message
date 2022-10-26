library react_message;

import 'package:flutter/material.dart';
import 'package:react_message/common/custom_dropdown_button_reaction.dart';
import 'package:react_message/models/icon_reaction_model.dart';
import 'package:react_message/widgets/reaction_widget.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class ReactionMessage extends StatefulWidget {
  final Widget widgetMessage;
  final EdgeInsetsGeometry? dropdowPadding;
  final bool? isReaction;
  final Function(IconReactionModel?)? handleUpdateIcon;
  final double? positionRight;
  final double? positionBottom;
  final double? itemWidth;
  final double? itemHeight;
  final double? buttonWidth;
  final bool isMe;
  final int systemType;
  final bool isTablet;
  final Color? buttonIconColor;
  final double? buttonIconSize;
  final BoxDecoration? buttonDecoration;
  final BoxDecoration? iconReactionDecoration;
  final EdgeInsetsGeometry? paddingIconReaction;
  final double? sizeIconReaction;
  final double? emojiSize;
  final IconReactionModel? currentIconReaction;
  final String? currentIconReaction1;
  const ReactionMessage(
      {Key? key,
      required this.widgetMessage,
      this.dropdowPadding,
      this.isReaction,
      this.handleUpdateIcon,
      this.positionBottom,
      this.positionRight,
      this.itemWidth,
      this.itemHeight,
      this.buttonWidth,
      required this.isMe,
      required this.systemType,
      required this.isTablet,
      this.buttonIconColor,
      this.buttonIconSize,
      this.buttonDecoration,
      // padding style cho icon reaction
      this.paddingIconReaction,
      // kích thước của icon reaction trên tin nhắn khi reaction xong
      this.sizeIconReaction,
      // thêm size cho icon reaction khi reaction xong
      this.iconReactionDecoration,
      // size của emoji khi build lên pageview
      this.emojiSize,
      // icon reaction của tin nhắn
      this.currentIconReaction,
      // icon reaction của tin nhắn dạng String
      this.currentIconReaction1})
      : super(key: key);

  @override
  State<ReactionMessage> createState() => _ReactionMessageState();
}

class _ReactionMessageState extends State<ReactionMessage> {
  late IconReactionModel? iconReaction;
  String? selectedValue;
  List<Widget> items = [];
  bool isReaction = false;
  @override
  void initState() {
    super.initState();
    iconReaction = null;
    items = [
      ReactionScreen(
        onChange: (iconReactionSelected) async {
          setState(() {
            if (iconReactionSelected != null) {
              if (widget.currentIconReaction1 !=
                  iconReactionSelected.iconAsset) {
                iconReaction = iconReactionSelected;
                isReaction = true;
                widget.handleUpdateIcon!(iconReactionSelected);
              } else {
                iconReaction = null;
                isReaction = false;
                widget.handleUpdateIcon!(null);
              }
            }
          });
        },
        currentIconOfMessage: widget.currentIconReaction,
        currentIconOfMessage1: widget.currentIconReaction1,
        isTablet: widget.isTablet, //widget.messageModel.iconReactionModel,
        emojiSize: widget.emojiSize,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          isReaction ? const EdgeInsets.only(bottom: 10.8) : EdgeInsets.zero,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.widgetMessage,
              !widget.isMe && (![1, 2, 3, 4, 5, 6].contains(widget.systemType))
                  ? CustomDropdownButton2Reaction(
                      dropdownItems: items,
                      hint: '',
                      onChanged: (Object? value) {},
                      value: selectedValue,
                      icon: Container(
                        padding: const EdgeInsets.all(2),
                        child: Center(
                          child: Icon(
                            Icons.emoji_emotions_outlined,
                            size: widget.buttonIconSize ?? 16.0,
                            color: widget.buttonIconColor ??
                                const Color(0xFF9897A0),
                          ),
                        ),
                      ),
                      buttonPadding: EdgeInsets.zero,
                      dropdownPadding: widget.dropdowPadding ??
                          const EdgeInsets.only(left: 8, right: 6).add(
                            const EdgeInsets.symmetric(vertical: 8),
                          ),
                      itemPadding: EdgeInsets.zero,
                      valueAlignment: Alignment.center,
                      buttonWidth: widget.buttonWidth ?? 20,
                      itemWidth: widget.itemWidth ??
                          MediaQuery.of(context).size.width - 50,
                      itemHeight: widget.itemHeight ?? 50,
                      buttonDecoration: widget.buttonDecoration ??
                          BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                    )
                  : const SizedBox()
            ],
          ),
          iconReaction != null
              ? Positioned(
                  bottom: widget.positionBottom ?? 0.0,
                  right: widget.positionRight ?? 0.0,
                  child: Visibility(
                    visible: !widget.isMe,
                    child: Container(
                      padding: widget.paddingIconReaction ??
                          const EdgeInsets.all(2.4),
                      decoration: widget.iconReactionDecoration ??
                          BoxDecoration(
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
                          width: widget.sizeIconReaction ?? 13.6,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
