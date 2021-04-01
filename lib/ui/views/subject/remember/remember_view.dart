import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutterappdogandcat/core/model/entertaiment.dart';

class RememberView extends StatefulWidget {
  static const routeName = '/remmember';

  @override
  _RememberScreenState createState() => _RememberScreenState();
}

class _RememberScreenState extends State<RememberView> {
  BannerAd myBanner;

  BannerAd buildBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner..show();
          }
        });
  }

  BannerAd buildLargeBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.largeBanner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner
              ..show(
                  anchorType: AnchorType.top,
                  anchorOffset: MediaQuery.of(context).size.height * 0.15);
          }
        });
  }

  @override
  void initState() {
    super.initState();

    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    myBanner = buildBannerAd()..load();
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Entertaiment entertaiment = ModalRoute.of(context).settings.arguments;

    return WebviewScaffold(
        url: "https://drive.google.com/file/d/1zN4Zeq4vDUTTxEm9GW94vT7ac5Qi7WtZ/view?usp=sharing",
        appBar:
        AppBar(title: Text("entertaiment.content.trim()"), centerTitle: true),
        withZoom: false,
        withLocalStorage: true,
        initialChild: Container(
          child: const Center(
            child: CupertinoActivityIndicator(),
          ),
        ));
  }
}