import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/layout/Cubit/cubit.dart';
import 'package:meals/layout/Cubit/states.dart';

import '../models/CategoryDetails.dart';
import 'Widget/Widget.dart';

class CategoryDetails extends StatelessWidget{
   String? text;
  CategoryDetails({
    required this.text,
});
  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (context)=>MealsCubit()..GetDetailsCategory(name: text!),
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
                 condition: cubit.DCModel !=null,
                 builder: (context)=>ListView.separated(
                     physics: BouncingScrollPhysics(),
                     itemBuilder: (context,index)=>BuiltDetailsItem(cubit.DCModel!.meals![index],context),
                     separatorBuilder: (context,state)=>Container(height: 2,),
                     itemCount: cubit.DCModel!.meals!.length
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