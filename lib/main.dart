import 'package:flutter/material.dart';
import 'dynamiclist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _appState();
}

class _appState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff244D61),
            centerTitle: true,
            title: Text(
              'Dynamic List',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            elevation: 5,
            shadowColor: Colors.grey,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                  children: List.generate(
                      dynamicfun.length, (index) => list(index + 1))),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    count++;
                    dynamicfun.add(count);
                  });
                },
                child: Icon(Icons.add),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    dynamicfun.remove(count);
                    count--;
                  });
                },
                child: Text(
                  '-',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

int count = 1;

Widget list(int? number) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    height: 100,
    width: 350,
    decoration: BoxDecoration(
      color: (number! % 2 == 0) ? Color(0xff5689C0) : Color(0xff75E2FF),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
        child: Text(
          '$number',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )),
  );
}