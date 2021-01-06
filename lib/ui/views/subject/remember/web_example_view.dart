import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutterappdogandcat/core/viewmodel/remember_model.dart';
import 'package:flutterappdogandcat/ui/shared/argument_pass.dart';

const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';
// ignore: prefer_collection_literals

final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();
String selectedUrl = '';

class WebExampleView extends StatefulWidget {
  static const routeName = "/remember-list";

  @override
  _WebExampleViewState createState() => _WebExampleViewState();
}

class _WebExampleViewState extends State<WebExampleView> {
  RememberModel model = RememberModel.instance;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    PassArgumentsScreen example = ModalRoute.of(context).settings.arguments;
    selectedUrl = 'https://studen-graduation.herokuapp.com/exam/${example.content.id}';

    return WebviewScaffold(
      url: selectedUrl,
      javascriptChannels: jsChannels,
      mediaPlaybackRequiresUserGesture: false,
      appBar: AppBar(
        title: Text(example.content.title),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        child: const Center(
          child: Text('Đang tải dữ liệu đề thi.....'),
        ),
      ),
    );
  }
}