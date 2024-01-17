import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/bloc/login_bloc.dart';
import 'package:trading_app/components/textformfield_components/textformfield_with_suffix_icon.dart';
import 'package:trading_app/helpers/colors.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  late LoginBloc loginBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc,LoginState>(listener: (context, state) {
      if(state is LoginLoading)
        {

        }
      else if(state is  LoginSuccess)
        {
          final snackBar = SnackBar(content: Text(state.message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      else if(state is LoginFailed)
        {
          final snackBar = SnackBar(content: Text(state.message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
    },child: Scaffold(
      backgroundColor: COLORS.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Row(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration:const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/login/login_image.png",),fit: BoxFit.fill),
                  ),
                  child:  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("GoFinance",style: TextStyle(
                            color: COLORS.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                            fontSize:25
                        ),),
                        const Text("The most popular peer to peer lending at SEA",style: TextStyle(
                            color: COLORS.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize:15
                        ),),
                        const SizedBox(height: 5,),
                        ElevatedButton(onPressed: (){},
                          style:const  ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(COLORS.blue),
                              elevation: MaterialStatePropertyAll(0)
                          ),
                          child: const Text("Read More",style: TextStyle(
                              color: COLORS.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize:13
                          ),),)
                      ],
                    ),
                  )
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Hello Again!",style: TextStyle(
                          color: COLORS.blackLight,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          fontSize:25
                      ),),
                      const Text("Welcome Back",style: TextStyle(
                          color: COLORS.blackLight,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize:15
                      ),),
                      const SizedBox(height: 10,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.20,
                        child: TextFormFieldWithSuffix(
                          prefixIcon: Icons.mail_outline_outlined,
                          controller:emailAddress ,
                          onChanged: (value){},
                          hintText:"Email Address" ,
                          validator:  (String? value) {
                            String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                            RegExp regex = RegExp(pattern);
                            if (value!.trim().isEmpty) {
                              return 'Email is Empty';
                            } else if (!regex.hasMatch(value)) {
                              return 'Email is not valid';
                            }
                            return null;
                          },
                          inputType: TextInputType.emailAddress,

                        ),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.20,
                        child: TextFormFieldWithSuffix(
                          prefixIcon: Icons.lock,
                          controller:password ,
                          onChanged: (value){},
                          hintText:"Password" ,
                          validator:  (String? value) {
                            if (value!.trim().isEmpty) {
                              return 'Password is Empty';
                            }
                            return null;
                          },
                          inputType: TextInputType.text,

                        ),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.20,
                        height: 40,
                        child: ElevatedButton(onPressed: (){
                          if(_formKey.currentState!.validate())
                          {
                              loginBloc.add(LoginWithEmailEvent(email: emailAddress.text, password: password.text));
                          }
                        },
                          style:const  ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(COLORS.blue),
                              elevation: MaterialStatePropertyAll(0)
                          ),
                          child: const Text("Login",style: TextStyle(
                              color: COLORS.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize:13
                          ),),),
                      ),
                      const SizedBox(height: 5,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.20,
                        child: Center(
                          child: InkWell(
                            onTap: (){},
                            child: const Text("Forgot Password",style: TextStyle(
                                color: COLORS.blackLight,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize:12
                            ),),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              )
            ],
          ),

        ),
      ),
    ),);
  }
}
