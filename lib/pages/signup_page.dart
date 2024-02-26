import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ema/cubit/auht_cubit/auth_cubit.dart';
import 'package:ema/cubit/auht_cubit/auth_states.dart';
import 'package:ema/pages/home_page.dart';
import 'package:ema/pages/login_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    String? email, name, password, cpassword;
    bool loading = false;

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoadingState) {
            loading = true;
          } else if (state is LoginFailedState) {
            loading = false;
            showSnackBar(context, state.msg);
          } else {
            loading = false;

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: ModalProgressHUD(
              inAsyncCall: loading,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  // padding: const EdgeInsets.symmetric(horizontal: 20),
                  // height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 60.0),
                          const Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Create your account",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              onChanged: (data) {
                                name = data;
                              },
                              validator: (data) {
                                if (data == '') {
                                  return 'username is empty';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "Username",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: Colors.purple.withOpacity(0.1),
                                  filled: true,
                                  prefixIcon: const Icon(Icons.person)),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              onChanged: (data) {
                                email = data;
                              },
                              validator: (data) {
                                if (data == '') {
                                  return 'email is empty';
                                } else if (data!.contains('@') == false) {
                                  return 'enter a correct email';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: BorderSide.none),
                                  fillColor: Colors.purple.withOpacity(0.1),
                                  filled: true,
                                  prefixIcon: const Icon(Icons.email)),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              onChanged: (data) {
                                password = data;
                              },
                              validator: (data) {
                                if (data == '') {
                                  return 'password is empty';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none),
                                fillColor: Colors.purple.withOpacity(0.1),
                                filled: true,
                                prefixIcon: const Icon(Icons.password),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              validator: (data) {
                                if (data != password) {
                                  return 'confirm password is not matching';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (data) {
                                cpassword = data;
                              },
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none),
                                fillColor: Colors.purple.withOpacity(0.1),
                                filled: true,
                                prefixIcon: const Icon(Icons.password),
                              ),
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                          padding: const EdgeInsets.only(top: 3, left: 3),
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context).register(
                                    email: email!,
                                    password: password!,
                                    name: name!,
                                    cpassword: cpassword!);
                              }
                              //      Fluttertoast.showToast(msg: 'done.......');
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: Colors.purple,
                            ),
                            child: const Text(
                              "Sign up",
                              style: TextStyle(fontSize: 20),
                            ),
                          )),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                                  endIndent: 10, color: Colors.grey[400])),
                          const Text("Or"),
                          Expanded(
                              child:
                                  Divider(indent: 10, color: Colors.grey[400])),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.purple,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30.0,
                                width: 30.0,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/logo.png'),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 18),
                              const Text(
                                "Sign In with Google",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.purple,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Already have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginPage();
                                }));
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Colors.purple),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 4),
    ));
  }
}
