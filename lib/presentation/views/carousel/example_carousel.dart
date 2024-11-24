import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'dart:html' as html;

import 'package:webviewx_plus/webviewx_plus.dart';

class ExampleCarousel extends StatefulWidget {
  static String routeName = '/carousel';
  const ExampleCarousel({super.key});

  @override
  State<ExampleCarousel> createState() => _ExampleCarouselState();
}

class _ExampleCarouselState extends State<ExampleCarousel> {
  late WebViewXController webviewController;
  String _html = '';
  List<String> images = [
    'assets/assets/MCC_MFREE_MASTERCARD.png',
    'assets/assets/MCC_PLATINUM_MASTERCARD.png',
    'assets/assets/MCC_TRAVEL_VISA_PLATINUM.png',
    'assets/assets/MCC_WORLD_MASTERCARD.png',
  ];

  @override
  void initState() {
    super.initState();
  }

  void loadCoauselFile() async {
    String html = await rootBundle.loadString('assets/carousel.html');
    webviewController.loadContent(
      'assets/carousel.html',
      sourceType: SourceType.html,
      fromAssets: true,
    );
  }

  void loadCoausel(){
    List<String> imagesHtml =
          images.map((image) => 'http://$getCurrentUrl/$image').toList();
    webviewController.callJsMethod('startCarousel', [jsonEncode(imagesHtml)]);
  }

  String? get getCurrentUrl {
    if (kIsWeb) {
      print(html.window.location.host);
      return html.window.location.host;
    }
    return null;
  }

  _loadHtml() async {
    String html = await rootBundle.loadString('assets/carousel.html');
    List<String> imagesHtml = [];

    setState(() {
      _html = html;
    });

    // Wait for 5 seconds to ensure JavaScript is loaded
    Future.delayed(const Duration(seconds: 5), () async {
      List<String> imagesHtml =
          images.map((image) => '$getCurrentUrl/$image').toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel Demo'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              loadCoauselFile();
            },
            child: Text('load Caousel html'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              loadCoausel();
            },
            child: Text('function'),
          ),
          SizedBox(height: 10),
          WebViewX(
            initialContent: '<h1> Hi </h1>',
            initialSourceType: SourceType.html,
            onWebViewCreated: (controller) {
              webviewController = controller;
            },
            width: double.maxFinite,
            height: 500,
          ),
        ],
      ),
    );
  }
}

     // body: _html.isEmpty
      // ? Center(child: CircularProgressIndicator())
      // : Stack(
      //     children: [
      //       PlatformWebViewWidget(PlatformWebViewWidgetCreationParams(
      //               controller: _controller))
      //           .build(context),
      //     ],
      //   ),
