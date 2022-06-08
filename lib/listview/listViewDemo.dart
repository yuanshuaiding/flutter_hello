import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        title: Text(
          "ListView",
        ),
      ),
      body: ListView.builder(
        itemCount: 100,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var child = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text("text$index"),
                color: Colors.blue[50],
                width: MediaQuery.of(context).size.width,
              ),
              Divider(
                color: Colors.black26,
                height: 0.5,
              )
            ],
          );
          return GestureDetector(
            child: child,
            onTap: () {
              Fluttertoast.showToast(
                  msg: "$index被点击了",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
          );
        },
      ),
    );
  }
}
