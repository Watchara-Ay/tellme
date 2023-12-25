import 'dart:async';
import 'package:flutter/material.dart';
import 'Components/Button.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class Monthpage extends StatefulWidget {
  const Monthpage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Monthpage> createState() => _Monthpage();
}

class _Monthpage extends State<Monthpage> {
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2023, 10),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Month',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 36,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
            ),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      )),
                  child: Column(children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(255, 0, 0, 1),
                        ),
                      ),
                      onPressed: () {
                        showMonthPicker(
                          context: context,
                          initialDate: DateTime.now(),
                        ).then((date) {
                          if (date != null) {
                            setState(() {
                              selectedDate = date;
                            });
                          }
                        });
                      },
                      child: Text("${selectedDate.toLocal()}".split(' ')[0]),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const backbutton(),
                  ])),
            )
          ],
        ),
      )),
    );
  }
}
