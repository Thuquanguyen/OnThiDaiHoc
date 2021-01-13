import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/ui/views/navigation_bottom.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroView extends StatelessWidget {
  static const routeName = '/intro-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: IntroScreen());
  }
}

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "MỤC TIÊU CỦA TÔI",
        description:
            "Theo quy luật 90/10, cứ 10 phút bạn bỏ ra để lập kế hoạch thì bạn sẽ tiết kiệm được 90% thời gian hoàn thành và hiệu quả công việc.",
        pathImage: "assets/images/intro_01.png",
        heightImage: 250,
        backgroundColor: Color.fromRGBO(250, 205, 137, 1),
      ),
    );
    slides.add(
      new Slide(
        title: "ĐIỂM 10 CỦA TÔI",
        description:
            "Cùng ôn tập hệ thống lại các kiến thức đã học trng suốt thời gian qua. Hoàn thiện các bài kiểm tra 1 cách chính xác nhất.",
        pathImage: "assets/images/intro_02.png",
        heightImage: 250,
        backgroundColor: Color.fromRGBO(241, 246, 130, 1),
      ),
    );
    slides.add(
      new Slide(
        title: "TÔI SẼ ĐỖ ĐẠI HỌC",
        description:
            "Tại sao có người học kém? Tại sao có người học giỏi? Thực ra học kém hay giỏi không phải là bản chất, mà phần nhiều là do họ chưa biết cách điều khiển bộ não của mình mà thôi. ",
        pathImage: "assets/images/intro_03.jpg",
        backgroundColor: Color.fromRGBO(176, 210, 211, 1),
      ),
    );
  }

  void onDonePress() {
    _checkIntro();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => NavigationBottomBar()),
    (Route<dynamic> route) => false);
  }

  _checkIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('intro', 1);
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}
