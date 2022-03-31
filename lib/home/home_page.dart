import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_api/provider/food_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    didChangeDependencies();
  }

  @override
  void didChangeDependencies()async {
    super.didChangeDependencies();
    FoodProvider foodProvider = Provider.of<FoodProvider>(context,listen: false);
    await foodProvider.foodCategory();
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    
    
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    
    return Consumer<FoodProvider>(
        builder: (_,provider,___) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.emoji_food_beverage_outlined,
                      size:width/10,
                      color: Colors.red,),
                      SizedBox(
                        width: 10,
                      ),
                      Text("eFooti",
                      style: TextStyle(
                         fontSize: 25,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: width/2,
                      ),
                      Icon(FontAwesomeIcons.bell),
                    ],
                  ),
                ),
                SizedBox(
                  height: height/9,
                ),
              Container(
                padding: EdgeInsets.only(left:20,right:20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(FontAwesomeIcons.search),
                    hintText: "Search you're looking for",
                    hintStyle:
                    TextStyle(color: Colors.grey, fontSize: 15),
                  suffixIcon: Icon(Icons.menu),

                ),
               ),
              ),
                SizedBox(
                  height: height/8,
                ),
                Container(
                  height: height/2,
                  width: width/1.1,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:10, left:10),
                        child: Text("All Categories",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      SizedBox(
                        height: height/6,
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     ListView.builder(
                      //       shrinkWrap: true,
                      //       scrollDirection: Axis.vertical,
                      //       itemCount: 2,
                      //       itemBuilder: (context,index){
                      //         return Column(
                      //           children: [
                      //             Padding(
                      //               padding: const EdgeInsets.only(left:10),
                      //               child: CircleAvatar(
                      //                 radius: 25,
                      //                 backgroundColor: Colors.red,
                      //               ),
                      //             ),
                      //             Text(provider.categoryModel.data![index].link!),
                      //           ],
                      //         );
                      //       },
                      //     ),
                      //
                      //   ],
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
