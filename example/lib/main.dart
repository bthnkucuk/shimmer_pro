import 'package:flutter/material.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer Pro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Shimmer Pro'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isThemeDark = true;
  late Color bgColor;
  late ShimmerProLight shimmerlight;
  @override
  void initState() {
    super.initState();
    _themeMode();
  }

  void _themeMode() {
    isThemeDark = !isThemeDark;
    if (isThemeDark) {
      setState(() {
        bgColor = const Color.fromARGB(255, 50, 50, 50);
        shimmerlight = ShimmerProLight.lighter;
      });
    } else {
      setState(() {
        bgColor = const Color.fromARGB(255, 240, 240, 240);
        shimmerlight = ShimmerProLight.darker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            ShimmerPro.text(
              light: shimmerlight,
              width: 450,
              scaffoldBackgroundColor: bgColor,
            ),
            ShimmerPro.generated(
                light: shimmerlight,
                scaffoldBackgroundColor: bgColor,
                child: Row(
                  children: [
                    ShimmerPro.sized(
                      light: shimmerlight,
                      scaffoldBackgroundColor: bgColor,
                      height: 100,
                      width: 100,
                      borderRadius: 50,
                    ),
                    ShimmerPro.text(
                      light: shimmerlight,
                      scaffoldBackgroundColor: bgColor,
                      width: 270,
                    )
                  ],
                )),
            ShimmerPro.generated(
                light: shimmerlight,
                scaffoldBackgroundColor: bgColor,
                child: Row(
                  children: [
                    ShimmerPro.sized(
                      light: shimmerlight,
                      scaffoldBackgroundColor: bgColor,
                      height: 100,
                      width: 100,
                    ),
                    ShimmerPro.sized(
                      light: shimmerlight,
                      scaffoldBackgroundColor: bgColor,
                      height: 100,
                      width: 100,
                    ),
                    ShimmerPro.text(
                      light: shimmerlight,
                      scaffoldBackgroundColor: bgColor,
                      width: 150,
                    )
                  ],
                )),
            ShimmerPro.generated(
                light: shimmerlight,
                width: 200,
                scaffoldBackgroundColor: bgColor,
                child: Column(
                  children: [
                    ShimmerPro.sized(
                      light: shimmerlight,
                      scaffoldBackgroundColor: bgColor,
                      height: 100,
                      width: 100,
                      borderRadius: 50,
                    ),
                    ShimmerPro.text(
                        light: shimmerlight,
                        maxLine: 1,
                        scaffoldBackgroundColor: bgColor,
                        width: 200)
                  ],
                )),
            ShimmerPro.text(
              light: shimmerlight,
              maxLine: 5,
              width: 450,
              scaffoldBackgroundColor: bgColor,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _themeMode,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
