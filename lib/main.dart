import 'package:apptex_ui_task/config/constant/color.dart';
import 'package:apptex_ui_task/config/provider/provider.dart';
import 'package:apptex_ui_task/config/routes/routes.dart';
import 'package:apptex_ui_task/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => const MyApp(),
//       ),
//     );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 843),
      child: MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: 'Apptex',
          theme: ThemeData(
            scaffoldBackgroundColor: bgColor,
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.generateRoute,
          initialRoute: RoutesName.home,
        ),
      ),
    );
  }
}
