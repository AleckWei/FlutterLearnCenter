import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class MyContainer extends StatelessWidget {
  double height = 100.0;
  double width = 100.0;
  String _uri = '';
  Radius topLeft, topRight, bottomLeft, bottomRight;

  MyContainer(this._uri, {this.height, this.width});

  MyContainer.only(this._uri,
      {this.topLeft = Radius.zero,
        this.topRight = Radius.zero,
        this.bottomRight = Radius.zero,
        this.bottomLeft = Radius.zero,
        this.height,
        this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: this.topLeft,
              bottomLeft: this.bottomLeft,
              topRight: this.topRight,
              bottomRight: this.bottomRight),
          image: DecorationImage(
            image: NetworkImage(this._uri),
            fit: BoxFit.cover,
          )),
    );
  }
}