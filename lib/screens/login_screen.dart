import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/text_filed_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            //svg image
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.modulate,
              ),
              height: 64,
            ),

            const SizedBox(
              height: 64,
            ),

            // Text filed input for email
            TextFieldInput(
              textEditingController: _emailController,
              hintText: "Enter your email",
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            // text field input for password
            TextFieldInput(
              hintText: "Enter your password",
              textInputType: TextInputType.text,
              ispass: true,
              textEditingController: _passwordController,
            ),
            const SizedBox(height: 24),


            
          // button login
            Container(
              child: const Text("Login"),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  color: blueColor),
            ),
            const SizedBox(
              height: 12,
              ),
              
              Flexible(
                flex: 1,
                child: Container(),
              ),
          ],

          // transition to signup
        ),
      ),
    ));
  }
}
