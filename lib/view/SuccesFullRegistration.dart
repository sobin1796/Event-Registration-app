import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_app/resources/components/color.dart';
import 'package:registration_app/resources/components/commoncomponent.dart';
import 'package:registration_app/resources/components/textStyle.dart';
import 'package:registration_app/view/Eventlist.dart';
import 'package:registration_app/view_model/notifier.dart';

class Succesfullregistration extends StatelessWidget {
  const Succesfullregistration({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: elementcolor,
        title: const Text(
          'Registration Complete',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: themecolor,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Event Registration Completed',
                style: TextStyle(
                  color: Color.fromARGB(255, 44, 78, 94),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: subtext(name: 'Event date details.'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 55),
            Container(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                border: Border.all(color: elementcolor),
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 159, 161, 188),
              ),
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  const Text(
                    "Event Name: ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 29, 32, 74),
                    ),
                  ),
                  Text(
                    provider.selectedEvent ?? "Global Youth Cloub",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 1, 67, 85),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                border: Border.all(color: elementcolor),
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 159, 161, 188),
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Text(
                    "Date: ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    provider.selectedDate == null
                        ? "2024-10-23"
                        : provider.selectedDate!
                            .toLocal()
                            .toString()
                            .split(' ')[0],
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 2, color: elementcolor),
            SizedBox(height: MediaQuery.of(context).size.height / 55),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                botton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Eventlist()),
                    );
                  },
                  name: 'Events',
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 8,
                ),
                botton(
                  onPressed: () {
                    _showSnackBar(context, 'Registration Successful');
                  },
                  name: 'Done',
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 8,
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 47, 98, 134),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.fixed,
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
