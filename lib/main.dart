import 'package:flutter/material.dart';

main() {
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
// beautiful Flutter login and registration UI Screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;
  bool showConfirmPassword = false;
  bool isLoginSelected = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(top: 50, left: 100, child: customContainer(100, 100)),
              Positioned(top: 50, right: 70, child: customContainer(150, 150)),
              Positioned(
                top: 130,
                right: 150,
                child: customContainer(100, 100),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 260),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: LinearGradient(
                                colors: [Colors.blue.shade50, Colors.blue])),
                        child: Row(
                          children: [
                            !isLoginSelected
                                ? Expanded(
                                    child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          print('tap');
                                          isLoginSelected = true;
                                        });
                                      },
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ))
                                : Expanded(
                                    child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        gradient: LinearGradient(colors: [
                                          Colors.blue.shade50,
                                          Colors.blue
                                        ])),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            isLoginSelected
                                ? Expanded(
                                    child: Center(
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          print('tap');
                                          isLoginSelected = false;
                                        });
                                      },
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ))
                                : Expanded(
                                    child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        gradient: LinearGradient(colors: [
                                          Colors.blue.shade50,
                                          Colors.blue
                                        ])),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ))
                          ],
                        ),
                      ),
                    ),
                    emailField(),
                    passwordField(),
                    !isLoginSelected ? SizedBox() : forgotPassword(),
                    isLoginSelected ? SizedBox() : confirmPasswordField(),
                    !isLoginSelected
                        ? SizedBox(
                            height: 40,
                          )
                        : SizedBox(),
                    button(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
// Beautiful flutter login and registration ui template screen design
  Widget customContainer(height, width) {
    return Container(
      height: double.parse(height.toString()),
      width: double.parse(width.toString()),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [Colors.blue, Colors.white])),
    );
  }
  Widget emailField() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: TextField(
          style: TextStyle(color: Colors.black45, fontSize: 14),
          decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(minWidth: 24),
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.email,
                  color: Colors.black45,
                  size: 20,
                ),
              ),
              hintText: 'Enter email',
              hintStyle: TextStyle(color: Colors.black45, fontSize: 14),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45, width: .4)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45, width: .4))),
        ));
  }
// beautiful Flutter login and registration UI Screen
  Widget passwordField() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60).copyWith(top: 12),
        child: TextField(
          obscureText: showPassword ? false : true,
          style: TextStyle(color: Colors.black45, fontSize: 14),
          decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(minWidth: 24),
              suffixIconConstraints: BoxConstraints(minWidth: 24),
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.lock,
                  color: Colors.black45,
                  size: 20,
                ),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black45,
                    size: 20,
                  ),
                ),
              ),
              hintText: 'Enter password',
              hintStyle: TextStyle(color: Colors.black45, fontSize: 14),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45, width: .4)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45, width: .4))),
        ));
  }
  Widget confirmPasswordField() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60).copyWith(top: 12),
        child: TextField(
          obscureText: showConfirmPassword ? false : true,
          style: TextStyle(color: Colors.black45, fontSize: 14),
          decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(minWidth: 24),
              suffixIconConstraints: BoxConstraints(minWidth: 24),
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.lock,
                  color: Colors.black45,
                  size: 20,
                ),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showConfirmPassword = !showConfirmPassword;
                    });
                  },
                  child: Icon(
                    showConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.black45,
                    size: 20,
                  ),
                ),
              ),
              hintText: 'Confirm password',
              hintStyle: TextStyle(color: Colors.black45, fontSize: 14),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45, width: .4)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45, width: .4))),
        ));
  }
  Widget forgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 58, bottom: 30),
        child: InkWell(
          onTap: () {
            // navigate to other screen
          },
          child: Text(
            'Forgot password?',
            style: TextStyle(
                color: Colors.black45,
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
  Widget button() {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Clicked')));
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 60).copyWith(bottom: 15),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(3, 3),
                  blurRadius: 4,
                  spreadRadius: 1,
                  color: Colors.black45.withOpacity(.08))
            ],
            borderRadius: BorderRadius.circular(50)
                .copyWith(topRight: Radius.circular(0)),
            gradient: LinearGradient(colors: [
              Colors.blue,
              Colors.white,
            ])),
        child: Text(
          isLoginSelected ? 'Sign In' : 'Register',
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}