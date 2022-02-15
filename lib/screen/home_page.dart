import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storapppp/models/product_model.dart';
import 'package:storapppp/services/get_all_product_services.dart';
import 'package:storapppp/widgets/stack_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
 static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('New Trend',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.cartPlus,color: Colors.black,)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 65),
        child: FutureBuilder<List<ProductModel>>
          (
          future: AllProductService().getAllProduct(),
          builder: (context,snapshot)
          {

              if(snapshot.hasData)
              {
                List<ProductModel> product = snapshot.data!;
                return GridView.builder(
                    itemCount: product.length,
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 35
                    ),
                    itemBuilder: (context,index)
                    {
                      return CustomCard(product: product[index],);
                    }
                );
              } else if(snapshot.hasError)
              {
                return Center(child: Text('Error'),);
              }

              return Center(child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('images/18.png'),height: 200,width: 200,),
                  SizedBox(height: 20,),
                  Text('.. جاري التحميل',style: TextStyle(
                    fontFamily: 'Almarai-Regular',
                      fontSize: 30,color: Colors.deepPurple),),
                ],
              ));

          },
        ),
      ),
    );
  }
}
