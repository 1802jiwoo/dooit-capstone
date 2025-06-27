import 'dart:convert';

import 'package:capstone_project_2/common/colors.dart';
import 'package:capstone_project_2/presentantion/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    locale: const Locale('ko', 'KR'),
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ko', 'KR'), // 한글 locale 추가
    ],
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    theme: ThemeData(
      colorSchemeSeed: pointColor,
      useMaterial3: false,
    ),
    home: MainScreen(),
  ));
}
//
// class Name extends StatelessWidget {
//   const Name({super.key});
//
//   final List<String> messages = [];
//   final controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: messages.length,
//         itemBuilder: (context, index) => Padding(
//           padding: const EdgeInsets.all(10),
//           child: Text(messages[index]),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.all(20),
//         color: Colors.black12,
//         child: Row(
//           children: [
//             SizedBox(
//               width: MediaQuery.sizeOf(context).width - 100,
//               child: TextField(
//                 controller: controller,
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 final body = {
//                   'room_id' : 1,
//                   'content' : controller.text,
//                   'sender' : 'user',
//                 };
//                 await _socket.sendText(jsonEncode(body));
//                 controller.clear();
//               },
//               child: Icon(Icons.add),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// message.add(jsonDecode(text)['content'];);
