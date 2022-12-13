import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/layout/Cubit/cubit.dart';
import 'package:meals/layout/Cubit/states.dart';
import 'package:meals/models/AreaModel.dart';
import 'package:meals/models/CategoryModel.dart';
import 'package:meals/modules/AreaDetails.dart';

class DutiesOfTheCountry extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealsCubit,MealsStates>(
      listener: (context,state){
        var cubit=MealsCubit.get(context);
        if(state is GetAreaSuccessState){
          cubit.GetDataArea();
        }
      },
      builder: (context,state){
        var cubit=MealsCubit.get(context);
        return Scaffold(
            body:ConditionalBuilder(
                condition: cubit.AModel != null,
                builder: (context)=>ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index)=>ListViewCategory(cubit.AModel!.meals![index],context),
                    separatorBuilder: (context,state)=>Container(height: 2,),
                    itemCount: cubit.AModel!.meals!.length
                ),
                fallback: (context)=>Center(child: CircularProgressIndicator())
            )
        );
      },

    );
  }
  Widget ListViewCategory(Meals model,context)=> Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AreaDetails(text: model.strArea, )));

      },
      child: Container(
        height: 100,
        width: double.infinity,
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: Text(
              '${model.strArea}',
              textAlign: TextAlign.center,
              style:Theme.of(context).textTheme.bodyText1
            ),
          ),
        ),
      ),
    ),
  );
}