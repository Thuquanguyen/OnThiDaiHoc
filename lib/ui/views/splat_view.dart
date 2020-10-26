import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/viewmodel/check_update_model.dart';
import 'package:flutterappdogandcat/ui/shared/alert.dart';
import 'package:flutterappdogandcat/ui/views/intro/intro_view.dart';
import 'package:flutterappdogandcat/ui/views/navigation_bottom.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_redirect/store_redirect.dart';

// wisth : 360
// height : 640
class SplatView extends StatefulWidget {
  static const routeName = '/splat';

  @override
  _SplatScreenState createState() => _SplatScreenState();
}

class _SplatScreenState extends State<SplatView> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<int> _counter;
  CheckupdateModel checkupdateModel = CheckupdateModel.instance;
  bool checkDialog = false;

  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  void initState() {
    _counter = _prefs.then((SharedPreferences prefs) {
      intentScreen(prefs.getInt('intro') ?? 0);
      return (prefs.getInt('intro') ?? 0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 414;
    final height = MediaQuery.of(context).size.height / 813;
    return FutureBuilder(
        builder: (context, snapshot) => Scaffold(
            backgroundColor: Color.fromRGBO(245, 245, 245, 1),
            body: Container(
              child: Stack(
                children: <Widget>[
                  Center(
                      child: Image.asset("assets/images/img_subject.png",
                          fit: BoxFit.cover)),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: CupertinoActivityIndicator()),
                        SizedBox(height: 10 * height),
                        Text(
                          "Đang tải dữ liệu...",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18 * width, color: Colors.black),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(bottom: 50 * height),
                  )
                ],
              ),
            )),
        future: _counter);
  }

  // Function
  Future intentScreen(int count) {
    return new Future.delayed(const Duration(seconds: 3), () {
      if (count == 1) {
        Navigator.of(context).popAndPushNamed(NavigationBottomBar.routeName);
      } else {
        Navigator.of(context).popAndPushNamed(IntroView.routeName);
      }
      checkupdateModel.getVersionApp().then((value) {
        getVersion().then((version) {
          if (value.results.version == version) {
            if (count == 1) {
              Navigator.of(context)
                  .popAndPushNamed(NavigationBottomBar.routeName);
            } else {
              Navigator.of(context).popAndPushNamed(IntroView.routeName);
            }
          } else {
            if (!checkDialog) {
              showAlert(context, () {
                StoreRedirect.redirect(
                    androidAppId: "com.luyenthidaihoc.daihoctrongtoi",
                    iOSAppId: "585027354");
                print("update");
              }, "Hiện đã có phiên bản mới của ứng dụng!", "Cập nhật");
              checkDialog = true;
            }
          }
        });
      });
    });
  }
}
