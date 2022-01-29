import 'package:all_about_clubs/clubs/application/clubs_notifier.dart';
import 'package:all_about_clubs/clubs/infrastructure/providers.dart';
import 'package:all_about_clubs/clubs/presentation/clubs_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClubsPage extends ConsumerStatefulWidget {
  const ClubsPage({Key? key}) : super(key: key);

  @override
  ClubsPageState createState() => ClubsPageState();
}

class ClubsPageState extends ConsumerState<ClubsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(clubsNotifierProvider.notifier).getClubs('name'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.allAboutClubs),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                final clubsNotifierState = ref.watch(clubsNotifierProvider);
                if (clubsNotifierState is LoadingSuccessState) {
                  if (clubsNotifierState.clubs.filter == 'name') {
                    ref.read(clubsNotifierProvider.notifier).getClubs('value');
                  } else {
                    ref.read(clubsNotifierProvider.notifier).getClubs('name');
                  }
                }
              },
              icon: const Icon(Icons.filter_list))
        ],
      ),
      body: const ClubsListView(),
    );
  }
}
