// import 'package:flutter/material.dart';
//
// class MyAppBar extends StatelessWidget {
//   MyAppBar({this.title})
//
//   final Widget title = '标题' as Widget;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56.0,
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       decoration: BoxDecoration(color: Colors.blue[500]),
//       child: Row(
//         children: <Widget>[
//           IconButton(
//               icon: Icon(Icons.menu),
//               tooltip: '导航菜单',
//               onPressed: null
//           ),
//           Expanded(child: title),
//           IconButton(
//               icon: Icon(Icons.search),
//               tooltip: '搜索',
//               onPressed: null
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MyScaffold extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Column(
//         children: <Widget>[
//           MyAppBar(
//             title: Text(
//               'Example Title',
//               style:
//                 Theme.of(context).primaryTextTheme.headline6,
//             ),
//           ),
//           Expanded(
//               child: Center(
//                   child: Text('Hello World!')
//                 ),
//           ),
//         ],
//       ),
//     );
//   }
//
// }