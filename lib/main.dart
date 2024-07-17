import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_mapp/Util/routs_utils.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    const RunStartApp()
  );
}


class RunStartApp extends StatelessWidget {
  const RunStartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: PageRout.pages,
      initialRoute: NameRouts.splash,
      title: 'Map',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: Colors.black,
          ),
        ),
        canvasColor: Colors.white,
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.black,
        ),
      ),
    );
  }
}
