import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ema/cubit/cubit/login_cubit.dart';
import 'package:ema/pages/home_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    bool loadingIndicator = false;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading)
            loadingIndicator = true;
          else if (state is LoginFalure) {
              loadingIndicator = false;
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(child: Row(
                        children: [
                        
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text(state.msg),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Icon(Icons.warning,color: Colors.amber,),
                          ),
                        ],
                      ))),
                  );
                });

           
          } else {
          
            loadingIndicator = false;
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ModalProgressHUD(
              inAsyncCall: loadingIndicator,
              child: Scaffold(
                body: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _header(context),
                      Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                onChanged: (data) => email = data,
                                validator: (data) {
                                  if (data == '')
                                    return 'email is empty';
                                  else if (data!.contains('@') == false)
                                    return ' please enter a valid email';
                                  else
                                    return null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: BorderSide.none),
                                    fillColor: Colors.purple.withOpacity(0.1),
                                    filled: true,
                                    prefixIcon: const Icon(Icons.person)),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                onChanged: (data) => password = data,
                                validator: (data) {
                                  if (data == '') {
                                    return 'password is empty';
                                  } else
                                    return null;
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
                              ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate())
                                    BlocProvider.of<LoginCubit>(context).login(
                                      email: email!,
                                      password: password!,
                                    );
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  backgroundColor: Colors.purple,
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          )),
                      _forgotPassword(context),
                      _signup(context),
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

  _header(context) {
    return const Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Enter your credential to login"),
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "Forgot password?",
        style: TextStyle(color: Colors.purple),
      ),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have an account? "),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.purple),
            ))
      ],
    );
  }

  void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 4),
    ));
  }
}
