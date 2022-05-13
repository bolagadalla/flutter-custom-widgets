import 'package:flutter/material.dart';
import './expanding_description.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: const [
              SizedBox(
                height: 50,
              ),
              ExpandingDescription(
                  maxCharBeforeBreak: 250,
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pharetra vel turpis nunc eget lorem. Facilisis gravida neque convallis a cras semper auctor. Molestie nunc non blandit massa enim. Mauris nunc congue nisi vitae suscipit tellus. Ultricies tristique nulla aliquet enim tortor at auctor urna. Diam vulputate ut pharetra sit amet aliquam id diam. Dolor sed viverra ipsum nunc aliquet. Urna nec tincidunt praesent semper feugiat. Sed enim ut sem viverra. Enim tortor at auctor urna nunc id cursus metus. In ornare quam viverra orci sagittis. Felis eget velit aliquet sagittis. Rutrum quisque non tellus orci ac auctor augue mauris. Volutpat commodo sed egestas egestas. Sed odio morbi quis commodo odio aenean. Pulvinar mattis nunc sed blandit libero volutpat. Ipsum a arcu cursus vitae congue mauris rhoncus aenean. Massa placerat duis ultricies lacus sed.'),
            ],
          ),
        ),
      ),
    );
  }
}
