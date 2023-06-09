import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth/auth_cubit.dart';
import 'firebase/firebase_options.dart';
import 'firebase/firestore_academies/firestore_academies_collection.dart';
import 'firebase/firestore_client.dart';
import 'firebase/firestore_locations/firestore_locations_collection.dart';
import 'repository/academy/academy_repository.dart';
import 'repository/academy/firestore_academy_repository.dart';
import 'repository/city/city_repository.dart';
import 'repository/city/firestore_city_repository.dart';
import 'router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider<FirestoreClient>(
            create: (_) => FirestoreClient(),
          ),
          RepositoryProvider<FirestoreLocationsCollection>(
            create: (context) => FirestoreLocationsCollection(
              RepositoryProvider.of<FirestoreClient>(context),
            ),
          ),
          RepositoryProvider<FirestoreAcademiesCollection>(
            create: (context) => FirestoreAcademiesCollection(
              RepositoryProvider.of<FirestoreClient>(context),
            ),
          ),
          RepositoryProvider<CityRepository>(
            create: (context) => FirestoreCityRepository(
              collection:
                  RepositoryProvider.of<FirestoreLocationsCollection>(context),
            ),
          ),
          RepositoryProvider<AcademyRepository>(
            create: (context) => FirestoreAcademyRepository(
              collection:
                  RepositoryProvider.of<FirestoreAcademiesCollection>(context),
            ),
          )
        ],
        child: BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
          child: MaterialApp.router(
            title: '모두의 발레',
            builder: (context, router) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: router!,
            ),
            theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF222222),
                elevation: 0,
              ),
              scaffoldBackgroundColor: const Color(0xFFFFFFFF),
              textTheme: GoogleFonts.robotoTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            routerConfig: _router.config(),
          ),
        ),
      );
}
