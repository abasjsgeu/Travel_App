import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_app1/core/utils/app_router.dart';
import 'package:travel_app1/screens/Auteh/controller/languages.dart';
import 'package:travel_app1/screens/Auteh/controller/languges_Controller.dart';

import 'package:travel_app1/services/settingGetxServices.dart';

final supabase = Supabase.instance.client;
SharedPreferences? sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://ictrjvtqluagfksjsrcr.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImljdHJqdnRxbHVhZ2Zrc2pzcmNyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc0ODUwNDEsImV4cCI6MjA1MzA2MTA0MX0.03HvfR6zERM5FZcBK49ssO17JzldB-vvb5XojA3rB9E",
  );

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await inital();
  await settingGetxServices().initNotification();

  runApp(const MyApp());
}

Future inital() async {
  Get.putAsync(permanent: true, () => settingGetxServices().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LangugesController l = Get.put(LangugesController());

    return GetMaterialApp(
      locale: l.intialLang,
      translations: Languages(),
      getPages: AppRouter.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
