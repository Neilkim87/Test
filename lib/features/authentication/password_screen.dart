import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';

import '../../constants/sizes.dart';
import 'widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = '';
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordLong() {
    return _password.isNotEmpty && _password.length > 8;
  }

  bool _isPasswordComplex() {
    if (!_password.contains(RegExp(r"[a-z]"))) return false;
    if (!_password.contains(RegExp(r"[A-Z]"))) return false;
    if (!_password.contains(RegExp(r"[0-9]"))) return false;
    if (!_password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return false;

    return true;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordLong() || !_isPasswordComplex()) return;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BirthdayScreen(),
        ));
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'Sign up',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size36,
              vertical: Sizes.size24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v16,
                TextField(
                  controller: _passwordController,
                  onEditingComplete: _onSubmit,
                  obscureText: _obscureText,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _onClearTap,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            color: Colors.grey.shade500,
                            size: Sizes.size20,
                          ),
                        ),
                        Gaps.h10,
                        GestureDetector(
                          onTap: _toggleObscureText,
                          child: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: Colors.grey.shade500,
                            size: Sizes.size20,
                          ),
                        ),
                      ],
                    ),
                    hintText: 'Make it strong!',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
                Gaps.v10,
                const Text(
                  'Your passwrod must have :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                Column(
                  children: [
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleCheck,
                          size: Sizes.size14,
                          color: _isPasswordLong()
                              ? Colors.green
                              : Colors.grey.shade400,
                        ),
                        Gaps.h10,
                        const Text('8 to 20 characters'),
                      ],
                    ),
                    Gaps.v5,
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleCheck,
                          size: Sizes.size14,
                          color: _isPasswordComplex()
                              ? Colors.green
                              : Colors.grey.shade400,
                        ),
                        Gaps.h10,
                        const Text('Letters, numbers, and special characters'),
                      ],
                    ),
                  ],
                ),
                Gaps.v28,
                GestureDetector(
                  onTap: _onSubmit,
                  child: FormButton(
                    disabled: !_isPasswordLong() || !_isPasswordComplex(),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
