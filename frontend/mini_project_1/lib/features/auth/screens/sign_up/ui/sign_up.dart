import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_project_1/features/auth/screens/login/ui/login_screen.dart';
import 'package:mini_project_1/features/auth/screens/sign_up/bloc/sign_up_bloc.dart';
import 'package:mini_project_1/features/auth/screens/sign_up/repo/sign_up_repo.dart';
import 'package:mini_project_1/utils/constants/colors/app_colors.dart';
import 'package:mini_project_1/utils/helpers/flash_messages/flash_messages.dart';
import 'package:mini_project_1/utils/helpers/helper.dart';
import 'package:mini_project_1/utils/helpers/network/api_helper.dart';
import 'package:mini_project_1/utils/reusables/custom_elevated_button.dart';
import 'package:mini_project_1/utils/reusables/text_feild.dart';
import 'package:mini_project_1/utils/validator/validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

final TextEditingController _nameController = TextEditingController();
final TextEditingController _ageController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

final formKey = GlobalKey<FormState>();
final SignUpBloc _bloc = SignUpBloc(SignUpRepo(ApiHelper()));

@override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
     bool isDark = MHelper.isDarkMode(context);
   return BlocConsumer(
    bloc: _bloc,
    buildWhen: (previous, current) => current is !SignUpActionState,
    listenWhen: (previous, current) => current is SignUpActionState,
    builder: (context, state) {
      return  Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // heading section //
                SizedBox(height: MediaQuery.sizeOf(context).height*0.06,),
                SizedBox(
                    height:MediaQuery.sizeOf(context).height*0.4 ,
                    child: Lottie.asset('assets/animations/loginAnimation2.json',reverse:true)),
                Text("Sign Up",style: Theme.of(context).textTheme.displayLarge,),
                SizedBox(height: MediaQuery.sizeOf(context).height*0.06,),
                // form section //
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                         BeautifulTextField(label: 'Name', controller: _nameController,validator: Validator.validateName,prefixIcon: Icon(Icons.email,color: isDark ? AppColors.accent : AppColors.primary,),),
                          BeautifulTextField(label: 'Age', controller: _ageController,validator: Validator.validateName,prefixIcon: Icon(Icons.email,color: isDark ? AppColors.accent : AppColors.primary,),),
                        BeautifulTextField(label: 'Email', controller: _emailController,validator: Validator.validateEmail,prefixIcon: Icon(Icons.email,color: isDark ? AppColors.accent : AppColors.primary,),),
                        BeautifulTextField(label: 'Password', controller: _passwordController,validator: Validator.validatePassword,prefixIcon:  Icon(Icons.password,color:  isDark ? AppColors.accent : AppColors.primary,),obscureText: true,),
                        SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                        // login button //
                        if(state is SignUpLoadingState) const Center(child: CircularProgressIndicator(color: AppColors.primary,)),
                        if(state is SignUpInitialState) SizedBox(
                          width: MediaQuery.sizeOf(context).width*0.4,
                          child: CustomElevatedButton(text: 'SignUp', onPressed: () {
                    
                            if(formKey.currentState!.validate()){
                             _bloc.add(SignUpButtonClickedEvent(userData: {
                              'userName' : _nameController.text,
                              'age' : _ageController.text,
                              'email': _emailController.text,
                              'password' :_passwordController.text
                             }));
                            }
                    
                          },),
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? ",style: Theme.of(context).textTheme.labelMedium,),
                            InkWell(
                              onTap: (){
                                _bloc.add(BackButtonClickedEvent());
                              },
                              child: Text("Sign In",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primary),)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
            
              ],
            ),
          ),
        ),
      );
    }, listener: (context, state) {
      if(state is BackButtonClickedActionState){
        Navigator.pop(context);
      }else if(state is SignUpLoadedState){
        FlashMessages.successMsg(context: context, successTitle: 'Success', successDesc: 'User created successsfully');
         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen(),));
      }else if(state is SignUpErrorState){
        FlashMessages.errorMsg(context: context, errorTitle: state.errorTitle, errorDesc: state.errorDesc);
      }
    },);
  }
}