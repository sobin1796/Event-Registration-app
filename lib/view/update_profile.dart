import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:registration_app/resources/components/color.dart';
import 'package:registration_app/resources/components/commoncomponent.dart';
import 'package:registration_app/resources/components/textStyle.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => __TestPageState();
}

class __TestPageState extends State<UpdateProfile> {
  XFile? pickedFile;
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phonenumberCOntroller = TextEditingController();
  Future<void> selectFile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? result = await picker.pickImage(source: ImageSource.gallery);

    if (result == null) return;

    setState(() {
      pickedFile = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Profile',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: elementcolor,
      ),
      body: Container(
        color: themecolor,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: titleText(name: 'Updates Your Profile')),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: subtext(name: 'Updates your Profile details')),
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
              emailController: _phonenumberCOntroller,
              labeltext: 'Phone number',
              context: context,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: const Color.fromARGB(255, 216, 205, 239),
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: subtext(name: 'update your Profile picture')),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      selectFile();
                    },
                    child: const Text(
                      'select Image :',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: elementcolor,
                  ),
                  height: MediaQuery.of(context).size.height / 35,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    pickedFile != null ? pickedFile!.name : 'No File Selected',
                    style: const TextStyle(color: themecolor),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            botton(
                name: 'Save Changes',
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
