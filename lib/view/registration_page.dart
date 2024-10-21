import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_app/resources/components/color.dart';
import 'package:registration_app/resources/components/commoncomponent.dart';
import 'package:registration_app/resources/components/textStyle.dart';
import 'package:registration_app/view_model/notifier.dart';

class Eventregistration extends StatelessWidget {
  const Eventregistration({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegistrationProvider(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: elementcolor,
          title: const Text(
            'Registration',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          color: themecolor,
          padding: const EdgeInsets.all(30),
          child: Consumer<RegistrationProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: titleText(name: 'Event Registration'),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: subtext(name: 'Please fill below details.'),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  textboxfield(
                    emailController: provider.nameController,
                    labeltext: 'Name',
                    context: context,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  textboxfield(
                    emailController: provider.emailController,
                    labeltext: 'Email Address',
                    context: context,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  textboxfield(
                    emailController: provider.passwordController,
                    labeltext: 'Password',
                    context: context,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: subtext(name: 'Select Events and Date:'),
                  ),
                  const Divider(thickness: 2, color: elementcolor),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 1,
                        child: DropdownButton<String>(
                          hint: subtext(name: 'Select Event'),
                          value: provider.selectedEvent,
                          items: ['Event 1', 'Event 2', 'Event 3']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            provider.updateSelectedEvent(newValue);
                          },
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.calendar_today,
                              color: elementcolor,
                            ),
                            hintText: provider.selectedDate == null
                                ? 'Select Date'
                                : provider.selectedDate
                                    .toString()
                                    .split(' ')[0],
                          ),
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate:
                                  provider.selectedDate ?? DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );

                            if (picked != null) {
                              provider.updateSelectedDate(picked);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: subtext(name: 'Type your comments below:'),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  TextField(
                    controller: provider.commentsController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 159, 161, 188),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Write comments...',
                    ),
                    style: const TextStyle(
                      color: elementcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  botton(
                    onPressed: () {
                      if (provider.name.isEmpty) {
                        _showSnackBar(context, 'Please enter your name.');
                      } else if (!provider.email.contains('@')) {
                        _showSnackBar(
                            context, 'Please enter a valid email address.');
                      } else if (provider.password.length < 6) {
                        _showSnackBar(context,
                            'Password must be at least 6 characters long.');
                      } else if (provider.selectedEvent == null) {
                        _showSnackBar(context, 'Please select an event.');
                      } else if (provider.selectedDate == null) {
                        _showSnackBar(context, 'Please select a date.');
                      } else if (provider.comments.isEmpty) {
                        _showSnackBar(context, 'Please add your comments.');
                      } else {
                        _showSnackBar(context, 'Registration Successful');
                      }
                    },
                    name: 'Register',
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: MediaQuery.of(context).size.width / 8,
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
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
