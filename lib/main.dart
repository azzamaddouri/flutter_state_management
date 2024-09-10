import 'package:flutter/material.dart';
import 'package:flutter_state_management/app_lifecycle/timer_screen.dart';
import 'package:flutter_state_management/bloc/bloc/my_bloc_observer.dart';
import 'package:flutter_state_management/getx/mvc_design_pattern/services/settings_service.dart';
import 'package:get/get.dart';
import 'package:flutter_state_management/bloc/bloc/bloc_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Service
  // await initialServices();
  // Use of the bloc observer
  /*  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: MyBlocObserver()); */
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

Future initialServices() async {
  await Get.putAsync(() => SettingsService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return /* Get */
        // Create instance of the BloC

        /* BlocProvider(
      create: (_) => CounterBloc(),
      child:  */
        /*  MultiBlocProvider(
            providers: [
          BlocProvider(
            create: (_) => CounterBloc(),
          ),
          BlocProvider(
            create: (_) => CounterCubit(),
          ),
        ],
            child: */
        MaterialApp(
      title: 'Flutter Demo',
      theme: /* ThemeData
              .dark() */
          ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TimeScreen() /* CounterScreen(counter: 1) */,
      // Inject the dependencies from the root of the app ( where the app starts )
      //initialBinding: MyBinding(),
      // Define named route
      /* routes: {
            "/home": (context) => Home()
          }, */
      //initialRoute: "/",
      //locale: Get.deviceLocale,
      //translations: LocaleController(),
      // getPages: [
      //   GetPage(
      //     name: "/",
      //     page: () => const MainView(), /* middlewares: [AuthMiddleware()] */
      //   ),
      //   GetPage(
      //       name: "/homeview",
      //       page: () => const HomeView(),
      //       binding: MyBinding() /*  Second method */),
      // ],
    ) /* ) */;
  }
}
