import 'package:events/core/constants/app_icons.dart';
import 'package:events/core/constants/app_images.dart';
import 'package:events/core/theme/app_colors.dart';
import 'package:events/l10n/app_localizations.dart';
import 'package:events/providers/theme_provider.dart';
import 'package:events/providers/user_provider.dart';
import 'package:events/screens/home_screen/home_screen.dart';
import 'package:events/screens/login/googleButton.dart';
import 'package:events/screens/widgets/custom_button.dart';
import 'package:events/screens/widgets/custom_text_form_fieled.dart';
import 'package:events/screens/widgets/firebase_servises.dart';
import 'package:events/screens/widgets/ui_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isloading = false;
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    bool isDark = Provider.of<ThemeProvider>(context).isDark;

    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          isDark ? AppImages.darkLogo : AppImages.lightLogo,
          fit: .scaleDown,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                AppLocalizations.of(context)!.createYourAccount,
                style: textTheme.labelLarge,
              ),
              SizedBox(height: 32),
              Form(
                autovalidateMode: .onUserInteraction,
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your name';
                        }
                        if (value.trim().length < 3) {
                          return 'must be at least 3 characters';
                        }
                      },
                      hint: AppLocalizations.of(context)!.enterYourName,
                      prefix: SvgPicture.asset(
                        AppIcons.unSelectedProfile,
                        height: 24,
                        width: 24,
                        fit: .scaleDown,
                      ),
                    ),
                    SizedBox(height: 16),

                    CustomTextFormField(
                      controller: emailController,
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
                      hint: AppLocalizations.of(context)!.enterYourEmail,
                      prefix: SvgPicture.asset(
                        AppIcons.email,
                        height: 24,
                        width: 24,
                        fit: .scaleDown,
                      ),
                    ),
                    SizedBox(height: 16),

                    CustomTextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter password';
                        }
                        if (value.trim().length < 8) {
                          return 'must be at least 8 characters';
                        }
                      },
                      hint: AppLocalizations.of(context)!.enterYouPassword,
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

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    isLoading: isPressed,
                    onPressed: isloading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              isLoading(true);
                              isPressedFunc(true);
                              FirebaseServices.register(
                                    name: nameController.text,
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
                                    isLoading(false);
                                    isPressedFunc(false);
                                    if (error is FirebaseAuthException) {
                                      UiUtils.showFailedMessage(error.message);
                                    }
                                  });
                            }
                          },
                    text: AppLocalizations.of(context)!.register,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.alreadyHaveAnAccount,
                    style: textTheme.titleSmall,
                  ),
                  InkWell(
                    onTap: () {
                      // return to previos page - log in -
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.logoIn,
                      style: textTheme.titleSmall?.copyWith(
                        color: theme.primaryColor,
                        decoration: .underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48),
              Stack(
                alignment: .center,
                children: [
                  Divider(color: AppColors.gray),
                  Container(
                    color: isDark
                        ? AppColors.darkBackground
                        : AppColors.lightBackground,
                    child: Text(
                      AppLocalizations.of(context)!.or,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 48),
              GoogleButton(
                text: AppLocalizations.of(context)!.registerWithGoogle,
                isloading: isLoading,
                isPressed: isloading,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void isLoading(bool pressed) {
    isloading = pressed;
    setState(() {});
  }

  void isPressedFunc(bool pressed) {
    isPressed = pressed;
    setState(() {});
  }
}
