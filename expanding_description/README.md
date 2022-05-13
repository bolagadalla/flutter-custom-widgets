# Expanding Description Widget

A widget that will take in a `description` text and the max amount of characters to show, and it will display that amount of characters onto the screen with a `More` text button that when pressed will expand the widget that contains the text to display the full description with the word `Less` at the end which when pressed it will contract the widget back to a smaller size to show only the max amount of characters.

# Properties

* `required String description` - The full text that will be displayed partially until the `More` button is pressed.
* `required int maxCharBeforeBreak` - The max amount of characters to display before showing `... More`.
* `String expandText = 'More'` - The text at the end that is when pressed it will expand the widget to show the full description. Defaulted as `More`.
* `String contractText = 'Less'` - The text at the end taht is when pressed it will contract the widget to show the max amount of charecter of the description. Defaulted as `Less`.
* `TextStyle textSpanStyle = const TextStyle(color: Colors.black)` - The style which will be used to style the `TextSpan`s of the widget which contains the first half of the description and the second half of the description. Defaulted to a simple `TextStyle` where the color is `Black`.
* `bool isAnimated = true` - To determine if the widget should be animated or not.
* `AnimatedSize animation = const AnimatedSize(duration: Duration(milliseconds: 400), curve: Curves.fastLinearToSlowEaseIn)` - This is the `AnimatedSize` which is used to animate the widget if the `isAnimated` property is true.

# How it looks

<p align="center">
  <img src="expanding_description.gif" width="350" title="App Screenshot">
</p>
