import 'package:flutter/material.dart';
import 'package:flutter_ui_class/providers/task_management_provider.dart';
import 'package:flutter_ui_class/screens/UI_page.dart';
import 'package:provider/provider.dart';

// This was the original entry point app
class FlutterUIApp extends StatelessWidget {
  const FlutterUIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> TaskManagementProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomePage(title: 'FLUTTER UI DEMO'),
      ),
    );
  }
}

class HomePage extends StatefulWidget { 
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    _counter++;
    print('Counter value: $_counter');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purpleAccent,
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),

      body: Center(
        child: Container(
          height: 190,
          width: 350,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: .5),
            color: Colors.grey.withAlpha(50),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              const Text('Counter app', style: TextStyle(fontSize: 24)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text('The current value is', style: TextStyle(fontSize: 15)),

                  const SizedBox(width: 5),

                  Text(
                    _counter.toString(),
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w900,
                      color: Colors.purpleAccent,
                    ),
                  ),

                  const SizedBox(width: 5),

                  const Icon(Icons.timelapse, color: Colors.purpleAccent, size: 30),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _incrementCounter,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('Increment Counter'),
                  ),

                  const SizedBox(width: 20),

                  IconButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const UiPage(),)
                      );
                    },
                    color: Colors.purpleAccent,
                    iconSize: 40,
                    icon: const Icon(Icons.arrow_circle_right),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
