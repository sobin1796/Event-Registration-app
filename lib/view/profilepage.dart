import 'package:flutter/material.dart';
import 'package:registration_app/resources/components/color.dart';
import 'package:registration_app/resources/components/textStyle.dart';
import 'package:registration_app/view/update_profile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _AcountState();
}

class _AcountState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Your Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: elementcolor,
        iconTheme: const IconThemeData(color: themecolor),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        color: themecolor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                  child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 55,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 190,
                    width: 370,
                    decoration: BoxDecoration(
                        color: elementcolor,
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 55,
                                ),
                                subtitleText(name: 'Sobin Rai'),
                                const Text(
                                  'sobin@gmail.com',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color:
                                          Color.fromARGB(255, 137, 150, 190)),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 55,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          size: 40,
                                          Icons.person,
                                          color: Color.fromARGB(
                                              255, 173, 178, 209),
                                        ),
                                        Text(
                                          'Participant',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                  255, 215, 191, 11)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // 130.widthBox,
                            Column(children: [
                              Container(
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 249, 249, 249)
                                          .withOpacity(0.2),
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    'https://weseedchange.org/wp-content/uploads/2019/10/Nepal-organic-farmer-Jit-Bahadur-Singar.jpg',
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 55,
                              ),
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 55,
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: elementcolor,
                    endIndent: 20,
                    indent: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 55,
                  ),
                  ListView(
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: elementcolor,
                        ),
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: const Icon(
                            Icons.edit,
                            color: themecolor,
                            size: 30,
                          ),
                          title: const Text(
                            'Update Profile',
                            style: TextStyle(color: themecolor),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UpdateProfile()));
                              },
                              icon: const Icon(
                                Icons.navigate_next,
                                color: themecolor,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 55,
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: elementcolor,
                        ),
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: const Icon(
                            Icons.event_available,
                            color: themecolor,
                            size: 40,
                          ),
                          title: const Text(
                            'Your Events',
                            style: TextStyle(color: themecolor),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.navigate_next,
                                color: themecolor,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 55,
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: elementcolor,
                        ),
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: const Icon(
                            Icons.assessment,
                            color: themecolor,
                            size: 40,
                          ),
                          title: const Text(
                            'Up coming Events',
                            style: TextStyle(color: themecolor),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.navigate_next,
                                color: themecolor,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 55,
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: elementcolor,
                        ),
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: const Icon(
                            Icons.settings,
                            color: themecolor,
                            size: 40,
                          ),
                          title: const Text(
                            'Setting & Privacy',
                            style: TextStyle(color: themecolor),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.navigate_next,
                                color: themecolor,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 55,
                      ),
                      Container(
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: elementcolor,
                        ),
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: const Icon(
                            Icons.inbox,
                            color: themecolor,
                            size: 40,
                          ),
                          title: const Text(
                            'About us',
                            style: TextStyle(color: themecolor),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              autofocus: true,
                              icon: const Icon(
                                Icons.navigate_next,
                                color: themecolor,
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
