import 'package:all_about_clubs/clubs/domain/club.dart';
import 'package:all_about_clubs/clubs/domain/club_failure.dart';
import 'package:all_about_clubs/clubs/infrastructure/clubs_local_service.dart';
import 'package:all_about_clubs/clubs/infrastructure/clubs_repository.dart';
import 'package:all_about_clubs/clubs/infrastructure/clubs_remote_service.dart';
import 'package:all_about_clubs/core/domain/fresh.dart';
import 'package:all_about_clubs/core/infrastructure/network_exceptions.dart';
import 'package:all_about_clubs/core/infrastructure/remote_response.dart';
import 'package:dartz/dartz.dart';

class ClubsRepositoryImpl extends ClubsRepository {
  final ClubsRemoteService _remoteService;
  final ClubsLocalService _localService;
  ClubsRepositoryImpl(
    this._remoteService,
    this._localService,
  );
  @override
  Future<Either<ClubFailure, Fresh<List<Club>>>> getClubs(String filter) async {
    late List<Club> clubs;
    try {
      final remoteItems = await _remoteService.getClubs(filter);
      if (remoteItems is ConnectionResponse) {
        await _localService.upsertClub(remoteItems.response);
      }else {
        try{
          clubs = await _localService.getPage(filter);
          if(clubs.isEmpty){
            return left(ClubFailure.api(408));
          }
        } catch (exception){
          return left(ClubFailure.api(408));
        }
      }
      return right((remoteItems is ConnectionResponse)
          ? Fresh.yes(entity: remoteItems.response, filter: filter)
          : Fresh.no(entity: clubs, filter: filter));
    } on RestApiException catch (e) {
      return left(ClubFailure.api(e.errorCode));
    }
  }
}
