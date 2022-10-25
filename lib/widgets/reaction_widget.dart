// Flutter imports:
import 'package:flutter/material.dart';

import 'package:react_message/models/icon_reaction_model.dart';
import 'package:react_message/widgets/reaction_emoji.dart';

// Project imports:

class ReactionScreen extends StatefulWidget {
  final Function(IconReactionModel?) onChange;
  final IconReactionModel? currentIconOfMessage;
  final String? currentIconOfMessage1;
  final bool isTablet;
  final double? emojiSize;
  const ReactionScreen(
      {Key? key,
      required this.onChange,
      this.currentIconOfMessage,
      required this.isTablet,
      this.emojiSize,
      this.currentIconOfMessage1})
      : super(key: key);

  @override
  State<ReactionScreen> createState() => _ReactionScreenState();
}

class _ReactionScreenState extends State<ReactionScreen> {
  int _currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);
  late List<Widget> listPages;
  @override
  void initState() {
    super.initState();

    listPages = [
      ReactionScreen1(
        onChange: (iconReaction) {
          widget.onChange(iconReaction);
        },
        listIcon: listFake0,
        currentIconOfMessage: widget.currentIconOfMessage,
        isTablet: widget.isTablet,
        emojiSize: widget.emojiSize,
      ),
      ReactionScreen1(
        onChange: (iconReaction) {
          widget.onChange(iconReaction);
        },
        listIcon: listFake1,
        currentIconOfMessage: widget.currentIconOfMessage,
        isTablet: widget.isTablet,
        emojiSize: widget.emojiSize,
      ),
      ReactionScreen1(
        onChange: (iconReaction) {
          widget.onChange(iconReaction);
        },
        listIcon: listFake2,
        currentIconOfMessage: widget.currentIconOfMessage,
        isTablet: widget.isTablet,
        emojiSize: widget.emojiSize,
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: listPages,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                listPages.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: _currentPage == index
                      ? const Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 10,
                        )
                      : const Icon(
                          Icons.circle,
                          color: Colors.grey,
                          size: 4,
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
