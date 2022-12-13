import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/layout/Cubit/cubit.dart';
import 'package:meals/layout/Cubit/states.dart';
import 'package:meals/modules/Widget/Widget.dart';

import '../models/CategoryDetails.dart';

class IngredentsDetails extends StatelessWidget{
  String? text;
  IngredentsDetails({
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>MealsCubit()..GetDetailsIngredent(name: text!),
      child: BlocConsumer<MealsCubit,MealsStates>(
        listener: (context,state){
          var cubitt=MealsCubit.get(context);

          if(state is GetDetailsCategorySuccessState){
            // cubitt.GetDetailsCategory(name: na());
          }
        },
        builder: (context,state){
          var cubit=MealsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('${text}',style: Theme.of(context).textTheme.bodyText1,),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConditionalBuilder(
                  condition: cubit.DIModel !=null,
                  builder: (context)=>ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index)=>BuiltDetailsItem(cubit.DIModel!.meals![index],context),
                      separatorBuilder: (context,state)=>Container(height: 2,),
                      itemCount: cubit.DIModel!.meals!.length
                  ),
                  fallback: (context)=>Center(child: CircularProgressIndicator())
              ),
            ),
          );
        },

      ),
    );
  }


}