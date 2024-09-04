import 'package:flutter/material.dart';
import 'package:plan_shop_app/Model/plant_model.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  Icon(Icons.shopping_cart_rounded , opticalSize: 30,)
                ],
              ),
            ),
            SizedBox(height: 1,),
            ProductImage(),
            const SizedBox(height: 15,),
            Expanded(child: Container(
              padding: EdgeInsets.only(top: 28 , left: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)
                ),
                color: Colors.grey.withOpacity(0.1)
              ),
              child: ProductDetailsmall(),
            ))
          ],
        ),
      ),
    );
  }
  Widget ProductImage () {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 45,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.all(
                    Radius.elliptical(300, 45)),
              ),
            ),
          ),
        ),
        Center(
          // hero tạo hiệu ứng chuyển cảnh mượt
          child:Hero(tag: product.image,
              child:  Image.asset(
                product.image,
                width: 320,
                fit: BoxFit.cover,
              ),)
        ),
      ],
    );
  }
  Widget ProductDetailsmall () {
    return ListView(
        physics: BouncingScrollPhysics(),
      children: [
        Row(
          children: [
            SizedBox(width: 45, child: Divider(
              color: Colors.black,
              thickness: 3,
            ),),
            SizedBox(width: 10,),
            Text("Best Chice" , style: TextStyle(fontWeight: FontWeight.bold ),)
          ],
        ),
        SizedBox(height: 25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                color: Colors.green
              ),
              child: Text("${product.price} VNĐ" , style: TextStyle(fontSize:18, fontWeight: FontWeight.bold, color: Colors.white  ),),
            ),
          ],
        ),
        SizedBox(height: 25,),
        const Text("About" , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        SizedBox(height: 25,),
        Padding(padding: EdgeInsets.only(right: 15),
          child: Text(product.description , style: TextStyle(fontSize: 16),),
        ),
        SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                OutlinedButton(onPressed: () {

                },
                    child: Icon(Icons.remove)),
                SizedBox(width: 15,),
                Text("1" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                SizedBox(width: 15,),
                OutlinedButton(onPressed: () {

                },
                    child: Icon(Icons.add)),
              ],
            ),
            Padding(padding: EdgeInsets.only(right: 15),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 75),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.green,

                ),
                child: Text("Buy" , style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
              ),

            ),
          ],
        ),
    SizedBox(height: 20,),
    Text("Please , checkout before to buy !" , style:const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)

      ],
    );
  }
}
