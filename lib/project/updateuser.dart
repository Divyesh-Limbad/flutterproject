import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database/database_helper.dart';

class UpdateUser extends StatefulWidget {
  final Map<String, dynamic> user;
  final Function(Map<String, dynamic>) onUpdate;

  UpdateUser({Key? key, required this.user, required this.onUpdate})
      : super(key: key);

  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final DatabaseHelper dbHelper = DatabaseHelper();

  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController mobileController;
  late TextEditingController dobController;

  final _formKey = GlobalKey<FormState>();
  String? selectedCity;
  String? selectedGender;

  bool isCricket = false;
  bool isReading = false;
  bool isDancing = false;

  List<String> cities = ['Ahmedabad', 'Surat', 'Rajkot', 'Vadodara'];
  List<String> genders = ['Male', 'Female', 'Other'];

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController(text: widget.user['fullName']);
    emailController = TextEditingController(text: widget.user['email']);
    mobileController = TextEditingController(text: widget.user['mobile']);
    dobController = TextEditingController(text: widget.user['dob']);
    selectedCity = widget.user['city'];
    selectedGender = widget.user['gender'];

    // Initialize hobbies based on user data
    List<dynamic> hobbiesList = [];

    // Include the provided code snippet here
    if (widget.user['hobbies'] is String) {
      hobbiesList = widget.user['hobbies']
          .split(',')
          .map((hobby) => hobby.trim())
          .toList();
    } else if (widget.user['hobbies'] is List) {
      hobbiesList = (widget.user['hobbies'] as List<dynamic>)
          .map((hobby) => hobby.toString().trim())
          .toList();
    }

    // Set the state of hobbies based on existing data
    isCricket = hobbiesList.contains("Cricket");
    isReading = hobbiesList.contains("Reading");
    isDancing = hobbiesList.contains("Dancing");
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    dobController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(Duration(days: 18 * 365)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  void resetForm() {
    fullNameController.clear();
    emailController.clear();
    mobileController.clear();
    dobController.clear();

    selectedCity = null;
    selectedGender = null;

    isCricket = false;
    isReading = false;
    isDancing = false;

    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Form reset successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Update User', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[200], // Light background color
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                buildTextField(
                  controller: fullNameController,
                  label: 'Full Name',
                  icon: Icons.person,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Enter a valid name'
                      : null,
                ),
                buildTextField(
                  controller: emailController,
                  label: 'Email',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Enter a valid email'
                      : null,
                ),
                buildTextField(
                  controller: mobileController,
                  label: 'Mobile No.',
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      (value == null || value.isEmpty || value.length < 10)
                          ? 'Enter a valid mobile number'
                          : null,
                ),
                buildDropdownField(
                  label: 'Select City',
                  icon: Icons.location_city,
                  items: cities,
                  selectedValue: selectedCity,
                  onChanged: (value) => setState(() => selectedCity = value),
                ),
                buildDropdownField(
                  label: 'Select Gender',
                  icon: Icons.transgender,
                  items: genders,
                  selectedValue: selectedGender,
                  onChanged: (value) => setState(() => selectedGender = value),
                ),
                buildDatePickerField(),
                buildHobbiesSection(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> updatedUser = {
                        'id': widget.user['id'], // Include the user ID
                        'fullName': fullNameController.text,
                        'email': emailController.text,
                        'mobile': mobileController.text,
                        'city': selectedCity,
                        'gender': selectedGender,
                        'dob': dobController.text,
                        'hobbies': [
                          if (isCricket) "Cricket",
                          if (isReading) "Reading",
                          if (isDancing) "Dancing",
                        ].join(', '), // Convert list to string
                      };
                      dbHelper
                          .updateUser(updatedUser); // Update user in database
                      widget.onUpdate(updatedUser);
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text('Update User',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                const SizedBox(height: 20),
                buildResetButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildResetButton() {
    return ElevatedButton(
      onPressed: resetForm,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text(
        'Reset',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
        validator: validator,
      ),
    );
  }

  Widget buildDropdownField({
    required String label,
    required IconData icon,
    required List<String> items,
    required String? selectedValue,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
        value: selectedValue,
        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? 'Please select $label' : null,
      ),
    );
  }

  Widget buildDatePickerField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: dobController,
        decoration: InputDecoration(
          labelText: 'Date of Birth',
          prefixIcon: Icon(Icons.calendar_today, color: Colors.blueAccent),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
        readOnly: true,
        onTap: () => _selectDate(context),
      ),
    );
  }

  Widget buildHobbiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Hobbies', style: TextStyle(fontSize: 16)),
        CheckboxListTile(
          title: Text('Cricket'),
          value: isCricket,
          onChanged: (value) => setState(() => isCricket = value!),
        ),
        CheckboxListTile(
          title: Text('Reading'),
          value: isReading,
          onChanged: (value) => setState(() => isReading = value!),
        ),
        CheckboxListTile(
          title: Text('Dancing'),
          value: isDancing,
          onChanged: (value) => setState(() => isDancing = value!),
        ),
      ],
    );
  }
}
