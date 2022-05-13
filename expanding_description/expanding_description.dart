import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// # Expanding Description Widget
///
/// A widget that will take in a `description` text and the max amount of characters to show, and it will display that amount of characters onto the screen with a `More` text button that when pressed will expand the widget that contains the text to display the full description with the word `Less` at the end which when pressed it will contract the widget back to a smaller size to show only the max amount of characters.
///
/// # Properties
///
/// * `required String description` - The full text that will be displayed partially until the `More` button is pressed.
/// * `required int maxCharBeforeBreak` - The max amount of characters to display before showing `... More`.
/// * `String expandText = 'More'` - The text at the end that is when pressed it will expand the widget to show the full description. Defaulted as `More`.
/// * `String contractText = 'Less'` - The text at the end taht is when pressed it will contract the widget to show the max amount of charecter of the description. Defaulted as `Less`.
/// * `TextStyle textSpanStyle = const TextStyle(color: Colors.black)` - The style which will be used to style the `TextSpan`s of the widget which contains the first half of the description and the second half of the description. Defaulted to a simple `TextStyle` where the color is `Black`.
/// * `bool isAnimated = true` - To determine if the widget should be animated or not.
/// * `AnimatedSize animation = const AnimatedSize(duration: Duration(milliseconds: 400), curve: Curves.fastLinearToSlowEaseIn)` - This is the `AnimatedSize` which is used to animate the widget if the `isAnimated` property is true.
///
/// # How it looks
///
/// <p align="center">
///   <img src="expanding_description.gif" width="350" title="App Screenshot">
/// </p>

class ExpandingDescription extends StatefulWidget {
  final String description;
  final int maxCharBeforeBreak;
  final String expandText;
  final String contractText;
  final TextStyle textSpanStyle;
  final bool isAnimated;
  final AnimatedSize animation;

  const ExpandingDescription({
    Key? key,
    required this.description,
    required this.maxCharBeforeBreak,
    this.textSpanStyle = const TextStyle(color: Colors.black),
    this.expandText = 'More',
    this.contractText = 'Less',
    this.isAnimated = true,
    this.animation = const AnimatedSize(
      duration: Duration(
        milliseconds: 400,
      ),
      curve: Curves.fastLinearToSlowEaseIn,
    ),
  }) : super(key: key);

  @override
  State<ExpandingDescription> createState() => _ExpandingDescriptionState();
}

class _ExpandingDescriptionState extends State<ExpandingDescription>
    with TickerProviderStateMixin {
  static const String _ellipsis = "\u2026\u0020";
  bool _isExpanded = false;

  GestureRecognizer get _readMore => TapGestureRecognizer()
    ..onTap = () => setState(() => _isExpanded = !_isExpanded);

  RichText _buildEllipsizedText(
          String firstHalf, GestureRecognizer tapRecognizer) =>
      RichText(
        text: TextSpan(
          text: '$firstHalf$_ellipsis',
          style: widget.textSpanStyle,
          children: [
            TextSpan(
              text: widget.expandText,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
              recognizer: tapRecognizer,
            ),
          ],
        ),
      );

  RichText _buildFullText(String firstHalf, String secondHalf,
          GestureRecognizer tapRecognizer) =>
      RichText(
        text: TextSpan(
          text: firstHalf,
          style: widget.textSpanStyle,
          children: [
            TextSpan(
              text: secondHalf,
              style: widget.textSpanStyle,
            ),
            TextSpan(
              text: widget.description.length <= widget.maxCharBeforeBreak
                  ? ''
                  : ' ${widget.contractText}',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
              recognizer: _readMore,
            ),
          ],
        ),
      );

  Widget _buildWithoutAnimation(
    String firstHalf,
    String secondHalf,
    String description,
    int maxChars,
  ) =>
      description.length <= maxChars || _isExpanded
          ? _buildFullText(firstHalf, secondHalf, _readMore)
          : _buildEllipsizedText(firstHalf, _readMore);

  Widget _buildWithAnimation(
    String firstHalf,
    String secondHalf,
    String description,
    int maxChars,
  ) =>
      AnimatedSize(
        curve: widget.animation.curve,
        duration: widget.animation.duration,
        alignment: widget.animation.alignment,
        clipBehavior: widget.animation.clipBehavior,
        reverseDuration: widget.animation.reverseDuration,
        child: description.length <= maxChars || _isExpanded
            ? _buildFullText(firstHalf, secondHalf, _readMore)
            : _buildEllipsizedText(firstHalf, _readMore),
      );

  @override
  Widget build(BuildContext context) {
    final maxChars = widget.maxCharBeforeBreak;
    final description = widget.description;
    final bool isLongText = description.length > maxChars;
    final String firstHalf = isLongText
        ? description.substring(
            0, (maxChars - _ellipsis.length - widget.expandText.length))
        : description;
    final String secondHalf = isLongText
        ? description.substring(
            (maxChars - _ellipsis.length - widget.expandText.length),
            description.length)
        : '';
    return widget.isAnimated
        ? _buildWithAnimation(
            firstHalf,
            secondHalf,
            description,
            maxChars,
          )
        : _buildWithoutAnimation(
            firstHalf,
            secondHalf,
            description,
            maxChars,
          );
  }
}
