import 'package:all_about_clubs/clubs/domain/club.dart';
import 'package:all_about_clubs/core/shared/extension.dart';
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
            color: Colors.black,
            width: 0.3,
          ),
        ),
      ),
      height: 90,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Image.network(club.image ?? ''),
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
                      color: Colors.grey,
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
