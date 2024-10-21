import 'package:flutter/material.dart';
import 'package:registration_app/resources/components/color.dart';
import 'package:registration_app/resources/components/textStyle.dart';
import 'package:registration_app/view/profilepage.dart';
import 'package:registration_app/view/registration_page.dart';

class User {
  final String eventsname;
  final String dateandtime;
  final String thumbnail;
  final String description;
  final String organizer;

  User(
      {required this.thumbnail,
      required this.dateandtime,
      required this.eventsname,
      required this.description,
      required this.organizer});
}

// ignore: must_be_immutable
class Eventlist extends StatelessWidget {
  Eventlist({super.key});
  List<User> user = [
    User(
      organizer: 'Global Yuth Hub',
      thumbnail:
          'https://www.vcubesoftsolutions.com/wp-content/uploads/2023/11/image.jpg',
      dateandtime: '2024-12-10',
      eventsname: 'Youth empowerment Events',
      description:
          'Jeevan Raithis is free events which is going to be heldthis is free events which is going to be held',
    ),
    User(
      organizer: 'Nec Education society',
      thumbnail:
          'https://www.vcubesoftsolutions.com/wp-content/uploads/2023/11/image.jpg',
      dateandtime: '2024-12-10',
      eventsname: 'Woman Health and Risks ',
      description:
          'Jeevan Raithis is free events which is going to be heldthis is free events which is going to be heldthis is free events which is going to be held',
    ),
    User(
      organizer: 'Global Yuth Hub',
      thumbnail:
          'https://www.excelptp.com/wp-content/uploads/2023/03/Flutter-Development-Course.jpg',
      dateandtime: '2024-11-20',
      eventsname: 'Music Nepal Events',
      description:
          ' o be heldthis is free events which is going to be heldthis is free events which is going to be held',
    ),
    User(
      organizer: 'Shine Education',
      thumbnail:
          'https://www.excelptp.com/wp-content/uploads/2023/03/Flutter-Development-Course.jpg',
      dateandtime: '2024-11-20',
      eventsname: 'Flutter boot camps',
      description: ' this is free events which is going to be held',
    ),
    User(
      organizer: 'Global Yuth Hub',
      thumbnail:
          'https://www.excelptp.com/wp-content/uploads/2023/03/Flutter-Development-Course.jpg',
      dateandtime: '2024-11-20',
      eventsname: 'Flutter boot camps',
      description: ' this is free events which is going to be held',
    ),
  ];
  @override
  Widget build(BuildContext context) {
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
          title: subtitleText(name: 'Events List')),
      body: Container(
          padding: const EdgeInsets.all(9),
          color: themecolor,
          child: ListView.builder(
            itemCount: user.length,
            itemBuilder: ((context, index) {
              final users = user[index];
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
                          users.eventsname,
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
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
                              users.organizer,
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
                              users.dateandtime,
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
                                ' ${users.eventsname}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 159, 202, 245),
                                ),
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Image.network(users.thumbnail),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                55,
                                      ),
                                      const Text(
                                        'Description : ',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 159, 202, 245),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        ' ${users.description}',
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
                                        users.dateandtime,
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
            }),
          )),
    );
  }
}
