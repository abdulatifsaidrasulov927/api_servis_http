import 'package:api_servis_http/data/local/storage_repository/storage_repository.dart';
import 'package:api_servis_http/ui/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_servis_http/cubits/tab/tab_cubit.dart';
import 'package:api_servis_http/data/local/search_location/places_db.dart';
import 'package:api_servis_http/data/local/search_location/search_history_db.dart';
import 'package:api_servis_http/data/repositories/places_db_repository.dart';
import 'package:api_servis_http/data/repositories/search_history_db.dart';
import 'package:api_servis_http/services/api_service.dart';
import 'package:api_servis_http/services/locator_service.dart';
import 'cubits/help_center/help_center_category_cubit.dart';
import 'cubits/user/user_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  ServiceLocator.setup();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(App(apiService: ApiService()));
}

class App extends StatelessWidget {
  const App({super.key, required this.apiService});

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => SearchHistoryRepository(SearchHistoryDatabase()),
        ),
        RepositoryProvider(
          create: (context) => PlacesDatabaseRepository(PlacesDatabase()),
        ),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => TabCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => HelpCenterCategoryCubit()),
      ], child: const MyApp()),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}
