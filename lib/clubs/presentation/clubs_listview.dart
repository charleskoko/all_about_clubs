import 'package:all_about_clubs/clubs/application/clubs_notifier.dart';
import 'package:all_about_clubs/clubs/infrastructure/providers.dart';
import 'package:all_about_clubs/clubs/presentation/club_tile.dart';
import 'package:all_about_clubs/core/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClubsListView extends StatelessWidget {
  const ClubsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final clubsNotifierState = ref.watch(clubsNotifierProvider);
        if ((clubsNotifierState is LoadingSuccessState)) {
          return ListView.builder(
            itemCount: clubsNotifierState.clubs.entity.length,
            itemBuilder: (context, index) => ClubTile(
              club: clubsNotifierState.clubs.entity[index],
            ),
          );
        } else {
          if ((clubsNotifierState is LoadFailureState)) {
            return ListTileTheme(
              textColor: kWhite,
              iconColor: kWhite,
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: kReed,
                child: ListTile(
                  title: Text(AppLocalizations.of(context)!.errorMessageText),
                  subtitle: Text(AppLocalizations.of(context)!.errorSubtitle(
                      clubsNotifierState.clubFailure.errorCode!)),
                  leading: const SizedBox(
                    height: double.infinity,
                    child: Icon(
                      Icons.warning,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      ref.read(clubsNotifierProvider.notifier).getClubs('name');
                    },
                  ),
                ),
              ),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: Center(
                child: LinearProgressIndicator(
                  backgroundColor: kGrey,
                  valueColor: AlwaysStoppedAnimation<Color>(kGreen),
                ),
              ),
            );
          }
        }
      },
    );
  }
}
