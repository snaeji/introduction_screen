import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroContent extends StatelessWidget {
  final PageViewModel page;
  final bool isFullScreen;

  const IntroContent({Key? key, required this.page, this.isFullScreen = false})
      : super(key: key);

  Widget _buildWidget(Widget? widget, String? text, TextStyle style) {
    return widget ?? Text(text!, style: style, textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: page.decoration.contentMargin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child:
              ListView(children: [
                if (page.image != null)
                  Align(
                    alignment: page.decoration.imageAlignment,
                    child: Padding(
                      padding: page.decoration.imagePadding,
                      child: page.image,
                    ),

                  ),
                Padding(
                  padding: page.decoration.titlePadding,
                  child: _buildWidget(
                    page.titleWidget,
                    page.title,
                    page.decoration.titleTextStyle,
                  ),
                ),
                Padding(
                  padding: page.decoration.descriptionPadding,
                  child: _buildWidget(
                    page.bodyWidget,
                    page.body,
                    page.decoration.bodyTextStyle,
                  ),
                ),
              ],),

          ),

          if (page.footer != null)
            Padding(
              padding: page.decoration.footerPadding,
              child: page.footer,
            ),
        ],
      ),
    );
  }
}
