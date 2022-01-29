import 'package:all_about_clubs/clubs/domain/club.dart';
import 'package:all_about_clubs/core/shared/colors.dart';
import 'package:all_about_clubs/core/shared/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClubTile extends StatelessWidget {
  final Club club;
  const ClubTile({Key? key, required this.club}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: kBlack,
            width: 0.3,
          ),
        ),
      ),
      height: 90,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 70,
              width: 70,
              child: Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: CachedNetworkImageProvider(club.image ?? ''),
                )),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 15,
                right: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    club.name ?? '',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    club.country ?? '',
                    style: const TextStyle(
                      fontSize: 10,
                      color: kGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '${club.value.toString()} ${AppLocalizations.of(context)!.millions.capitalize()}',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
