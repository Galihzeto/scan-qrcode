import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:scan_qrcode/data/accountDb.dart';
import 'package:scan_qrcode/feature/dashboard/dashboard_page.dart';
import 'package:scan_qrcode/model/nik_model.dart';

class RegisterController extends GetxController {
  var isSaved = false.obs;
  var isLoading = false.obs;
  var result = 0;
  void saveToLocal({NikModelLocal? nikModel}) async {
    try {
      isLoading(true);
      // await AccountDb.instance.deleteAllNikModelLocal();
      result = await AccountDb.instance.insertNikModelLocal(
        NikModelLocal(
          nik: nikModel!.nik,
          name: nikModel.name,
          age: nikModel.gender,
          bornDate: nikModel.bornDate,
          province: nikModel.province,
          city: nikModel.city,
          subdistrict: nikModel.subdistrict,
          uniqueCode: nikModel.uniqueCode,
          postalCode: nikModel.postalCode,
          ageDay: nikModel.ageDay,
          ageMonth: nikModel.ageMonth,
          ageYear: nikModel.ageYear,
          zodiac: nikModel.zodiac,
          valid: nikModel.valid,
          nextBirthday: nikModel.nextBirthday,
        ).toDb(),
      );
    } finally {
      if (result != 0) {
        isLoading(false);
        isSaved(true);
        Get.to(DashboardPage());
      }
    }
  }
}
