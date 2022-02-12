import 'package:all_about_clubs/clubs/domain/club.dart';
import 'package:all_about_clubs/clubs/domain/club_failure.dart';
import 'package:all_about_clubs/core/domain/fresh.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class ClubsRepository {
  Future<Either<ClubFailure, Fresh<List<Club>>>> getClubs(String filter);
}
