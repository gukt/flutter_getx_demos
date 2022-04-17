import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// StateMixin demo
void main() {
  runApp(GetMaterialApp(
    initialBinding: HomeBinding(),
    home: const Home(),
  ));
}

class Home extends GetView<NewsController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StateMixin demo')),
      body: GetBuilder<NewsController>(
        builder: (controller) {
          return Center(
            child: controller.obx(
              (data) => ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return Text(data[index].title);
                },
              ),
              onEmpty: const Text('No data'),
              // 转菊花
              onLoading: const Center(child: CircularProgressIndicator()),
              // 显示错误信息
              onError: (err) => Text('Failed to load data: $err'),
            ),
          );
        },
      ),
    );
  }
}

class NewsController extends GetxController with StateMixin<List<NewsEntity>> {
  @override
  void onReady() {
    Future.delayed(3.seconds).then((value) {
      List<NewsEntity> data = [];
      for (int i = 0; i < 10; i++) {
        data.add(NewsEntity.fromMap({'id': i, 'title': 'news-$i'}));
      }
      change(data, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error('Failed to load news data'));
    });
    super.onReady();
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsController());
  }
}

class NewsEntity {
  const NewsEntity(this.id, this.title);

  final int id;
  final String title;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory NewsEntity.fromMap(Map<String, dynamic> map) {
    return NewsEntity(
      map['id']?.toInt() ?? 0,
      map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsEntity.fromJson(String source) =>
      NewsEntity.fromMap(json.decode(source));
}
