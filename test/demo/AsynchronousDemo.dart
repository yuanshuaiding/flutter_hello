Future<String> getUserOrders() async {
  var order = await featchUserOrder();
  return "User order is:${order}";
}

Future<String> featchUserOrder() {
  return Future.delayed(const Duration(seconds: 1), () {
    return "many eggs";
  });
}

main() async {
  print("开始获取用户订单...");
  var future = await getUserOrders();
  print(future);
  print("获取用户订单结束...");
}
