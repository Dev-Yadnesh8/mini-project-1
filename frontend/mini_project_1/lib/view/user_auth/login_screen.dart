import 'package:flutter/material.dart';
import 'package:mini_project_1/resources/components/custom_elevated_button.dart';
import 'package:mini_project_1/utils/toast/toast_utils.dart';
import 'package:mini_project_1/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController(text: "eve.holt@reqres.in");
  final TextEditingController _passwordController = TextEditingController(text:"cityslicka" );

  @override
  Widget build(BuildContext context) {
    print("BUILD");
    final provider =  Provider.of<AuthViewModel>(context);
    return  Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              autofocus: true,
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.alternate_email)
              )
            ),
            SizedBox(height: 30,),
            ValueListenableBuilder(
              valueListenable: _obscureText,
              builder: (context, value, child) {
             return   TextFormField(
              controller: _passwordController,
                  autofocus: true,
                  obscureText: _obscureText.value,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                     labelText: "Password",
                    prefixIcon: Icon(Icons.lock_outlined),
                    suffixIcon: InkWell(
                      onTap: () {
                        _obscureText.value = !_obscureText.value;
                      },
                      child: Icon(
                        value ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                );
            
              },
            ),
            const SizedBox(height: 40,),
            CustomElevatedButton(
              lable: 'Login',
              isLoading: provider.loading, onPressed: () {
              if(_emailController.text.isEmpty){
                ToastUtils.showToast(message: 'Email cannot be empty',toastType: ToastType.error);
                }else if(_passwordController.text.isEmpty){
                  ToastUtils.showToast(message: 'Password cannot be empty',toastType: ToastType.error);
                }else if(_passwordController.text.length < 6){
                   ToastUtils.showToast(message: 'Password must be atlest 6 characters long',toastType: ToastType.error);
                }else{
                  Map data = {
                    'email' : _emailController.text.toString(),
                    'password' : _passwordController.text.toString(),
                  };
                  provider.login(data, context);
                }
            },)
        
        
          ],
        ),
      ),
    );
  }
}