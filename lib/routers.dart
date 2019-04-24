import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:okapia_app/developer/movie/dev_movie_page.dart';
import 'package:okapia_app/pages/home.dart';
import 'package:okapia_app/pages/index/search.dart';
import 'package:okapia_app/pages/new/create_page.dart';

class Routers {
  static var router = Router();

  static void configureRouters() {
    router.define("/develop",
        handler: _generatePageHandle(CreatePage()),
        transitionType: TransitionType.inFromRight);

    router.define("/create",
        handler: _generatePageHandle(CreatePage()),
        transitionType: TransitionType.inFromRight);

    router.define("/detail",
        handler: _generatePageHandle(CreatePage()),
        transitionType: TransitionType.inFromRight);

    router.define("/search", handler: _generatePageHandle(IndexSearchPage()));
  }

  static Handler _generatePageHandle(Widget page) {
    return Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            page);
  }

//  static final homeBuilder = (BuildContext context) => WelcomeWidget();//HomePage();
  static final homeBuilder = (BuildContext context) => HomePage();

  static void jumpToDevMoviePage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => DevMoviePageContainer()));
}
