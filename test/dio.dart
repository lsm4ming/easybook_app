import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(connectTimeout: Duration(seconds: 5)));

void getHttp() async {
  dio.get('https://www.baidu.com').then((data) {
    print(data.data);
  }).catchError((err) {
    print('Error occurred: $err');
  });
}

Future<void> fGetHttp() async {
  try {
    final response = await dio.get('https://www.baidu.com');
    print(response.data);
  } catch (err) {
    print('Error occurred: $err');
  }
}

void main() async {
  fGetHttp().then((_) {
    print("end");
  });
}
