import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:nik_validator/nik_validator.dart';
import 'package:scan_qrcode/feature/register/register_controller.dart';
import 'package:scan_qrcode/model/nik_model.dart';
import 'package:scan_qrcode/widget/rounded_button.dart';

class RegisterForm extends StatefulWidget {
  final NIKModel? result;
  RegisterForm({this.result});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final RegisterController _controller = Get.put(RegisterController());

  TextEditingController _nikController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _bornDateController = TextEditingController();
  TextEditingController _provinceController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _subdistrictController = TextEditingController();
  TextEditingController _postalCodeController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  initState() {
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    _nikController = TextEditingController(text: widget.result!.nik);
    _genderController = TextEditingController(text: widget.result!.gender);
    _bornDateController = TextEditingController(text: widget.result!.bornDate);
    _provinceController = TextEditingController(text: widget.result!.province);
    _cityController = TextEditingController(text: widget.result!.city);
    _subdistrictController =
        TextEditingController(text: widget.result!.subdistrict);
    _postalCodeController =
        TextEditingController(text: widget.result!.postalCode);
    _ageController = TextEditingController(text: widget.result!.age);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: false,
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(child: Obx(() {
      if (_controller.isLoading.value == false) {
        Loader.hide();
      } else {
        Loader.show(context,
            isAppbarOverlay: true,
            isBottomBarOverlay: false,
            progressIndicator: CircularProgressIndicator(),
            themeData: Theme.of(context).copyWith(accentColor: Colors.black38),
            overlayColor: Color(0x99E8EAF6));
      }
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            textFormWidget(title: "NIK", controller: _nikController),
            textFormWidget(title: "Nama", controller: _nameController),
            textFormWidget(
                title: "Jenis Kelamin", controller: _genderController),
            textFormWidget(title: "Usia", controller: _ageController),
            textFormWidget(
                title: "Ulang Tahun", controller: _bornDateController),
            textFormWidget(title: "Provinsi", controller: _provinceController),
            textFormWidget(
                title: "Kabupaten/Kota", controller: _cityController),
            textFormWidget(
                title: "Kecamatan", controller: _subdistrictController),
            textFormWidget(
                title: "Kode Pos", controller: _postalCodeController),
            SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GeneralRoundedButton(
                color: Colors.blue.shade400,
                onPressed: () {
                  _controller.saveToLocal(
                    nikModel: NikModelLocal(
                      nik: _nikController.text,
                      name: _nameController.text,
                      gender: _genderController.text,
                      age: _ageController.text,
                      bornDate: _bornDateController.text,
                      province: _provinceController.text,
                      city: _cityController.text,
                      subdistrict: _subdistrictController.text,
                      postalCode: _postalCodeController.text,
                    ),
                  );
                },
                text: 'Register',
              ),
            ),
          ],
        ),
      );
    }));
  }

  Widget textFormWidget({String? title, TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 12.0, right: 16.0),
      child: Center(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: title,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
