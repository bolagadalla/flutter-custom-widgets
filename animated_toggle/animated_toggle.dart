import 'package:flutter/material.dart';

/// {@tool dartpad}
/// # Animated Toggle Widget
///
/// This is a widget that toggles between two values. They are `GestureDetector` which once pressed will update and call the `onToggleCallback` and the value change is an  `int` indicating the index of the button. This widget uses the screen's width size to scale the width, height, font size, and the padding and margins.
///
/// # Properties
///
/// * `required List<String> values` - This is a list of strings that will be the buttons text. Max is 2.
/// * `required ValueChange onToggleCallback` - A call back which will be called when the value of the `initialPosition` is changed and provides an `int` value indicating the index of the current selected button.
/// * `Color backgroundColor` - This is the background color of the toggle, this is initialized to `const Color(0xFFE7E7E8)`, but it can be changed to other colors.
/// * `Color buttonColor` - This is the button color of the toggle which is initialized to `const Color(0xFFFFFFFF)` which is **White.**
/// * `Color textColor` - The text color which is initialized to `const Color(0xFF000000)` which is **Black**.
/// * `double scaler` - This is the scale of the toggle widget compared to the screen and by effect the current size of the widget. This is initialized to `1` and it should be a float between `0-1` to scale down and `1-2` to scale up.
///
/// # How it looks
///
/// <p align="center">
///   <img src="toggle_animation.gif" width="350" title="App Screenshot">
/// </p>
/// {@end-tool}
class AnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;
  final double scaler;

  const AnimatedToggle({
    Key? key,
    required this.values,
    required this.onToggleCallback,
    this.backgroundColor = const Color(0xFFE7E7E8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
    this.scaler = 1,
  }) : super(key: key);

  @override
  State<AnimatedToggle> createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  bool initialPosition = true;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: (screenSize.width * 0.6) * widget.scaler,
      height: (screenSize.width * 0.13) * widget.scaler,
      margin: const EdgeInsets.all(20),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              initialPosition = !initialPosition;
              var index = 0;
              if (!initialPosition) {
                index = 1;
              }
              widget.onToggleCallback(index);
              setState(() {});
            },
            child: Container(
              width: (screenSize.width * 0.6) * widget.scaler,
              height: (screenSize.width * 0.13) * widget.scaler,
              decoration: ShapeDecoration(
                color: widget.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      (screenSize.width * 0.1) * widget.scaler),
                ),
              ),
              child: Row(
                children: List.generate(
                  widget.values.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (screenSize.width * 0.05) * widget.scaler),
                    child: Text(
                      widget.values[index],
                      style: TextStyle(
                        fontSize: (screenSize.width * 0.04) * widget.scaler,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xAA000000),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            alignment:
                initialPosition ? Alignment.centerLeft : Alignment.centerRight,
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            child: Container(
              width: (screenSize.width * 0.33) * widget.scaler,
              height: (screenSize.width * 0.13) * widget.scaler,
              decoration: ShapeDecoration(
                color: widget.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      (screenSize.width * 0.1) * widget.scaler),
                ),
              ),
              child: Text(
                initialPosition ? widget.values[0] : widget.values[1],
                style: TextStyle(
                  fontSize: (screenSize.width * 0.045) * widget.scaler,
                  color: widget.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
