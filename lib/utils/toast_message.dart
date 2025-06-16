import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app_with_provider/constant/colors.dart';

toastMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: AllColors.black,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
    fontSize: 16,
    textColor: AllColors.white,
  );
}
