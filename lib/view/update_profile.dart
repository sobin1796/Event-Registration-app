import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_app/resources/components/color.dart';
import 'package:registration_app/resources/components/commoncomponent.dart';
import 'package:registration_app/resources/components/textStyle.dart';
import 'package:registration_app/view_model/notifier.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  void validateAndSave(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context, listen: false);
    if (!provider.isValid()) {
      _showSnackbar(context, 'Please fill in all fields correctly.');
      return;
    }

    _showSnackbar(context, 'Profile updated successfully!');
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: Scaffold(
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
          child: Consumer<ProfileProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: titleText(name: 'Update Your Profile')),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: subtext(name: 'Update your profile details')),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 55,
                  ),
                  textboxfield(
                      emailController:
                          TextEditingController(text: provider.name)
                            ..addListener(() {
                              provider.updateName(provider.name);
                            }),
                      labeltext: 'Name',
                      context: context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 55,
                  ),
                  textboxfield(
                      emailController:
                          TextEditingController(text: provider.email)
                            ..addListener(() {
                              provider.updateEmail(provider.email);
                            }),
                      labeltext: 'Email Address',
                      context: context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 55,
                  ),
                  textboxfield(
                    emailController:
                        TextEditingController(text: provider.phoneNumber)
                          ..addListener(() {
                            provider.updatePhoneNumber(provider.phoneNumber);
                          }),
                    labeltext: 'Phone number',
                    context: context,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 45,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: subtext(name: 'Update your Profile picture')),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () => provider.selectFile(
                              context), // Call the provider method directly
                          child: const Text(
                            'Select Image:',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: elementcolor,
                        ),
                        height: MediaQuery.of(context).size.height / 35,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          provider.profileImage != null
                              ? provider.profileImage!.name
                              : 'No File Selected',
                          style: const TextStyle(color: themecolor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  botton(
                      onPressed: () => validateAndSave(context),
                      name: 'Save Changes',
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: MediaQuery.of(context).size.width / 8),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
