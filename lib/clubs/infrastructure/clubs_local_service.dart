import 'package:all_about_clubs/clubs/domain/club.dart';
import 'package:all_about_clubs/core/infrastructure/sembast_database.dart';
import 'package:sembast/sembast.dart';
import 'package:collection/collection.dart';

class ClubsLocalService {
  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('clubsRepos');

  ClubsLocalService(this._sembastDatabase);
  static const int _itemsPerPage = 14;
  static const int _page = 1;
  Future<void> upsertClub(List<Club> clubs) async {
    const sembastPage = _page - 1;
    await _store
        .records(
            clubs.mapIndexed((index, _) => index + _itemsPerPage * sembastPage))
        .put(_sembastDatabase.instance, clubs.map((e) => e.toJson()).toList());
  }

  Future<List<Club>> getPage() async {
    const sembastPage = _page - 1;
    final records = await _store.find(_sembastDatabase.instance,
        finder:
            Finder(limit: _itemsPerPage, offset: _itemsPerPage * sembastPage));
    return records.map((e) => Club.fromJson(e.value)).toList();
  }
}
