void main() async {
  await Future.delayed(const Duration(seconds: 2), () {
    return "hello world!";
  }).then((data) {
    print(data);
  }).catchError((e) {
    print("error " + e);
  });
}
