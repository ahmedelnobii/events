import 'package:events/core/constants/app_icons.dart';
import 'package:events/core/constants/app_images.dart';
import 'package:events/providers/user_provider.dart';
import 'package:events/screens/home_screen/home_screen.dart';
import 'package:events/screens/login/googleButton.dart';
import 'package:events/screens/login/register_screen.dart';
import 'package:events/screens/widgets/custom_button.dart';
import 'package:events/screens/widgets/custom_text_form_fieled.dart';
import 'package:events/screens/widgets/firebase_servises.dart';
import 'package:events/screens/widgets/ui_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Image.asset(AppImages.lightLogo, fit: .scaleDown)),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text('Login to your account', style: textTheme.labelLarge),
              SizedBox(height: 32),
              Form(
                autovalidateMode: .onUserInteraction,
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter email';
                        }
                        final emailRegex = RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+$",
                        );

                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                      },
                      controller: emailController,
                      hint: 'Enter your email',
                      prefix: SvgPicture.asset(
                        AppIcons.email,
                        height: 24,
                        width: 24,
                        fit: .scaleDown,
                      ),
                    ),
                    SizedBox(height: 16),

                    CustomTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter password";
                        }
                        if (value.length < 8) {
                          return "must be at least 8 characters";
                        }
                      },
                      controller: passwordController,
                      hint: 'Enter your password',
                      prefix: SvgPicture.asset(
                        AppIcons.lock,
                        height: 24,
                        width: 24,
                        fit: .scaleDown,
                      ),
                      isPassword: true,
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: .end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Forget Password?',
                      style: textTheme.titleSmall?.copyWith(
                        color: theme.primaryColor,
                        decoration: .underline,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              isloading(true);
                              FirebaseServices.login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  )
                                  .then((user) {
                                    Navigator.of(context).pushReplacementNamed(
                                      HomeScreen.routeName,
                                    );

                                    Provider.of<UserProvider>(
                                      context,
                                      listen: false,
                                    ).updateUser(user);
                                  })
                                  .catchError((error) {
                                    isloading(false);
                                    if (error is FirebaseAuthException) {
                                      UiUtils.showFailedMessage(error.message);
                                    }
                                  });
                            }
                          },
                    text: 'Log in',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text('Don’t have an account ?', style: textTheme.titleSmall),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RegisterScreen.routeName);
                    },
                    child: Text(
                      'Register',
                      style: textTheme.titleSmall?.copyWith(
                        color: theme.primaryColor,
                        decoration: .underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48),
              GoogleButton(
                text: 'Login with Google',
                isloading: isloading,
                
              ),
            ],
          ),
        ),
      ),
    );
  }

  void isloading(bool pressed) {
    isLoading = pressed;
    setState(() {});
  }
}
