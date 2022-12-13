import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals/layout/Cubit/cubit.dart';
import 'package:meals/layout/Cubit/states.dart';

import 'Widget/Widget.dart';

class SearchScreen extends StatelessWidget{
  var title=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller:title ,


                    decoration: InputDecoration(
                        suffixIcon: IconButton(icon:Icon(Icons.search) ,
                          onPressed: (){
                            MealsCubit.get(context).GetSearchMeals(name: title.text);
                          },),
                        hintText:'Enter Meals' ,
                        label: Text('Search'),
                        border: OutlineInputBorder()


                    ),
                  ),
                ),
              ),
              SizedBox(height:20 ,),
              //if(state is GetSearchSuccesstate)

                Expanded(
                  child: ConditionalBuilder(
                      condition: MealsCubit.get(context).search !=null,
                      builder: (context)=>ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context,index)=>BuiltDetailsItem(MealsCubit.get(context).search!.meals![index],context),
                          separatorBuilder: (context,state)=>Container(height: 2,),
                          itemCount: MealsCubit.get(context).search!.meals!.length
                      ),
                      fallback: (context)=>Center(child: CircularProgressIndicator())
                  ),
                ),


            ]
        ),

      ),
    );

  }

}