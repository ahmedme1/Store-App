import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storapppp/models/product_model.dart';
import 'package:storapppp/screen/update_product.dart';

class CustomCard extends StatelessWidget {
   CustomCard({Key? key,required this.product}) : super(key: key);
 ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 130,
            width: 220,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 40,
                  spreadRadius: 0,
                  offset: Offset(10,10),
                ),
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(product.title.substring(0,6),style: TextStyle(color: Colors.grey,fontSize: 16),),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                         r'$''${product.price.toString()}',style: TextStyle(color: Colors.grey,fontSize: 16),),
                        Icon(Icons.favorite,color: Colors.red,),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: 80,
              top: -55,
              child: Image.network(product.image,height: 100,width: 100,)
          ),
        ],
      ),
    );
  }
}
