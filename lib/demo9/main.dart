import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// GetStorage 示例
///
/// 要使用 GetStorage 先添加依赖：https://pub.dev/packages/get_storage
Future<void> main() async {
  // 初始化一个默认名称为 GetStorage
  debugPrint('Initializing GetStorage');
  await GetStorage.init();
  debugPrint('GetStorage is ready!');

  runApp(const GetMaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                var box = GetStorage();
                box.write('name', 'codedog996');
                box.write('age', 30);
                box.write('married', true);
                // Map
                var map1 = {
                  'name': 'tom',
                  'age': 30,
                };
                box.write('map1', map1);

                // List
                var list1 = const [
                  Person('tom', 3),
                  Person('jerry', 3),
                ];
                box.write('list1', list1);

                // box.write('createdAt', DateTime.now());
                debugPrint(
                    'Storage - keys:${box.getKeys()}, values:${box.getValues()}');

                var name = box.read('name');
                debugPrint('name=$name, ${name.runtimeType}');
                var age = box.read<int>('age');
                debugPrint('age=$age, ${age.runtimeType}');
                var map11 = box.read('map1');
                debugPrint('map11=$map11, ${map11.runtimeType}');

                // var person1 = box.read<Person>('map1');
                // debugPrint('person1=$person1, ${person1.runtimeType}');

                var list11 = box.read('list1');
                debugPrint('list11=$list11, ${list11.runtimeType}');
              },
              child: const Text('Write data'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('显示 Storage 内容'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const Second());
              },
              child: const Text('Next page'),
            )
          ],
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final name = box.read('name');
    final int? age = box.read('age');
    final married = box.read<bool>('married');
    // final DateTime? createdAt = box.read('createdAt');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: $name'),
            Text('Age: $age'),
            Text('Married: $married'),
            // Text('Created At: $createdAt'),
          ],
        ),
      ),
    );
  }
}

class Person {
  const Person(this.name, this.age);

  final String name;
  final int age;

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(json['name'], json['age']);
  }
}
