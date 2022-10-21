import 'dart:convert';

import 'package:get/get.dart';
import 'package:news_app_flutter/core/model/news_model.dart';
import 'package:news_app_flutter/core/service/news_url_service.dart';

class NewsService extends GetConnect {
  final _newsUrlService = Get.put(NewsUrlService());

  @override
  void onInit() {
    httpClient.baseUrl = _newsUrlService.getApiBaseUrl();
    super.onInit();
  }

  Future<NewsModel> getTopNewsHeadlines() async {
    var response = await get(
        "/top-headlines?country=in&apiKey=e004331040d8464892c01b7f4b70641f");
    if (response.hasError) {
      return NewsModel(status: "", totalResults: 0, articles: []);
    } else {
      var result = NewsModel.fromJson(json.decode(response.bodyString!));
      return result;
    }
  }
}
