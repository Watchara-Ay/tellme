// import 'package:flutter/material.dart';
// import 'package:tellme/searchpage.dart';
// import 'Components/button.dart';

// class Recommendedmenu extends StatefulWidget {
//   final String username;

//   const Recommendedmenu({Key? key, required this.username}) : super(key: key);

//   @override
//   _RecommendedmenuState createState() => _RecommendedmenuState();
// }

// class _RecommendedmenuState extends State<Recommendedmenu> {
//   List<Map<String, dynamic>> mealPatterns = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: SizedBox(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           const Text(
//             'Select menu',
//             textAlign: TextAlign.left,
//             style: TextStyle(
//               fontSize: 36,
//               color: Colors.deepPurple,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(10.0),
//           ),
//           Expanded(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40.0),
//                     topRight: Radius.circular(40.0),
//                   )),
//               child: Column(children: [
//                 SizedBox(
//                   width: 200,
//                   height: 200,
//                   child: Image.asset(
//                     'assets/images/sliced-boiled-chicken.png',
//                   ),
//                 ),
//                 const Text(
//                   "chicken",
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     fontSize: 24,
//                     color: Colors.deepPurple,
//                   ),
//                 ),
//                 SizedBox(
//                   child: ButtonTheme(
//                     height: 70,
//                     child: Container(
//                       padding: EdgeInsets.zero, // ADD THIS LINE
//                       child: SizedBox(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             Container(
//                               margin: const EdgeInsets.all(10),
//                               height: 50.0,
//                               // ignore: deprecated_member_use
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 style: ButtonStyle(
//                                     backgroundColor:
//                                         MaterialStateProperty.all(Colors.black),
//                                     shape: MaterialStateProperty.all<
//                                             RoundedRectangleBorder>(
//                                         RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(18.0),
//                                     ))),
//                                 child: const Text("Back",
//                                     style: TextStyle(fontSize: 15)),
//                               ),
//                             ),
//                             Container(
//                               margin: const EdgeInsets.all(10),
//                               height: 50.0,
//                               // ignore: deprecated_member_use
//                               child: ElevatedButton(
//                                 style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all(Colors.black),
//                                   shape: MaterialStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(18.0),
//                                     ),
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           Searchpage(username: widget.username),
//                                     ),
//                                   );
//                                 },
//                                 child: const Text("Search",
//                                     style: TextStyle(fontSize: 15)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ]),
//             ),
//           ),
//         ],
//       ),
//     )));
//   }
// }
