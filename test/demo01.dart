void main() {
  Object t;
  t = "hello";
  print(t);
  t = 100;
  print(t);

  dynamic c;
  c = 100;
  print(c);

  /**
   * dynamic和Object的区别
   *
   * Object 和 dynamic 都使得我们可以接收任意类型的参数
   * Object类型系统会保证其类型安全
   * dynamic则不会有类型检查
   */
  print(t.hashCode);
  print(c.hashCode);
  print(t.runtimeType);
  print(c.runtimeType);
}
