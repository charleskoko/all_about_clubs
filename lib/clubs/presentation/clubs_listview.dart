import 'package:all_about_clubs/clubs/application/clubs_notifier.dart';
import 'package:all_about_clubs/clubs/infrastructure/providers.dart';
import 'package:all_about_clubs/clubs/presentation/club_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClubsListView extends StatelessWidget {
  const ClubsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final clubsNotifierState = ref.watch(clubsNotifierProvider);
      return (clubsNotifierState is LoadingSuccessState)
          ? ListView.builder(
              itemCount: clubsNotifierState.clubs.entity.length,
              itemBuilder: (context, index) => ClubTile(
                club: clubsNotifierState.clubs.entity[index],
              ),
            )
          : (clubsNotifierState is LoadFailureState)
              ? const Center(
                  child: Text('failure'),
                )
              : const Center(child: Text('Loading'));
    });
  }
}
