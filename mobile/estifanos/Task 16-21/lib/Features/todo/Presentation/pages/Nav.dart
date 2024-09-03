// // ignore_for_file: prefer_const_constructors
//
// import 'package:flutter/material.dart';
// import 'package:new_app/Features/todo/Presentation/pages/Search_product.dart';
//
// class Nav extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           UserAccountsDrawerHeader(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                   "images/wave.jpg"
//                 ),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             accountName: Text("Olivia"),
//             accountEmail: Text("olivia@gmail.com"),
//             currentAccountPicture: CircleAvatar(
//               backgroundColor: Colors.red,
//               child: ClipOval(
//                 child: Image.asset(
//                   width: 90,
//                   height: 90,
//                   "images/girl1.jpg",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//
//             )
//           ),
//           ListTile(
//             leading: Icon(Icons.search),
//             title: Text("Search"),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SearchApp()),
//               );
//             }
//           ),
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: Text("Favorite"),
//             onTap: () => null,
//           ),
//
//           ListTile(
//             leading: Icon(Icons.share),
//             title: Text("Share"),
//             onTap: () => null,
//           ),
//           ListTile(
//             leading: Icon(Icons.settings),
//             title: Text("Setting"),
//             onTap: () => null,
//           ),
//           ListTile(
//             leading: Icon(Icons.notifications),
//             title: Text("Notifications"),
//             onTap: () => null,
//           ),
//           ListTile(
//             leading: Icon(Icons.exit_to_app),
//             title: Text("Exit"),
//             onTap: () => null,
//           ),
//         ],
//       ),
//     );
//   }
// }
