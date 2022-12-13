import 'package:flutter/material.dart';
import 'package:meals/layout/Meals_App.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Widget/Widget.dart';

class MealsA{
  String? image;
  String? title;
  String? des;
  MealsA({
    required this.title,
    required this.image,
    required this.des
});
}
class OnBoarding extends StatefulWidget{
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  bool last=true;

  var controller=PageController();

  List<MealsA> boarding=[
    MealsA(
        title: 'Salmon',
        des: 'THE salmon recipe of your dreams! A complete meal on one pan full of flavour. Garlic Butter Baked Salmon is easy to make using minimal ingredients you already have in your kitchen! PLUS the bonus of having only one pan to wash and no mess in your kitchen to clean up when your done.',
        image: 'images/assets/download.jpg',

    ),
    MealsA(
      title: 'Chicken',
      des: 'hicken meal is the dry rendered product from a combination of clean chicken flesh and skin with or without accompanying bone, derived from whole carcasses of chicken, exclusive of feathers, heads, feet and entrails',
      image: 'images/assets/th (6).jpeg',

    ),
    MealsA(
      title: 'Dessert',
      des:'This chocolate mousse recipe cooks the egg yolk in the first step, so you dont have to worry about raw eggs in your dessert. When the mixture thickens, it means the egg is fully cooked.',
      image: 'images/assets/dessert.jpg',

    ),
    MealsA(
      title: 'Meat',
      des: 'Use Meat Bring your steak to room temperature. Cold meat will seize in a hot environment. Let it hang outside of the fridge for about 30 minutes while you preheat your oven',
      image: 'images/assets/meat.jpg',

    ),

  ];

  @override
  Widget build(BuildContext context) {
  return  Scaffold(
    appBar: AppBar(
      actions: [
        TextButton(onPressed: (){
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context)=>Meals()),
                  (route) => false);
        }, child: Text('Skip'))
      ],
    ),
    body:   Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemBuilder: (context,index)=>BuiltItem(boarding[index]),
              itemCount: boarding.length,
              controller: controller,
              onPageChanged: (int index){
                  if(index==boarding.length-1){
                    setState(() {
                      last=true;
                    });

                  }else{
                    setState(() {
                      last=false;
                    });
                  }
              },
            ),
          ),
          SizedBox(height: 60,),

          Row(
            children: [
              SmoothPageIndicator(
                controller: controller,
                count: boarding.length,
                effect:ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.deepOrange,
                    expansionFactor: 4,
                    spacing: 5
                ),
              ),
              Spacer(),
              FloatingActionButton(
                onPressed: (){
                if(last){
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context)=>Meals()),
                          (route) => false);
                }else{
                  controller.nextPage(duration: Duration(milliseconds: 760), curve: Curves.fastLinearToSlowEaseIn);
                }

              },
              child: Icon(Icons.arrow_forward_ios),)
            ],
          ),

        ],
      ),
    ),
  );
  }


}