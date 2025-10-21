import 'package:car_rental/core/services/shared_preferences_singleton.dart';
import 'package:car_rental/features/on_boarding/presentation/views/startup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/helper_functions/on_generate_route.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/get_it_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Prefs.init();
  setupGetIt();

  //Setting SystmeUIMode
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top],
  );

  runApp(const CarRental());
}

class CarRental extends StatelessWidget {
  const CarRental({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //  fontFamily: 'Tajawal',
        scaffoldBackgroundColor: const Color(0xffF8F8F8),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: StartupView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
