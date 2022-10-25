// Flutter imports:
import 'package:flutter/material.dart';
import 'package:react_message/helpers/sizer_custom/sizer.dart';
import 'package:react_message/models/icon_reaction_model.dart';
import 'package:react_message/widgets/reaction_emoji.dart';

// Project imports:

class ReactionScreen extends StatefulWidget {
  final Function(IconReactionModel?) onChange;
  final IconReactionModel? currentIconOfMessage;
  const ReactionScreen(
      {Key? key, required this.onChange, this.currentIconOfMessage})
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
      ),
      ReactionScreen1(
        onChange: (iconReaction) {
          widget.onChange(iconReaction);
        },
        listIcon: listFake1,
        currentIconOfMessage: widget.currentIconOfMessage,
      ),
      ReactionScreen1(
        onChange: (iconReaction) {
          widget.onChange(iconReaction);
        },
        listIcon: listFake2,
        currentIconOfMessage: widget.currentIconOfMessage,
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
            SizedBox(
              height: 10.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                listPages.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.sp),
                  child: _currentPage == index
                      ? Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 10.sp,
                        )
                      : Icon(
                          Icons.circle,
                          color: Colors.grey,
                          size: 4.sp,
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
