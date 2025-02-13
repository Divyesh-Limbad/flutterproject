import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for TextInputFormatter

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var passwordController = TextEditingController();
  final dobController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? _password;

  List<String> cities = ['Ahmedabad', 'Surat', 'Rajkot', 'Vadodara'];
  String? selectedCity;

  List<String> gender = ['Male', 'Female', 'Other'];
  String? selectedGender;

  bool isCricket = false;
  bool isReading = false;
  bool isDancing = false;

  List<Map<String, dynamic>> users = [];

  void resetForm() {
    fullNameController.clear();
    emailController.clear();
    mobileController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
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
            Text('Add a User', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid name';
                    }
                    // Regex to allow only letters, spaces, and apostrophes
                    if (!RegExp(r"^[a-zA-Z\s']+$").hasMatch(value)) {
                      return 'Only letters, spaces, and apostrophes allowed';
                    }
                    return null;
                  },
                ),
                buildTextField(
                  controller: emailController,
                  label: 'Email',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid email';
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                        .hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                buildTextField(
                  controller: mobileController,
                  label: 'Mobile No.',
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Allow only digits
                    LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid mobile number';
                    }
                    if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
                      return 'Enter exactly 10 digits';
                    }
                    return null;
                  },
                ),
                buildDropdownField(
                  label: 'Select City',
                  icon: Icons.location_city,
                  items: cities,
                  selectedValue: selectedCity,
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                  },
                ),
                buildDropdownField(
                  label: 'Select Gender',
                  icon: Icons.transgender,
                  items: gender,
                  selectedValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
                buildDatePickerField(context),
                buildHobbiesSection(),
                buildTextField(
                  controller: passwordController,
                  label: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    if (!RegExp(
                            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
                        .hasMatch(value)) {
                      return 'Password must include uppercase, lowercase, number & special character';
                    }
                    _password = value;
                    return null;
                  },
                ),
                buildTextField(
                  controller: confirmPasswordController,
                  label: 'Confirm Password',
                  icon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm your password';
                    }
                    if (value != _password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                buildResetButton(),
                const SizedBox(height: 10),
                buildSubmitButton(),
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

  Widget buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          List<String> selectedHobbies = [];
          if (isCricket) selectedHobbies.add('Cricket');
          if (isReading) selectedHobbies.add('Reading');
          if (isDancing) selectedHobbies.add('Dancing');

          users.add({
            'fullName': fullNameController.text,
            'email': emailController.text,
            'mobile': mobileController.text,
            'city': selectedCity,
            'gender': selectedGender,
            'dob': dobController.text,
            'hobbies': selectedHobbies,
          });

          resetForm();
          Navigator.pop(context, users);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text(
        'Submit',
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
    List<TextInputFormatter>? inputFormatters, // Add this parameter
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        // Use the inputFormatters
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
        items: items.map((item) {
          return DropdownMenuItem(value: item, child: Text(item));
        }).toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? 'Please select $label' : null,
      ),
    );
  }

  Widget buildDatePickerField(BuildContext context) {
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
        onTap: () async {
          DateTime currentDate = DateTime.now();
          DateTime firstDate = currentDate.subtract(Duration(days: 80 * 365));
          DateTime lastDate = currentDate.subtract(Duration(days: 18 * 365));

          DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: lastDate,
            firstDate: firstDate,
            lastDate: lastDate,
          );

          if (selectedDate != null) {
            dobController.text =
                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
          }
        },
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
