import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterappdogandcat/core/model/entertaiment.dart';
import 'package:flutterappdogandcat/ui/views/entertainment/details_entertaiment_view.dart';
import 'package:flutterappdogandcat/ui/views/exam-years/exam_years.dart';
import 'package:flutterappdogandcat/ui/views/exam-years/list_code_exam.dart';
import 'package:flutterappdogandcat/ui/views/intro/intro_view.dart';
import 'package:flutterappdogandcat/ui/views/splat_view.dart';
import 'package:flutterappdogandcat/ui/views/sign-in/login_view.dart';
import 'package:flutterappdogandcat/ui/views/sign-up/register_view.dart';
import 'package:flutterappdogandcat/ui/views/subject/remember/remember_list.dart';
import 'ui/views/navigation_bottom.dart';
import 'ui/views/forgot-password/forgot_password_step1_view.dart';
import 'ui/views/forgot-password/forgot_password_step2_view.dart';
import 'ui/views/forgot-password/forgot_password_step3_view.dart';

const String initialRoute = "login";

class Routerr {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplatView());
      case SplatView.routeName:
        return SlideRightRoute(widget: SplatView());
      case NavigationBottomBar.routeName:
        return SlideRightRoute(widget: NavigationBottomBar());
      case LoginView.routeName:
        return SlideRightRoute(widget: LoginView());
      case RegisterView.routeName:
        return SlideRightRoute(widget: RegisterView());
      case ForgotPasswordStep1View.routeName:
        return SlideRightRoute(widget: ForgotPasswordStep1View());
      case ForgotPasswordStep2View.routeName:
        return SlideRightRoute(widget: ForgotPasswordStep2View());
      case ForgotPasswordStep3View.routeName:
        return SlideRightRoute(widget: ForgotPasswordStep3View());
      case IntroView.routeName:
        return SlideRightRoute(widget: IntroView());
      case ListCodeExam.routeName:
        return SlideRightRoute(widget: ListCodeExam());
      case ExamYears.routeName:
        return SlideRightRoute(widget: ExamYears());
      case DetailsEntertaimentView.routerName:
        var entertaiment = settings.arguments as Entertaiment;
        return SlideRightRoute(
            widget: DetailsEntertaimentView(entertaiment: entertaiment));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;

  SlideRightRoute({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return new SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
