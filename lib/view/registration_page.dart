import 'package:flutter/material.dart';
import 'package:registration_app/resources/components/color.dart';
import 'package:registration_app/resources/components/commoncomponent.dart';
import 'package:registration_app/resources/components/textStyle.dart';

class Testpage extends StatefulWidget {
  const Testpage({super.key});

  @override
  State<Testpage> createState() => __TestPageState();
}

class __TestPageState extends State<Testpage> {
  DateTime? selectedDate;
  String? selectedValue;
  final List<String> events = ['Event 1', 'Event 2', 'Event 3'];
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  // bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: themecolor,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: titleText(name: 'Event Registration')),

            const SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: subtext(name: 'Plaese fill below details .')),
            SizedBox(
              height: MediaQuery.of(context).size.height / 55,
            ),
            textboxfield(
                emailController: _nameController,
                labeltext: 'Name',
                context: context),
            SizedBox(
              height: MediaQuery.of(context).size.height / 55,
            ),
            textboxfield(
                emailController: _emailController,
                labeltext: 'Email Address',
                context: context),
            SizedBox(
              height: MediaQuery.of(context).size.height / 55,
            ),
            textboxfield(
              emailController: _passwordController,
              labeltext: 'password',
              context: context,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: const Color.fromARGB(255, 65, 60, 75),
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 55,
            ),
            // TextFormField(
            //   controller: _passwordController,
            //   decoration: InputDecoration(
            //     border: const UnderlineInputBorder(),
            //     labelText: 'Password',
            //     suffixIcon: IconButton(
            //       icon: Icon(
            //         _obscureText ? Icons.visibility : Icons.visibility_off,
            //         color: const Color.fromARGB(255, 65, 60, 75),
            //       ),
            //       onPressed: () {
            //         setState(() {
            //           _obscureText = !_obscureText;
            //         });
            //       },
            //     ),
            //   ),
            //   style: const TextStyle(color: Colors.white),
            // ),
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: subtext(name: 'Select Events and Date')),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 55,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    flex: 1,
                    child: DropdownButton<String>(
                      hint: subtext(name: 'select event'),
                      value: selectedValue,
                      items:
                          events.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newvalue) {
                        setState(() {
                          selectedValue = newvalue;
                        });
                      },
                    )),
                Flexible(
                  flex: 1,
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.calendar_today,
                        color: elementcolor,
                      ),
                      hintText: selectedDate == null
                          ? 'Select Date'
                          : selectedDate.toString().split(' ')[0],
                    ),
                    onTap: () => _pickDate(context),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 55,
            ),

            Align(
                alignment: Alignment.centerLeft,
                child: subtext(name: 'Type your comments below.')),
            SizedBox(
              height: MediaQuery.of(context).size.height / 55,
            ),
            TextField(
              controller: _commentController,
              maxLines: 4,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 159, 161, 188),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'write comments...',
              ),
              style: const TextStyle(
                  color: elementcolor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            botton(
                name: 'Register',
                width: MediaQuery.of(context).size.width / 1.4,
                height: MediaQuery.of(context).size.width / 8),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
