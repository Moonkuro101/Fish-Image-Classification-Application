import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fish_finder/material/font_and_color.dart';
import 'package:fish_finder/screens/main_screen/menu_screen.dart';
import 'package:flutter/material.dart';

class BodyForm extends StatefulWidget {
  const BodyForm({super.key, required this.isLogin});

  final bool isLogin;

  @override
  State<BodyForm> createState() => _BodyFormState();
}

class _BodyFormState extends State<BodyForm> {
  bool _isPressed = false;
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredUserName = '';
  var _obscureText = true;
  var _authtication = false;

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    try {
      setState(() {
        _authtication = true;
      });

      UserCredential userCredentials;
      if (widget.isLogin) {
        // User sign in
        userCredentials =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );

        // Check if the user's data exists in Firestore
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentials.user!.uid)
            .get();

        if (userDoc.exists) {
          if (!mounted) return;
          // Navigate to another screen if login is successful and user data exists
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) =>
                  const MenuScreen(), // Replace with your desired screen
            ),
          );
        } else {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User data does not exist in the database'),
            ),
          );
        }
      } else {
        // User sign up
        userCredentials =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );

        // Set default image (if required) and save user data in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentials.user!.uid)
            .set({
          'username': _enteredUserName,
          'email': _enteredEmail,
          'image_url': deafualtImage_Url,
        });
        if (!mounted) return;

        // Navigate to the next screen after successful sign up
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) =>
                const MenuScreen(), // Replace with your desired screen
          ),
        );
      }
    } on FirebaseException catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication failed'),
        ),
      );
      setState(() {
        _authtication = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onSaved: (newValue) {
                _enteredEmail = newValue!;
              },
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !value.contains('@') ||
                    value.trim() == '') {
                  return 'Please enter a valid email addrees';
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.grey.withOpacity(1),
                ),
                filled: true,
                fillColor: Colors.white,
                labelText: 'Email',
                labelStyle: fontEnglish.copyWith(
                  color: const Color.fromRGBO(123, 134, 170, 100),
                  fontSize: 16,
                ),
                hintStyle: fontEnglish.copyWith(
                  color: const Color.fromRGBO(68, 83, 129, 0.612),
                  fontSize: 14,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (!widget.isLogin)
              TextFormField(
                onSaved: (newValue) => _enteredUserName = newValue!,
                validator: (value) {
                  if (value!.isEmpty ||
                      value.trim() == '' ||
                      value.trim().length < 4) {
                    return 'Please enter at least 4 characters';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outlined,
                    color: Colors.grey.withOpacity(1),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Username',
                  labelStyle: fontEnglish.copyWith(
                    color: const Color.fromRGBO(123, 134, 170, 100),
                    fontSize: 16,
                  ),
                  hintStyle: fontEnglish.copyWith(
                    color: const Color.fromRGBO(68, 83, 129, 0.612),
                    fontSize: 14,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            TextFormField(
              onSaved: (newValue) => _enteredPassword = newValue!,
              validator: (value) {
                if ((value == null ||
                    value.isEmpty ||
                    value.trim() == '' ||
                    value.trim().length < 6)) {
                  return 'Please enter at least 6 characters';
                }
                return null;
              },
              obscureText: _obscureText,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.fingerprint,
                  color: Colors.grey.withOpacity(1),
                ),
                filled: true,
                fillColor: Colors.white,
                labelText: 'Password',
                labelStyle: fontEnglish.copyWith(
                  color: const Color.fromRGBO(123, 134, 170, 100),
                  fontSize: 16,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            if (widget.isLogin)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forget Password?',
                    style: fontEnglish.copyWith(
                      color: const Color(0xff0E7DFF),
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            if (_authtication)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (!_authtication)
              SizedBox(
                height: 50,
                width: double.infinity,
                child: GestureDetector(
                  onTapDown: (_) => setState(() => _isPressed = true),
                  onTapUp: (_) => setState(() => _isPressed = false),
                  onTapCancel: () => setState(() => _isPressed = false),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    transform:
                        Matrix4.translationValues(0, _isPressed ? 5 : 0, 0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, _isPressed ? 2 : 8),
                          blurRadius: _isPressed ? 6 : 12,
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: loginButton,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        _submit();
                      },
                      child: Text(
                        widget.isLogin ? 'Login' : 'Create Account',
                        style: fontEnglish.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
