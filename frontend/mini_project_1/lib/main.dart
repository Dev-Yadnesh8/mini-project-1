import 'package:flutter/material.dart';
import 'package:mini_project_1/utils/routes/route_names.dart';
import 'package:mini_project_1/utils/routes/routes.dart';
import 'package:mini_project_1/utils/theme/theme.dart';
import 'package:mini_project_1/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel(),)

      ],child: MaterialApp(
      title: 'Mini Project 1',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: RouteNames.login,
      onGenerateRoute: Routes.generateRoute,
    ),);
  
  }
}
