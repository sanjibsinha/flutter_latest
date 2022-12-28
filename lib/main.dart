import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Text Demo",
      theme: _appTheme,
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

final _appTheme = ThemeData(
  primarySwatch: Colors.amber,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 34,
      color: Colors.black,
    ),
  ),
);

class Home extends StatefulWidget {
  final double height;
  final double width;

  const Home({Key? key, this.height = 200, this.width = 200}) : super(key: key);

  @override
  createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation gradientPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(() {
        setState(() {});
      });

    _controller.repeat();
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(gradientPosition.value, 0),
                  // ignore: prefer_const_constructors
                  end: Alignment(-1, 0),
                  colors: const [
                Colors.black12,
                Colors.black26,
                Colors.black12
              ])),
        ),
      ),
    );
  }
}
