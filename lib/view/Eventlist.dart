import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_app/resources/components/color.dart';
import 'package:registration_app/resources/components/textStyle.dart';
import 'package:registration_app/view_model/notifier.dart';

import 'profilepage.dart';
import 'registration_page.dart';

class Eventlist extends StatelessWidget {
  Eventlist({super.key});

  @override
  Widget build(BuildContext context) {
    final eventModel = Provider.of<EventModel>(context);

    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserProfile()));
                },
                icon: const Icon(Icons.person))
          ],
          iconTheme: const IconThemeData(color: themecolor),
          toolbarHeight: 80,
          shadowColor: Colors.white,
          backgroundColor: elementcolor,
          title: subtitleText(name: 'Upcoming Events')),
      body: Container(
          padding: const EdgeInsets.all(9),
          color: themecolor,
          child: ListView.builder(
            itemCount: eventModel.users.length, // Use the model's user list
            itemBuilder: (context, index) {
              final user = eventModel.users[index];
              return Card(
                color: elementcolor,
                semanticContainer: true,
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 6.5,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    title: Row(
                      children: [
                        const Text(
                          'Event:  ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 159, 202, 245),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          user.eventsname,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text(
                              'Organized by:  ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 159, 202, 245),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              user.organizer,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 176, 176, 175)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Date & Time : ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 159, 202, 245),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              user.dateandtime,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 42, 252, 10),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.height / 15,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const Eventregistration(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(20, 25),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 46, 93, 114),
                              ),
                              child: const Text(
                                'Register',
                                style: TextStyle(color: themecolor),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: elementcolor,
                            title: Align(
                              alignment: Alignment.center,
                              child: Text(
                                ' ${user.eventsname}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 159, 202, 245),
                                ),
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Image.network(user.thumbnail),
                                  Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      const Text(
                                        'Description : ',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 159, 202, 245),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        ' ${user.description}',
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Text(
                                        'Date & Time : ',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 159, 202, 245),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        user.dateandtime,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 253, 253, 21),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text(
                                  'Close',
                                  style: TextStyle(color: themecolor),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            },
          )),
    );
  }
}
