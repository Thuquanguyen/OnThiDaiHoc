import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutterappdogandcat/core/model/entertaiment.dart';

class TuyenSinhView extends StatefulWidget {
  static const routeName = '/tuyen_sinh';

  @override
  _TuyenSinhViewState createState() => _TuyenSinhViewState();
}

class _TuyenSinhViewState extends State<TuyenSinhView> {
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
    // TODO: implement initState
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
    Entertaiment entertaiment = ModalRoute.of(context).settings.arguments;

    return WebviewScaffold(
        url: entertaiment.url.trim(),
        appBar:
            AppBar(title: Text(entertaiment.title.trim()), centerTitle: true),
        withZoom: true,
        withLocalStorage: true,
        initialChild: Container(
          child: const Center(
            child: CupertinoActivityIndicator(),
          ),
        ));
  }
}
