import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/bloc/theme_bloc.dart';
import 'package:sample/bloc/theme_stats.dart';
import 'package:sample/core/cache/cache_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        int counterValue = AppCubit.get(context).counterValue;
        return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          actions: [
            Switch(
                value: CacheHelper.getBoolean('is_dark') ?? false,
                onChanged: (value) {
                  AppCubit.get(context).changeTheme(value);
                }),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Counter',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                counterValue.toString(),
                style: TextStyle(fontSize: 17.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        AppCubit.get(context).decrementCounter(counterValue.toString());
                      },
                      icon: Icon(Icons.remove)),
                  IconButton(onPressed: () {
                    AppCubit.get(context).incrementCounter(counterValue.toString());
                  }, icon: Icon(Icons.add)),
                ],
              )
            ],
          ),
        ),
      );
      },
    );
  }
}
