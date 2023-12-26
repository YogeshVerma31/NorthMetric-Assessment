
import '../../../utils/typedef.dart';
import '../../model/products_model.dart';

abstract class ProductsRepository {
  EitherRequest<List<ProductsModelData>>? getProducts();

  // EitherRequest<String>? verifyOtp(String mobileNumber, String otp);
}
