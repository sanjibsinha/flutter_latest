import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: "Go router",
      theme: _appTheme,
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

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const FirstPage(),
    ),
    GoRoute(
      path: "/secondpage",
      builder: (context, state) => const SecondPage(),
    )
  ],
);

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'First Page',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'This is First Page:',
              style: TextStyle(
                fontSize: 50.00,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () => context.go("/secondpage"),
              child: const Text("Go to Second page"),
            ),
          ],
        ),
      ),
    );
  }
}

// pushing to new branch
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Second Page',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'This is Second Page:',
              style: TextStyle(
                fontSize: 50.00,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.00),
              width: 150.00,
              child: ElevatedButton(
                onPressed: () => context.go("/"),
                child: const Text("Go to First page"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
