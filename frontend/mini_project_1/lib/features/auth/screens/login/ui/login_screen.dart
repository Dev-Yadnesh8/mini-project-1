import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_project_1/features/auth/controllers/authentication_cubit.dart';
import 'package:mini_project_1/features/auth/screens/sign_up/ui/sign_up.dart';
import 'package:mini_project_1/utils/constants/colors/app_colors.dart';
import 'package:mini_project_1/utils/helpers/flash_messages/flash_messages.dart';
import 'package:mini_project_1/utils/helpers/helper.dart';
import 'package:mini_project_1/utils/reusables/custom_elevated_button.dart';
import 'package:mini_project_1/utils/validator/validator.dart';

import '../../../../../utils/reusables/text_feild.dart';
import '../bloc/login_bloc.dart';


class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final LoginBloc loginBloc = LoginBloc(AuthenticationCubit());

@override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    bool isDark = MHelper.isDarkMode(context);
    return BlocConsumer<LoginBloc,LoginState>(
      bloc:loginBloc ,
      buildWhen: (previous, current) => current is !LoginActionState,
      listenWhen: (previous, current) => current is LoginActionState,
      builder: (context, state) {
      return  Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // heading section //
              SizedBox(height: MediaQuery.sizeOf(context).height*0.06,),
              SizedBox(
                  height:MediaQuery.sizeOf(context).height*0.4 ,
                  child: Lottie.asset('assets/animations/loginAnimation2.json',reverse:true)),
              Text("Login",style: Theme.of(context).textTheme.displayLarge,),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.06,),
              // form section //
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      BeautifulTextField(label: 'Email', controller: _emailController,validator: Validator.validateEmail,prefixIcon: Icon(Icons.email,color: isDark ? AppColors.accent : AppColors.primary,),),
                      BeautifulTextField(label: 'Password', controller: _passController,validator: Validator.validatePassword,prefixIcon:  Icon(Icons.password,color:  isDark ? AppColors.accent : AppColors.primary,),obscureText: true,),
                      SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                      // login button //
                      if(state is LoginLoadingState) const Center(child: CircularProgressIndicator(color: AppColors.primary,)),
                      if(state is LoginInitialState) SizedBox(
                        width: MediaQuery.sizeOf(context).width*0.4,
                        child: CustomElevatedButton(text: 'Login', onPressed: () {

                          if(formKey.currentState!.validate()){
                            loginBloc.add(LoginButtonClickedEvent(userCred: {
                              'email' : _emailController.text,
                              'password' : _passController.text,
                            }));
                          }

                        },),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? ",style: Theme.of(context).textTheme.labelMedium,),
                          InkWell(
                            onTap: (){
                              loginBloc.add(CreateOneButtonClickActionEvent());
                            },
                            child: Text("Create One",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primary),)),
                        ],
                      )
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      );
    }, listener: (context, state) {
      if(state is LoginErrorState){
        FlashMessages.errorMsg(context: context, errorTitle: state.errorTitle, errorDesc: state.errorDesc);
      }else if(state is LoginLoadedState){
        FlashMessages.successMsg(context: context, successTitle: 'Hurry!!', successDesc: 'Logged in successfully');
      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
      }if(state is CreateOneButtonClickActionState){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
      }
    },);

  }
}
