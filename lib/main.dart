import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_state_management/app_lifecycle/timer_screen.dart';
import 'package:flutter_state_management/bloc/bloc/my_bloc_observer.dart';
import 'package:flutter_state_management/bloc/views/home_screen.dart';
import 'package:flutter_state_management/cubit/counter_cubit.dart';
import 'package:flutter_state_management/future_vs_streams/future_counter.dart';
import 'package:flutter_state_management/future_vs_streams/single_subscription_stream.dart';
import 'package:flutter_state_management/getx/mvc_design_pattern/services/settings_service.dart';
import 'package:flutter_state_management/getx/mvc_design_pattern/view/homeview.dart';
import 'package:flutter_state_management/getx/mvc_design_pattern/view/mainview.dart';
import 'package:flutter_state_management/getx/route_management/home.dart';
import 'package:flutter_state_management/provider/change_notifier_provider_example.dart';
import 'package:flutter_state_management/provider/multiprovider_example.dart';
import 'package:flutter_state_management/provider/provider_example.dart';
import 'package:flutter_state_management/provider/provider_widget_example.dart';
import 'package:flutter_state_management/redux/redux/middleware.dart';
import 'package:get/get.dart';
import 'package:flutter_state_management/bloc/bloc/bloc_imports.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/redux/reducer.dart';
import 'redux/redux/store.dart';
import 'redux/views/redux_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // GetxService
  // await initialServices();
  // Use of the bloc observer
  /*  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: MyBlocObserver()); */
  Bloc.observer = MyBlocObserver();

  Store<AppState> _store = Store<AppState>(reducer,
      initialState: AppState.initial(), middleware: [appStateMiddleware]);
  runApp(MyApp(store: _store));
}

// Service getx
Future initialServices() async {
  await Get.putAsync(() => SettingsService().init());
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({super.key, required this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return /* Get */
        // 1- Create instance of the BLoC - Link between bloc and ui

        /* BlocProvider(
            create: (_) => CounterBloc(),
            child: */
        /* MultiBlocProvider(
            providers: [
          BlocProvider(
            create: (_) => CounterBloc(),
          ),
          BlocProvider(
            create: (_) => CounterCubit(),
          ),
        ], */
        StoreProvider<AppState>(
            store: store,
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: /* ThemeData
              .dark() */
                  ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const ReduxView() /* CounterScreen(counter: 1) */,
              // Inject the dependencies from the root of the app ( where the app starts ) (First Method)
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
            ));
  }
}
