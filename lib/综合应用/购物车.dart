import 'package:flutter/material.dart';

///商品类
class Product {
  Product(this.name);

  final String name;
}

/// 购物车单条点击事件
typedef ShoppingListItemOnTap = Function(Product product, bool inCart);

///单条购物车列表
class ShoppingListItem extends StatelessWidget {
  ShoppingListItem(
      {required this.product, required this.inCart, required this.onTap})
      : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final ShoppingListItemOnTap onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(product, inCart);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: _getBgColor(context),
            child: Text(product.name[0]),
            radius: 20,
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Text(product.name, style: _getStyle(context)),
          )),
        ],
      ),
    );
  }

  _getBgColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  _getStyle(BuildContext context) {
    if (!inCart) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }
}

///购物车列表
class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.productList, Key? key}) : super(key: key);

  final List<Product> productList;

  @override
  ShoppingListState createState() => ShoppingListState();
}

class ShoppingListState extends State<ShoppingList> {
  List<Product> _list = List.empty(growable: true);

  _changeCart(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _list.remove(product);
      } else {
        _list.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.productList.map((product) {
        var inCart = _list.contains(product);
        return ShoppingListItem(
            product: product, inCart: inCart, onTap: _changeCart);
      }).toList(),
    );
  }
}

//用户界面

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: ShoppingList(
        key: ObjectKey(key),
        productList: [
          Product("egg"),
          Product("fish"),
          Product("rice"),
        ],
      ),
    );
  }
}
