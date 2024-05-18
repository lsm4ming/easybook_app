import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('你好Flutter'),
      ),
      body: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.red, // 背景颜色
            border: Border.all(color: Colors.black, width: 2), // 边框
            borderRadius: BorderRadius.circular(10) // 配置圆角
            ),
        child: const Text(
          '你好',
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
      // child: Text('自定义组件', style: TextStyle(fontSize: 40, color: Colors.red),),
    );
  }
}
