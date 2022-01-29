import 'package:all_about_clubs/clubs/infrastructure/providers.dart';
import 'package:all_about_clubs/core/presentation/app_router.dart';
import 'package:all_about_clubs/core/shared/providers.dart';
import 'package:all_about_clubs/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final initializationProvider = FutureProvider((ref) async {
  await ref.read(sembastProvider).init();
  final clubsNotifier = ref.read(clubsNotifierProvider.notifier);
  await clubsNotifier.getClubs();
});

class AppWidget extends ConsumerWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (previous, next) {});
    return MaterialApp.router(
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      title: 'All about clubs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: L10n.all,
    );
  }
}
