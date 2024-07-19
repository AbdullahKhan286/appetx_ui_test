// import 'package:lum_mah/View/TravelingScreens/HomeScreen/provider.dart';

import 'package:apptex_ui_task/view/home_screen/home_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  // Add your providers here
  ChangeNotifierProvider(create: (_) => HomeModel()),
  // ChangeNotifierProvider<>(create: (_) => ProductDetailScreen()),
];
