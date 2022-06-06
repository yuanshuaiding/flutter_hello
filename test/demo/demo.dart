//抽象出产品和购物车类里的公共属性(或方法)
class Meta {
  //属性(成员变量)
  String name;
  double price;

  Meta(this.name, this.price);
}

class Product extends Meta {
  //构造函数(此处显示指定price类型是double,防止编译器推断类型错误)
  Product(name, double price) : super(name, price);

  // 重载+操作符,直接可以把多个产品相加
  Product operator +(Product product) =>
      Product(name + product.name, price + product.price);
}

class ShoppingCart extends Meta {
  String code;
  DateTime date;
  List<Product>? products;

  ShoppingCart(name)
      : code = "0",
        date = DateTime.now(),
        super(name, 0);

  /*
  //使用递归获取价格总和
  double get price {
    var total = 0.0;
    for (var value in products) {
      total += value.price;
    }
    return total;
  }*/

  //重写属性price的get方法,使用组合的方式获取价格(匿名函数)
  double get price => (products?.reduce((p1, p2) => p1 + p2).price) ?? 0;

  String getInfo() {
    return '''
    购物车信息:
    -----------------------------
      用户名: $name 
      优惠码: $code 
      总价: $price 
      日期:${date.toString()} 
    -----------------------------
    ''';
  }
}

main() {
  var cart = ShoppingCart("张三");
  cart.products = [Product("苹果", 8), Product("香蕉", 5)];
  print(cart.getInfo());
}
