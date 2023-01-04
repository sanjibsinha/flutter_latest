import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lazy Load Demonstration',
      theme: _appTheme,
      home: const MyHomePage(title: 'Lazy Load Demonstration'),
    );
  }
}

final _appTheme = ThemeData(
  primarySwatch: Colors.amber,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 40,
      color: Colors.black,
    ),
  ),
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> verticalData = [];
  List<int> horizontalData = [];

  final int increment = 10;

  bool isLoadingVertical = false;
  bool isLoadingHorizontal = false;

  @override
  void initState() {
    _loadMoreVertical();
    _loadMoreHorizontal();
    super.initState();
  }

  Future _loadMoreVertical() async {
    setState(() {
      isLoadingVertical = true;
    });

    // Add in an artificial delay
    await Future.delayed(const Duration(seconds: 2));

    verticalData.addAll(
        List.generate(increment, (index) => verticalData.length + index));

    setState(() {
      isLoadingVertical = false;
    });
  }

  Future _loadMoreHorizontal() async {
    setState(() {
      isLoadingHorizontal = true;
    });

    // Add in an artificial delay
    await Future.delayed(const Duration(seconds: 2));

    horizontalData.addAll(
        List.generate(increment, (index) => horizontalData.length + index));

    setState(() {
      isLoadingHorizontal = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LazyLoadScrollView(
        isLoading: isLoadingVertical,
        onEndOfPage: () => _loadMoreVertical(),
        child: Scrollbar(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'A Nested horizontal ListView',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 200,
                child: LazyLoadScrollView(
                  isLoading: isLoadingHorizontal,
                  scrollDirection: Axis.horizontal,
                  onEndOfPage: () => _loadMoreHorizontal(),
                  child: Scrollbar(
                    child: ListView.builder(
                        itemCount: horizontalData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, position) {
                          return DemoItem(position);
                        }),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'A Vertical ListView',
                  textAlign: TextAlign.center,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: verticalData.length,
                itemBuilder: (context, position) {
                  return DemoItem(position);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DemoItem extends StatelessWidget {
  final int position;

  const DemoItem(
    this.position, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.blue,
                    height: 40.0,
                    width: 40.0,
                  ),
                  const SizedBox(width: 8.0),
                  Text("Item $position"),
                ],
              ),
              const Text(
                  'On a stormy night, the wind howls through the streets, whipping tree branches and trash cans around. The sky is dark and foreboding, with lightning illuminating the clouds from within. Rain pounds against windows and roofs, creating a cacophony of sound. The air is heavy with the smell of ozone and wet pavement. Inside, people huddle under blankets, listening to the storm rage outside. Some curl up with a good book, while others sit by the fireplace and watch the lightning flash through the windows. The power flickers on and off, causing shadows to dance across the walls.'),
            ],
          ),
        ),
      ),
    );
  }
}
