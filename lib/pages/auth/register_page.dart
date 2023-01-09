import 'package:chatapp_firebase/helper/helper_function.dart';
import 'package:chatapp_firebase/pages/auth/login_page.dart';
import 'package:chatapp_firebase/pages/home_page.dart';
import 'package:chatapp_firebase/service/auth_service.dart';
import 'package:chatapp_firebase/shared/constants.dart';
import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  String studentNo = "";

  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor))
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: queryData.size.width * 0.05,
                  vertical: queryData.size.height * 0.17,
                ),
                child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            SizedBox(
                              height: queryData.size.height * 0.13,
                              width: queryData.size.width * 0.26,
                              child: Image.network(
                                  "http://www.mu.edu.tr/Icerik/Sayfa/basin.mu.edu.tr/logo_en1.png",),
                            ),
                            Text(
                              "MSKÜ İletişim Uygulaması",
                              style: TextStyle(
                                  fontSize: queryData.size.height * 0.027,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red.shade900),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: queryData.size.height * 0.02,
                        ),
                        TextFormField(
                          obscureText: false,
                          decoration: textInputDecoration.copyWith(
                              labelText: "Öğrenci Numarası",
                              prefixIcon:  Icon(
                                Icons.numbers_outlined,
                                color: Theme.of(context).primaryColor,
                              )),
                          validator: (val) {
                            if (val!.length < 9) {
                              return "Öğrenci numaranız 9 haneden oluşmalıdır.";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              studentNo = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: queryData.size.height * 0.01,
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "İsim",
                              prefixIcon:  Icon(
                                Icons.person,
                                color: Theme.of(context).primaryColor,
                              )),
                          onChanged: (val) {
                            setState(() {
                              fullName = val;
                            });
                          },
                          validator: (val) {
                            if (val!.isNotEmpty) {
                              return null;
                            } else {
                              return "Bu kısım boş bırakılamaz.";
                            }
                          },
                        ),
                        SizedBox(
                          height: queryData.size.height * 0.01,
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "E-posta",
                              prefixIcon:  Icon(
                                Icons.email,
                                color: Theme.of(context).primaryColor,
                              )),
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },

                          // check tha validation
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val!)
                                ? null
                                : "Lütfen geçerli bir e-posta giriniz.";
                          },
                        ),
                        SizedBox(
                          height: queryData.size.height * 0.01,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: textInputDecoration.copyWith(
                              labelText: "Şifre",
                              prefixIcon:  Icon(
                                Icons.lock,
                                color: Theme.of(context).primaryColor,
                              )),
                          validator: (val) {
                            if (val!.length < 6) {
                              return "Şifreniz en az 6 karakterden oluşmalı.";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: queryData.size.height * 0.015,
                        ),
                        
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary:  Theme.of(context).primaryColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: const Text(
                              "Kayıt Oluştur",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: () {
                              register();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(
                          text: "Zaten bir hesabın var mı? ",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Giriş yap",
                                style:  TextStyle(
                                    color: Constants.secondaryColor,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    nextScreen(context, const LoginPage());
                                  }),
                          ],
                        )),
                      ],
                    )),
              ),
            ),
    );
  }

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          // saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullName);
          nextScreenReplace(context, const HomePage());
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
