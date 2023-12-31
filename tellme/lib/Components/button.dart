// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

// class ClickableContainer extends StatelessWidget {
//   // ignore: use_key_in_widget_constructors
//   const ClickableContainer();

//   get food => null;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: ButtonTheme(
//         height: 70,
//         child: Container(
//           padding: EdgeInsets.zero, // ADD THIS LINE
//           child: SizedBox(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   margin: const EdgeInsets.all(10),
//                   width: MediaQuery.of(context).size.width / 1.05,
//                   height: 100,
//                   // ignore: deprecated_member_use
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Menudetail(
//                                   foods: food,
//                                 )),
//                       );
//                     },
//                     style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all(Colors.transparent),
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(18.0),
//                         ))),
//                     child: const Text(
//                         "Name       Ckickenwings\nCalories    199  cals\nDistance   199  km\n",
//                         style: TextStyle(fontSize: 15)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class backbutton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const backbutton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ButtonTheme(
        height: 70,
        child: Container(
          padding: EdgeInsets.zero, // ADD THIS LINE
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 50.0,
                  // ignore: deprecated_member_use
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 181, 255, 235)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Back", style: TextStyle(fontSize: 15)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
