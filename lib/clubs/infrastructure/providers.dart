import 'package:all_about_clubs/clubs/application/clubs_notifier.dart';
import 'package:all_about_clubs/clubs/infrastructure/clubs_local_service.dart';
import 'package:all_about_clubs/clubs/infrastructure/clubs_remote_service.dart';
import 'package:all_about_clubs/clubs/infrastructure/clubs_repository_impl.dart';
import 'package:all_about_clubs/core/shared/providers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((ref1) => Dio());

final clubsRemoteServiceProvider =
    Provider((ref) => ClubsRemoteService(ref.watch(dioProvider)));

final clubsLocalServiceProvider =
    Provider((ref) => ClubsLocalService(ref.watch(sembastProvider)));

final clubsRepositoryImpl = Provider((ref) => ClubsRepositoryImpl(
    ref.watch(clubsRemoteServiceProvider),
    ref.watch(clubsLocalServiceProvider)));

final clubsNotifierProvider = StateNotifierProvider<ClubsNotifier, ClubsState>(
    (ref) => ClubsNotifier(ref.watch(clubsRepositoryImpl)));
