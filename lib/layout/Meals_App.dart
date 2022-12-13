import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/layout/Cubit/cubit.dart';
import 'package:meals/modules/SearchScreen.dart';

import 'Cubit/states.dart';

class Meals extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return BlocConsumer<MealsCubit,MealsStates>(
    listener: (context,state){

    },
    builder: (context,state){
      var cubit=MealsCubit.get(context);
      return  Scaffold(
      appBar: AppBar(
      title: Text('${cubit.title[cubit.currentIndex]} ',
          style:Theme.of(context).textTheme.bodyText1),
        centerTitle: true,
    actions: [
    IconButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
    }, icon: Icon(Icons.search)),
    IconButton(onPressed: (){
      cubit.changeTheme();
    }, icon: Icon(Icons.settings))
    ],
    ),
      bottomNavigationBar: BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    onTap: (index){
      cubit.ChangeBottom(index);
    },
    currentIndex: cubit.currentIndex,
    items: [
    BottomNavigationBarItem(
    icon: Icon(Icons.category_outlined),
    label: 'Category'
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.set_meal_sharp),
    label: 'Area'
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.emoji_food_beverage),
    label: 'ingredient'
    ),

    ],
    ),
        body: cubit.Screen[cubit.currentIndex],

    );
    }
  );
    }


  }

