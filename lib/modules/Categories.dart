import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/layout/Cubit/cubit.dart';
import 'package:meals/layout/Cubit/states.dart';
import 'package:meals/models/CategoryModel.dart';
import 'package:meals/modules/CategoryDetails.dart';

class CategoriesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealsCubit,MealsStates>(
      listener: (context,state){
        var cubit=MealsCubit.get(context);
        if(state is GetCategorySuccessState){
          cubit.GetDataCategory();
        }
      },
      builder: (context,state){
        var cubit=MealsCubit.get(context);
        return Scaffold(
            body:ConditionalBuilder(
                condition: cubit.CModel != null,
                builder: (context)=>ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index)=>ListViewCategory(cubit.CModel!.categories![index],context),
                    separatorBuilder: (context,state)=>Container(height: 2,),
                    itemCount: cubit.CModel!.categories!.length
                ),
                fallback: (context)=>Center(child: CircularProgressIndicator())
            )
        );
      },

    );
  }
Widget ListViewCategory(Categories model,context)=> Padding(
  padding: const EdgeInsets.all(8.0),
  child: InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryDetails(text: model.strCategory, )));
    },
    child: Container(
      height: 100,
      width: double.infinity,
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35),
          child: Text(
            '${model.strCategory}',
            textAlign: TextAlign.center,
            style:Theme.of(context).textTheme.bodyText1
          ),
        ),
      ),
    ),
  ),
);
}