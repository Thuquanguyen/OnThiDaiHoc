import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutterappdogandcat/core/model/entertaiment.dart';

class DetailsEntertaimentView extends StatefulWidget {
  static const routerName = '/details-entertaiment';

  final Entertaiment entertaiment;

  DetailsEntertaimentView({@required this.entertaiment});

  @override
  _DetailsEntertaimentViewState createState() =>
      _DetailsEntertaimentViewState();
}

class _DetailsEntertaimentViewState extends State<DetailsEntertaimentView> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.entertaiment.title),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              Navigator.pop(context);
            }),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Html(data: widget.entertaiment.content)),
    );
  }
}
