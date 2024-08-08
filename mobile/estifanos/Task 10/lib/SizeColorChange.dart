// import 'package:flutter/material.dart';
//
// class TextColorChangeExample extends StatefulWidget {
//   @override
//   _TextColorChangeExampleState createState() => _TextColorChangeExampleState();
// }
//
// class _TextColorChangeExampleState extends State<TextColorChangeExample> {
//   Color _textColor = Colors.black;
//
//   void _changeTextColor() {
//     setState(() {
//       _textColor = _textColor == Colors.black ? Colors.red : Colors.black;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Tap to Change Text Color"),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onTap: _changeTextColor,
//           child: Text(
//             'Tap me!',
//             style: TextStyle(color: _textColor, fontSize: 24),
//           ),
//         ),
//       ),
//     );
//   }
// }
