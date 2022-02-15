import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:storapppp/models/product_model.dart';
import 'package:storapppp/services/update_product.dart';
import 'package:storapppp/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({Key? key}) : super(key: key);
  static String id = 'UpdateProduct';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? ProductName, description, image;
  String? price;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return BlurryModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              CustomTextField(
                hintText: 'Product Name',
                obscureText: false,
                onChanged: (data) {
                  ProductName = data;
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Description',
                obscureText: false,
                onChanged: (data) {
                  description = data;
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Price',
                obscureText: false,
                onChanged: (data) {
                  price = data ;
                },
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Image',
                obscureText: false,
                onChanged: (data) {
                  image = data;
                },
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  try
                  {
                    await updateProduct(product);
                    print('Sucsess');
                  }catch(e)
                  {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // MaterialButton(
              //     onPressed: (){},
              //   height: 70,
              //   color: Colors.red,
              //   child: Text('button'),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
   await UpdateProductService().updateProduct(
        id: product.id,
        title: ProductName == null ? product.title : ProductName!,
        desc: description == null ? product.description : description!,
        image: image == null ? product.image : image!,
        price: price == null ? product.price.toString() : price!,
        category: product.category);
  }
}
