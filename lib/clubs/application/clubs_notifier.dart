import 'package:all_about_clubs/clubs/domain/club.dart';
import 'package:all_about_clubs/clubs/domain/club_failure.dart';
import 'package:all_about_clubs/clubs/infrastructure/clubs_repository.dart';
import 'package:all_about_clubs/core/domain/fresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ClubsState {}

class InitialState extends ClubsState {}

class LoadingInProgressState extends ClubsState {}

class LoadingSuccessState extends ClubsState {
  final Fresh<List<Club>> clubs;
  LoadingSuccessState({required this.clubs});
}

class LoadFailureState extends ClubsState {
  final ClubFailure clubFailure;
  LoadFailureState({required this.clubFailure});
}

class ClubsNotifier extends StateNotifier<ClubsState> {
  final ClubsRepository _clubsRepository;
  ClubsNotifier(this._clubsRepository) : super(InitialState());

  Future<void> getClubs() async {
    state = LoadingInProgressState();
    final failureOrClubs = await _clubsRepository.getClubs();
    state = failureOrClubs.fold(
      (l) => LoadFailureState(clubFailure: l),
      (r) => LoadingSuccessState(clubs: r),
    );
  }
}
