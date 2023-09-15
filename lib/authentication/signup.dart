import 'package:contact_list_flutter_application/authentication/auth.dart';
import 'package:contact_list_flutter_application/authentication/signin.dart';
import 'package:contact_list_flutter_application/screens/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String password = "";
  String email = "";
  bool email_val = false;
  bool pass_val = false;
  String snack_message = "";
  bool progress = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromARGB(255, 20, 20, 20),
          body: Stack(
            children: [
              SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 35),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 25),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 100, 98, 111),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  )),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'SIGNUP',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    transform: GradientRotation(3.14 / 4),
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color.fromARGB(255, 77, 73, 78),
                                      Color.fromARGB(255, 31, 28, 36)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  )),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 45),
                                    child: Column(
                                      children: [
                                        TextField(
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white),
                                          onChanged: (value) {
                                            email = value;
                                          },
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.email,
                                              color: Color.fromARGB(
                                                  255, 150, 150, 150),
                                            ),
                                            labelText: 'E-mail',
                                            errorText: email_val
                                                ? "This field can't be empty"
                                                : null,
                                            // labelStyle: TextStyle(color: Color.fromARGB(255,150,150,150)),
                                            labelStyle: GoogleFonts.montserrat(
                                                color: Color.fromARGB(
                                                    255, 150, 150, 150)),
                                            hintText: 'Enter e-mail id',
                                            hintStyle: GoogleFonts.montserrat(
                                                color: Color.fromARGB(
                                                    255, 150, 150, 150)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        TextField(
                                          onChanged: (value) {
                                            password = value;
                                          },
                                          obscureText: true,
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white),
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.password,
                                              color: Color.fromARGB(
                                                  255, 150, 150, 150),
                                            ),
                                            hintText: "Enter password",
                                            errorText: pass_val
                                                ? "This field can't be empty"
                                                : null,
                                            hintStyle: GoogleFonts.montserrat(
                                                color: Color.fromARGB(
                                                    255, 150, 150, 150)),
                                            labelText: 'Password',
                                            labelStyle: GoogleFonts.montserrat(
                                                color: Color.fromARGB(
                                                    255, 150, 150, 150)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Already a user? ',
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 150, 150, 150),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Signin()),
                                                );
                                              },
                                              child: Text(
                                                'Signin',
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color.fromARGB(
                                                          255, 180, 180, 180)),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (email == "")
                                          setState(() {
                                            email_val = true;
                                          });
                                        if (password == "")
                                          setState(() {
                                            pass_val = true;
                                          });
                                        if (email != "")
                                          setState(() {
                                            email_val = false;
                                          });
                                        if (password != "")
                                          setState(() {
                                            pass_val = false;
                                          });
                                        if (!email_val && !pass_val) {
                                          setState(() {
                                            progress = true;
                                          });
                                          bool list;
                                          list = await Auth()
                                              .register(email, password);
                                          setState(() {
                                            progress = false;
                                          });
                                          if (list == true) {
                                            var snackBar = SnackBar(
                                              content: Center(
                                                  child: Text(
                                                Auth.message,
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )),
                                              backgroundColor: Color.fromARGB(
                                                  255, 50, 50, 50),
                                            );
                                            // Step 3
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Contactlist(
                                                          email: email)),
                                            );
                                          } else {
                                            var snackBar = SnackBar(
                                              content: Center(
                                                  child: Text(
                                                Auth.message,
                                                style: TextStyle(
                                                    color: Auth.status
                                                        ? Colors.green
                                                        : Colors.red),
                                              )),
                                              backgroundColor: Color.fromARGB(
                                                  255, 50, 50, 50),
                                            );
                                            // Step 3
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Text(
                                          'SIGNUP',
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          backgroundColor:
                                              Color.fromARGB(255, 98, 95, 106)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              progress
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                  : Container()
            ],
          )),
    );
  }
}
