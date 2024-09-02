import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plan_shop_app/Model/plant_model.dart';

class PlantShopHomeScreen extends StatefulWidget {
  const PlantShopHomeScreen({super.key});

  @override
  State<PlantShopHomeScreen> createState() => _PlantShopHomeScreenState();
}

class _PlantShopHomeScreenState extends State<PlantShopHomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TomDev",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.shopping_cart_rounded,
                  size: 30,
                )
              ],
            ),
            SizedBox(height: 12),
            Text(
              "Plant Shop",
              style: TextStyle(
                  fontSize: 35, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  searchField(),
                  SizedBox(width: 10),
                  shortItemButton()
                ],
              ),
            ),
            // for category selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                shopCategoryItems(
                  title: "POPULAR",
                  isActive: true,
                ),
                shopCategoryItems(title: "ORGANIC"),
                shopCategoryItems(title: "INDOORS"),
                shopCategoryItems(title: "SYNTHETIC"),
              ],
            ),
            SizedBox(height: 25),
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 22,
                crossAxisSpacing: 22,
                itemCount: product.length,
                itemBuilder: (context, index) {
                  var shopProduct = product[index];
                  return GestureDetector(
                    onTap: () {
                      // Handle onTap event
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(0.15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(100, 25)),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Image.asset(
                                  shopProduct.image,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {

                                },
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: shopProduct.isFavorited ? Colors.pink.shade50 : Colors.grey.shade400,
                                    ),
                                    child: Icon(Icons.favorite,color: shopProduct.isFavorited ? Colors.pink : Colors.black,),
                                  ),
                                ),
                              ),
                            ],

                          ),

                          SizedBox(height: 5,),
                          Text(shopProduct.title , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 17),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text( " ${shopProduct.price} VNĐ" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: selectedIndex == index ? Colors.green : Colors.grey.shade400,
                                ),
                                child: Icon(Icons.add , color: Colors.white,),
                              )
                            ],
                          )
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
    );
  }

  Widget searchField() {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: Icon(
            Icons.search,
            size: 30,
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Widget shortItemButton() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      child: RotatedBox(
        quarterTurns: 4,
        child: Icon(
          Icons.tune,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget shopCategoryItems({bool isActive = false, required String title}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              color: isActive ? Colors.green : Colors.grey,
              fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          height: 4,
          width: 35,
          decoration: isActive
              ? BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10))
              : BoxDecoration(),
        ),
      ],
    );
  }
}
