import 'package:flutter/material.dart';

class AddEditUserScreen extends StatefulWidget {
  final Function(Map<String, dynamic>)
      onUserAdded; // Callback to handle user addition
  final Map<String, dynamic>? existingUser;

  const AddEditUserScreen({
    Key? key,
    required this.onUserAdded,
    this.existingUser,
  }) : super(key: key);

  @override
  State<AddEditUserScreen> createState() => _AddEditUserScreenState();
}

class _AddEditUserScreenState extends State<AddEditUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _dobController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _cityController = TextEditingController();

  final List<String> _hobbiesOptions = [
    'Reading',
    'Traveling',
    'Music',
    'Sports'
  ];
  late Map<String, bool> _selectedHobbies;
  String? _selectedGender;
  bool _hobbiesError = false;

  @override
  void initState() {
    super.initState();

    // Populate fields from existingUser if available
    if (widget.existingUser != null) {
      final user = widget.existingUser!;
      _nameController.text = user['fullName'] ?? '';
      _emailController.text = user['email'] ?? '';
      _mobileController.text = user['mobileNumber'] ?? '';
      _dobController.text = user['dob'] ?? '';
      _selectedGender = user['gender'];
      _passwordController.text = user['password'] ?? '';
      _confirmPasswordController.text = user['password'] ?? '';
      _cityController.text = user['city'] ?? '';

      _selectedHobbies = {
        for (var hobby in _hobbiesOptions)
          hobby: (user['hobbies'] ?? []).contains(hobby)
      };
    } else {
      _selectedHobbies = {for (var hobby in _hobbiesOptions) hobby: false};
    }
  }

  Widget _buildHobbiesField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Hobbies', style: TextStyle(fontSize: 16)),
          Wrap(
            spacing: 10.0,
            runSpacing: 5.0,
            children: _hobbiesOptions.map((hobby) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _selectedHobbies[hobby],
                    onChanged: (bool? value) {
                      setState(() {
                        _selectedHobbies[hobby] = value ?? false;
                      });
                    },
                    activeColor: Theme.of(context).primaryColor,
                    checkColor: Colors.white,
                  ),
                  Text(hobby, style: Theme.of(context).textTheme.bodyMedium),
                ],
              );
            }).toList(),
          ),
          if (_hobbiesError)
            const Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text(
                'Please select at least one hobby.',
                style: TextStyle(
                    color: Color.fromRGBO(158, 0, 0, 1), fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existingUser == null ? 'Add User' : 'Edit User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Full Name Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    final nameRegex = RegExp(r"^[a-zA-Z\s'-]{3,50}$");
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name.';
                    }
                    if (!nameRegex.hasMatch(value)) {
                      return 'Enter a valid full name (3-50 characters, alphabets only).';
                    }
                    return null;
                  },
                ),
              ),

              // Email Address Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    final emailRegex = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email address.';
                    }
                    if (!emailRegex.hasMatch(value)) {
                      return 'Enter a valid email address.';
                    }
                    return null;
                  },
                ),
              ),

              // Mobile Number Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _mobileController,
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    final mobileRegex = RegExp(r"^\+?[0-9]{10,15}$");
                    if (value == null || value.isEmpty) {
                      return 'Please enter a mobile number.';
                    }
                    if (!mobileRegex.hasMatch(value)) {
                      return 'Enter a valid 10-digit mobile number.';
                    }
                    return null;
                  },
                ),
              ),

              // Date of Birth Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _dobController,
                  decoration: const InputDecoration(
                    labelText: 'Date of Birth (DD/MM/YYYY)',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  onTap: () async {
                    final now = DateTime.now();
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: now.subtract(const Duration(days: 18 * 365)),
                      firstDate: now.subtract(const Duration(days: 80 * 365)),
                      lastDate: now.subtract(const Duration(days: 18 * 365)),
                    );
                    if (selectedDate != null) {
                      _dobController.text =
                          '${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.year}';
                    }
                  },
                  validator: (value) {
                    // Add DOB validation logic
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    final cityRegex = RegExp(r"^[a-zA-Z\s]{2,50}$");
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city.';
                    }
                    if (!cityRegex.hasMatch(value)) {
                      return 'Enter a valid city name (alphabets only).';
                    }
                    return null;
                  },
                ),
              ),

              // Gender Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  value: _selectedGender,
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                  items: ['Male', 'Female', 'Other']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() {
                    _selectedGender = value;
                  }),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender.';
                    }
                    return null;
                  },
                ),
              ),

              // Hobbies Field
              _buildHobbiesField(),

              // Password Fields
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password.';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  decoration:
                      const InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password.';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match.';
                    }
                    return null;
                  },
                ),
              ),

              // Submit Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _hobbiesError = _selectedHobbies.values.every(
                          (selected) => !selected); // Check hobbies validation
                    });

                    if (_formKey.currentState?.validate() ??
                        false && !_hobbiesError) {
                      _formKey.currentState?.save();
                      final user = {
                        'fullName': _nameController.text,
                        'email': _emailController.text,
                        'mobileNumber': _mobileController.text,
                        'dob': _dobController.text,
                        'gender': _selectedGender,
                        'city': _cityController.text,
                        'hobbies': _selectedHobbies.entries
                            .where((entry) => entry.value)
                            .map((entry) => entry.key)
                            .toList(),
                        'password': _passwordController.text,
                      };
                      widget.onUserAdded(user);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save User'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _cityController.dispose();
    super.dispose();
  }
}
