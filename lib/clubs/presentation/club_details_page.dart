import 'package:all_about_clubs/clubs/domain/club.dart';
import 'package:all_about_clubs/core/shared/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClubDetailsPage extends StatelessWidget {
  final Club? club;
  const ClubDetailsPage({Key? key, required this.club}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(club!.name ?? ''),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black54,
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Container(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                CachedNetworkImageProvider(club!.image ?? ''),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      club!.country ?? '',
                      style: const TextStyle(
                        color: kWhite,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                alignment: Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context)!.descriptionText(
                      club!.name ?? '',
                      club!.country ?? '',
                      club!.value ?? 0,
                      club!.europeanTitles ?? 0),
                ),
              ))
        ],
      ),
    );
  }
}
