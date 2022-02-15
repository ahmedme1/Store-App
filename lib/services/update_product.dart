import 'package:storapppp/helper/api.dart';
import 'package:storapppp/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category,
      required int id,
      }) async {
    print('id = $id');
    Map<String, dynamic> data = await Api().Put(
      url:'https://fakestoreapi.com/products/$id',
      body: {
        'title': title ,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
