import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/core/controller/news_controller.dart';

class TopHeadlinesNewsScreen extends StatelessWidget {
  TopHeadlinesNewsScreen({Key? key}) : super(key: key);

  final controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top News"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.all(10.0),
            child: controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.topNews.value.length,
                    itemBuilder: (context, index) {
                      var data = controller.topNews.value[index];
                      return controller.errorMessage.value != ""
                          ? Center(
                              child: Text(controller.errorMessage.value),
                            )
                          : Column(
                              children: [
                                Image.network(
                                  data.urlToImage,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 15),
                                ListTile(
                                  leading: const Text("Title"),
                                  title: Text(data.title),
                                ),
                              ],
                            );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
