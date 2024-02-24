import 'package:flutter/material.dart';
import 'package:sample/core/cache/cache_helper.dart';
import 'package:sample/login.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  var isDark = CacheHelper.getBoolean('is_dark') ?? false;
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  const MyApp(
      this.isDark,
      {super.key});
  final bool? isDark;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            foregroundColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.all(Radius.circular(20.0))
              )
            )
          )
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: isDark! ? ThemeMode.dark: ThemeMode.light,
      home: LoginPage(),
    );
  }
}
