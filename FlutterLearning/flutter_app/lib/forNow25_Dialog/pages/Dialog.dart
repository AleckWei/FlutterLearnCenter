import 'package:flutter/material.dart';

// import 'package:toast/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  _alertDialog() async {
    var res = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('标题'),
            content: Text('你确定？'),
            actions: [
              FlatButton(
                  onPressed: () {
                    // print('取消');
                    Navigator.pop(context, 'Cancel');
                  },
                  child: Text('取消')),
              FlatButton(
                  onPressed: () {
                    // print('确定');
                    Navigator.pop(context, 'ok');
                  },
                  child: Text('确定')),
            ],
          );
        });
    print(res);
  }

  _simpleDialog() async {
    var res = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('选择内容'),
            children: [
              SimpleDialogOption(
                child: Text('Option A'),
                onPressed: () {
                  // setState(() {
                  //   res = 'Option A';
                  // });
                  Navigator.of(context).pop('Option A');
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text('Option B'),
                onPressed: () {
                  // setState(() {
                  //   res = 'Option B';
                  // });
                  Navigator.of(context).pop('Option B');
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text('Option C'),
                onPressed: () {
                  // setState(() {
                  //   res = 'Option C';
                  // });
                  Navigator.of(context).pop('Option C');
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text('Option D'),
                onPressed: () {
                  // setState(() {
                  //   res = 'Option D';
                  // });
                  Navigator.of(context).pop('Option D');
                },
              ),
            ],
          );
        });
    print(res);
  }

  _modelBottomSheet() async {
    var res = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: [
                ListTile(
                  title: Text('分享 A'),
                  onTap: () {
                    Navigator.of(context).pop('分享 A');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('分享 B'),
                  onTap: () {
                    Navigator.of(context).pop('分享 B');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('分享 C'),
                  onTap: () {
                    Navigator.of(context).pop('分享 C');
                  },
                ),
              ],
            ),
          );
        });
    print(res);
  }

  _toast() {
    Fluttertoast.showToast(
      msg: '这里是提示信息',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      // 这个只有在ios和web上才有效果，在android上是没有效果的
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                child: Text('alert弹出框 - AlertDialog'), onPressed: _alertDialog),
            SizedBox(height: 20),
            RaisedButton(
                child: Text('select弹出框 - SimpleDialog'),
                onPressed: _simpleDialog),
            SizedBox(height: 20),
            RaisedButton(
                child: Text('action底部弹出框 - showModalBottomDialog'),
                onPressed: _modelBottomSheet),
            SizedBox(height: 20),
            RaisedButton(
                child: Text('toast - flutter toast第三方库'), onPressed: _toast),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
