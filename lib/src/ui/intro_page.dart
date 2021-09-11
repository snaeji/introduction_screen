import 'package:flutter/material.dart';
import 'package:introduction_screen/src/model/page_view_model.dart';
import 'package:introduction_screen/src/ui/intro_content.dart';

extension ReversedList<T> on List<T> {
  List<T> asReversed(bool reverse) {
    return reverse ? this.reversed.toList() : this;
  }
}

class IntroPage extends StatefulWidget {
  final PageViewModel page;
  final ScrollController? scrollController;
  final bool isTopSafeArea;
  final bool isBottomSafeArea;

  const IntroPage({
    Key? key,
    required this.page,
    this.scrollController,
    required this.isTopSafeArea,
    required this.isBottomSafeArea,
  }) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Widget _buildFlex() {
    return Container(
      color: widget.page.decoration.pageColor,
      decoration: widget.page.decoration.boxDecoration,
      margin: const EdgeInsets.only(bottom: 60.0),
      child: IntroContent(page: widget.page),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      top: widget.isTopSafeArea,
      bottom: widget.isBottomSafeArea,
      child: _buildFlex(),
    );
  }
}
