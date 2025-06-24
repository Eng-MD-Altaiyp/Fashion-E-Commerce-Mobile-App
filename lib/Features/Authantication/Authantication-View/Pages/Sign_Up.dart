import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Authantication/Authantication-View/Widgets/Loading-Widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class signup_screen extends StatefulWidget {
  const signup_screen({super.key});

  @override
  State<signup_screen> createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {
  ValueNotifier<bool> isChecked = ValueNotifier(false);
  ValueNotifier<bool> show_password = ValueNotifier(true);

  final _formKey = GlobalKey<FormState>();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Confirm_Password = TextEditingController();
  int number = 0;
  var uname = "";
  var pass = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      appBar: AppBar(
        backgroundColor: White,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Neutrals,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Create a Account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Create a new account",
                  style: TextStyle(color: Grey400, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email",
                            style: TextStyle(
                                color: Grey400, fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                            top: 5, bottom: 10, left: 10, right: 10),
                        padding: EdgeInsets.only(left: 15, right: 15),
                        height: 65,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Grey200,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: White,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Email';
                            }
                            if (value.length < 4) {
                              return 'This Email is Not Correct';
                            } else {
                              return null;
                            }
                          },
                          controller: Email,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  Email ",
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Neutrals,
                              ),
                              hintStyle: TextStyle(color: Grey400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(
                                color: Grey400, fontSize: 18),
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: show_password,
                        builder: (context, value, child) {
                          return Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                                top: 5, bottom: 30, left: 10, right: 10),
                            padding: EdgeInsets.only(left: 15, right: 15),
                            height: 65,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Grey200,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: White,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                if (value.length < 4) {
                                  return 'Password must be at least 4 characters';
                                } else {
                                  return null;
                                }
                              },
                              controller: Password,
                              obscureText: show_password.value,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "  Password ",
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Neutrals,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      show_password.value =
                                          !show_password.value;
                                    },
                                    icon: show_password.value == true
                                        ? Icon(
                                            Icons.remove_red_eye,
                                            color: Neutrals,
                                          )
                                        : const Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey,
                                          )),
                                hintStyle: TextStyle(
                                  color: Grey400,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Confirm Password",
                            style: TextStyle(
                                color: Grey400, fontSize: 18),
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: show_password,
                        builder: (context, value, child) {
                          return Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                                top: 5, bottom: 30, left: 10, right: 10),
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            height: 65,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Grey200,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: White,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                if (value.length < 4) {
                                  return 'Password must be at least 4 characters';
                                } else {
                                  return null;
                                }
                              },
                              controller: Confirm_Password,
                              obscureText: show_password.value,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "  Password ",
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Neutrals,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      show_password.value =
                                          !show_password.value;
                                    },
                                    icon: show_password.value == true
                                        ? Icon(
                                            Icons.remove_red_eye,
                                            color: Neutrals,
                                          )
                                        : const Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey,
                                          )),
                                hintStyle: TextStyle(
                                  color: Grey400,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: isChecked,
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 40, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: isChecked.value,
                                onChanged: (bool? value) {
                                  isChecked.value = value ?? false;
                                },
                                side: BorderSide(
                                    color: Grey300, width: 2),
                                checkColor: Primary,
                                activeColor: White,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "I agree to the ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              fontSize: 13,
                                              color: Grey400),
                                    ),
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    "Terms of Conditions")),
                                          );
                                        },
                                      text: " Terms of Conditions",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              fontSize: 13, color: Primary),
                                    ),
                                    TextSpan(
                                      text: " and",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                              fontSize: 13,
                                              color: Grey400),
                                    ),
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content:
                                                    Text("Privacy Policy")),
                                          );
                                        },
                                      text: " Privacy\n Policy",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              fontSize: 13, color: Primary),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        // Timer(
                        //   Duration(seconds: 10),
                        //       () {
                        //     Navigator.of(context).pop();
                        //   },
                        // );
                        return Loading(
                          Password: Password.text.toString(),
                          User_Name: Email.text.toString(),
                          when_loading: 'login',
                        );
                      },
                    );
                  } else {}
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    color: Primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: White),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Or Log in with",
                    style: TextStyle(color: Grey400, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // width: 180,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Grey200, width: 2),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 8, top: 8, bottom: 8),
                                child: SvgPicture.asset(
                                  "assets/Icon_SVG/google-icon-logo-svgrepo-com.svg",
                                  width: 25,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 8, top: 8, bottom: 8),
                                child: Text(
                                  "Google",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Grey400),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // width: 180,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Grey200, width: 2),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 8, top: 8, bottom: 8),
                                child: SvgPicture.asset(
                                  "assets/Icon_SVG/facebook-1-svgrepo-com.svg",
                                  width: 25,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 8, top: 8, bottom: 8),
                                child: Text(
                                  "Facebook",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Grey400),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/login_screen',
                    );

                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have account? ",
                          style: TextStyle(
                            fontSize: 15,
                            color: Grey400,
                          ),
                        ),
                        TextSpan(
                          text: "Log In",
                          style: TextStyle(
                            fontSize: 15,
                            color: Primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
