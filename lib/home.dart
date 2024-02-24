import 'package:flutter/material.dart';
import 'package:sample/core/cache/cache_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),
        actions: [
          Switch(value: CacheHelper.getBoolean('is_dark') ?? false, onChanged: (value) {
            setState(() {
              CacheHelper.putBoolean('is_dark', value);
            });
          }),
        ],),
      body: Center(
        child: Text('Welcome, ${CacheHelper.getString('user_email')}'),
      ),
    );
  }

}