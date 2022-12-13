import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/Theme/Theme.dart';
import 'package:meals/layout/Cubit/cubit.dart';
import 'package:meals/layout/Cubit/states.dart';
import 'package:meals/layout/Meals_App.dart';
import 'package:meals/modules/OnBoarding.dart';
import 'package:meals/network/Diohelper.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DioHelper.init();

    return BlocProvider(

      create: (context)=>MealsCubit()..GetDataCategory()..GetDataArea()..GetDataIngredient(),
      child:  BlocConsumer<MealsCubit,MealsStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=MealsCubit.get(context);
          return MaterialApp(
            theme:lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark: ThemeMode.light,
            debugShowCheckedModeBanner: false,

            home: OnBoarding(),
          );
        },

      ),
    );
  }
}

