import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/bloc/theme_bloc.dart';
import 'package:sample/core/cache/cache_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          actions: [
            Switch(
                value: CacheHelper.getBoolean('is_dark') ?? false,
                onChanged: (value) {
                  ThemeCubit.get(context).changeTheme(value);
                }),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text('Counter', style: TextStyle(fontSize: 20.0 ),),
              Text('0', style: TextStyle(fontSize: 17.0),),
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
