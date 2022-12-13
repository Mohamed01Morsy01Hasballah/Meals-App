import 'package:flutter/material.dart';
import 'package:meals/modules/DetailsScreen.dart';

import '../../models/CategoryDetails.dart';
import '../OnBoarding.dart';

Widget BuiltDetailsItem(model,context)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(id: model.idMeal,)));
    },
    child: Container(
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
              height: 120,
              width: 130,
              child: Image(image: NetworkImage('${model.strMealThumb}'))),
          SizedBox(width: 10,),
          Expanded(
            child: Text('${model.strMeal}',
              style:Theme.of(context).textTheme.bodyText1
            ),
          )
        ],
      ),
    ),
  ),
);
Widget BuiltItem(MealsA model)=>Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Expanded(child: Image.asset('${model.image}')),
    Text('${model.title}',style: TextStyle(fontSize: 20,color: Colors.deepOrange),),
    SizedBox(height: 20,),

    Text('${model.des}',style: TextStyle(fontSize: 15,color: Colors.black))
  ],
);