import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 5)));

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter测试',
      initialRoute: "/",
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        "/": (context) => const HomePage(title: '首页'),
        "new_page": (context) => const NewRoute(),
      },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String? routeName = settings.name;
          print('routeName=$routeName');
          return const HomePage(title: '');
        });
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _count = 0;

  void incCount() {
    setState(() {
      nouns.take(50).forEach(print);
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('你点击了按钮次数:'),
            Text(
              '$_count',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const NewRoute();
                  }));
                },
                child: const Text(
                  '跳转新页面',
                )),
            ElevatedButton(
              onPressed: () async {
                var result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const TipRoute(text: "我是提示，hello");
                }));
                print("result=$result");
              },
              child: const Text('打开提示页面'),
            ),
            ElevatedButton(
              onPressed: () async {
                final response = await dio.get('https://www.baidu.com');
                var statusMessage = response.statusMessage;
                print("返回code:$statusMessage");
                print(response.data);
              },
              child: const Text('发起网络请求'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incCount,
        tooltip: "自增",
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  const NewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("新的页面")),
        body: const Center(
          child: Column(
            children: [
              Text("这是一个新的页面"),
              Image(image: AssetImage('lib/asset/image/1.jpeg')),
              SizedBox(height: 20), // 添加间距
              // ElevatedButton(
              //   onPressed: () {
              //     print('hello');
              //   },
              //   child: Text('点击打印 Hello'),
              // )
            ],
          )
          // child: Text("这是一个新的页面"),
        ));
  }
}

class TipRoute extends StatelessWidget {
  const TipRoute({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("提示"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: [
              Text(text),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: const Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
