import 'package:flutter/cupertino.dart';
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


  List<String> imageLocationForCategories = [
    "assets/images/thai.jpg",
    "assets/images/indian.jpg",
    "assets/images/korean.jpg",
    "assets/images/bangladeshi.jpg"
  ];
  
  
  
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
                SizedBox(
                  height: height/10,
                ),
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
                margin: EdgeInsets.only(left:30,right:30),
                padding: EdgeInsets.only(left:10,right:10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10)
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
                  height: height/12,
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
                        padding: const EdgeInsets.only(top:30, left:10),
                        child: Text("All Categories",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      SizedBox(
                        height: height/10,
                      ),
                      provider.isLoading == false? CircularProgressIndicator():
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context,index){
                            return SizedBox(
                              width: width/18,
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.categoryModel.data!.length,
                          itemBuilder: (context,index){
                            return Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:10),
                                    child: CircleAvatar(
                                      radius: 30,
                                      //backgroundColor: Colors.red,
                                      backgroundImage: AssetImage(imageLocationForCategories[index]),
                                    ),
                                  ),
                                  SizedBox(
                                    height:height/35
                                  ),
                                  Text(provider.categoryModel.data![index].link!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height:height/14,
                ),
                Container(
                  height: height/1.5,
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
                        padding: const EdgeInsets.only(left:8.0,top:13,right:8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Set Menu",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                             ),
                            ),
                            Text("View all")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height/20,
                      ),
                      Expanded(
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            separatorBuilder: (context,index){
                              return SizedBox(

                              );
                            },
                            itemCount: 5,
                           itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.only(left:15),
                                child: Container(
                                  height: height/2.1,
                                  width: width/2,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/4,
                                        width: width/1,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/set_menu_1.jpg"
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                      SizedBox(
                                        height:height/50,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text("Bengali Breakfast",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text("Set Menu",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:height/20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text("\$50",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              );
                           },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.red,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.grey,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.heart),
                label: "Favourites",
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: "Menu",
                backgroundColor: Colors.green,
              ),

            ],
          ),
        );
      }
    );
  }
}
