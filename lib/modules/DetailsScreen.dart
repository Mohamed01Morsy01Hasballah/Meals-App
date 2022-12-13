
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/layout/Cubit/cubit.dart';
import 'package:meals/layout/Cubit/states.dart';

import '../models/DetailsMealsModel.dart';

class DetailsScreen extends StatelessWidget{
   String? id;

  DetailsScreen({
  required this.id
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>MealsCubit()..GetDetailsMeals(name:id!),
      child: BlocConsumer<MealsCubit,MealsStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=MealsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  'Details Product'
              ),

            ),
            body: ConditionalBuilder(
                condition: cubit.details !=null,
                builder: (context)=>ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index)=>BuiltDetails(cubit.details!.meals![index],context),
                    separatorBuilder: (context,state)=>Container(height: 2,),
                    itemCount: cubit.details!.meals!.length
                ),
                fallback: (context)=>Center(child: CircularProgressIndicator())
            ),
          );
        },

      ),
    );
  }
Widget BuiltDetails(MealsD model ,context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          height: 300,
          width: double.infinity,
          child: Image(image: NetworkImage('${model.strMealThumb}'))
      ),
      SizedBox(height: 40,),
      Text(
        'Title :${model.strMeal} ',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      SizedBox(height: 20,),
      SizedBox(height: 20,),

      Text(
        'Category :${model.strCategory}',
        style:  Theme.of(context).textTheme.bodyText1,
      ),
      SizedBox(height: 15,),
      Text(
        'Country :${model.strArea}',
        style:  Theme.of(context).textTheme.bodyText2,
      ),
      SizedBox(height: 15,),

      Text(
        'description  :${model.strInstructions}',
        maxLines: 6,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.subtitle1,
      ),




    ],
  ),
);
}