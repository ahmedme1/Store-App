import 'package:storapppp/helper/api.dart';
import 'package:storapppp/models/product_model.dart';

class AllProductService
{
  Future<List<ProductModel>> getAllProduct() async
  {
       List<dynamic> data = await Api().get(url:'https://fakestoreapi.com/products', token: '');
       List<ProductModel> productLists = [];
       for(int i=0; i<data.length; i++)
       {
         productLists.add(ProductModel.fromJson(data[i]));
       }
       return productLists;

  }

}