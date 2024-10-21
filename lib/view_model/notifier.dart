import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationProvider extends ChangeNotifier {
  String _name = '';
  String _email = '';
  String _password = '';
  String _comments = '';
  String? _selectedEvent;
  DateTime? _selectedDate;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();

  RegistrationProvider() {
    nameController.addListener(() {
      _name = nameController.text;
      notifyListeners();
    });
    emailController.addListener(() {
      _email = emailController.text;
      notifyListeners();
    });
    passwordController.addListener(() {
      _password = passwordController.text;
      notifyListeners();
    });
    commentsController.addListener(() {
      _comments = commentsController.text;
      notifyListeners();
    });
  }

  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get comments => _comments;
  String? get selectedEvent => _selectedEvent;
  DateTime? get selectedDate => _selectedDate;

  void updateSelectedEvent(String? event) {
    _selectedEvent = event;
    notifyListeners();
  }

  void updateSelectedDate(DateTime? date) {
    _selectedDate = date;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    commentsController.dispose();
    super.dispose();
  }
}

class ProfileProvider with ChangeNotifier {
  String _name = '';
  String _email = '';
  String _phoneNumber = '';
  XFile? _profileImage;

  String get name => _name;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  XFile? get profileImage => _profileImage;

  void updateName(String name) {
    _name = name;
    notifyListeners();
  }

  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void updatePhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void updateProfileImage(XFile? image) {
    _profileImage = image;
    notifyListeners();
  }

  Future<void> selectFile(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? result = await picker.pickImage(source: ImageSource.gallery);

    if (result == null) return;

    updateProfileImage(result);
  }

  bool isValid() {
    return _name.isNotEmpty && _email.contains('@') && _phoneNumber.isNotEmpty;
  }
}

class User {
  final String eventsname;
  final String dateandtime;
  final String thumbnail;
  final String description;
  final String organizer;

  User({
    required this.thumbnail,
    required this.dateandtime,
    required this.eventsname,
    required this.description,
    required this.organizer,
  });
}

class EventModel extends ChangeNotifier {
  List<User> _users = [
    User(
      organizer: 'Global Youth Hub',
      thumbnail:
          'https://www.shutterstock.com/shutterstock/photos/2160662015/display_1500/stock-vector-international-youth-day-is-observed-every-year-on-august-the-purpose-of-the-day-is-to-draw-2160662015.jpg',
      dateandtime: '2024-12-10',
      eventsname: 'Youth empowerment Events',
      description: 'Jeevan Raithis is free events which is going to be held.',
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

  List<User> get users => _users;
}
