import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:scan_qrcode/feature/login/login_controller.dart';
import 'package:scan_qrcode/widget/rounded_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: body(),
      ),
    );
  }

  Widget body() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(16.0),
      child: Obx(
        () {
          if (_controller.loadingProcess.value == true) {
            print(_controller.loadingProcess.value);
            Loader.show(context,
                isAppbarOverlay: true,
                isBottomBarOverlay: false,
                progressIndicator: CircularProgressIndicator(),
                themeData:
                    Theme.of(context).copyWith(accentColor: Colors.black38),
                overlayColor: Color(0x99E8EAF6));
          } else {
            Loader.hide();
            if (_controller.isResult.value) {
              if (_controller.isSuccess.value == false) {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Gagal euyy"),
                    backgroundColor: Colors.red,
                  ));
                });
              } else {
                /* WidgetsBinding.instance!.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Tah ieu bener"),
                    backgroundColor: Colors.green,
                  ));
                }); */
              }
            }
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 24.0),
                Container(
                  child: Text(
                    "SCAN KTP ${_controller.loadingProcess.value}",
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 24.0),
                Container(
                  child: Lottie.asset(
                    'assets/lottie/lottie_id_card.json',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 16.0),
                GeneralRoundedButton(
                  color: Colors.blue.shade400,
                  onPressed: () {
                    chooseTypeLogin();
                  },
                  text: 'Register / Login',
                ),
                SizedBox(height: 16.0),
                Container(
                  child: Text(
                    "Login/Register dengan cara scan KTP anda",
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void chooseTypeLogin() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt_outlined),
              title: Text('Kamera'),
              onTap: () {
                _controller.scan(ImageSource.camera);
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.file_copy),
              title: Text('Galeri'),
              onTap: () {
                _controller.scan(ImageSource.gallery);
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
