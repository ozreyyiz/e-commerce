import 'package:e_commerce/models/product_list.dart';

class CategoryService {
  

  
static  categoryIdService(int categoryId) {
   int categoryCount=0;
    for (var i = 0; i < products.length; i++) {
     
      if (categoryId==0) {
        categoryCount=products.length;
      }
     else if (products[i].categoryId == categoryId) {
        categoryCount++;
      }
      
    }
    return categoryCount;
  }
}
