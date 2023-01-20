import 'package:flutter/material.dart';
import 'package:yourirctc/globals.dart' as globals;
import '../../services/providers/bookmark_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class StationCard extends ConsumerWidget {
  final String startStation;
  final String endStation;

  StationCard({super.key,
    required this.startStation,
    required this.endStation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkprovider = ChangeNotifierProvider<BookmarkProvider>((ref) {
      return BookmarkProvider();
    });
    final bookmark = ref.watch(bookmarkprovider);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                offset: const Offset(
                  0.0,
                  10.0,
                ),
                blurRadius: 10.0,
                spreadRadius: -6.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 85,
              ),
              Text(
                startStation,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Icon(
                Icons.compare_arrows_rounded,
                size: 50,
                color: Colors.blueAccent,
              ),
              Text(
                endStation,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: IconButton(
                onPressed: () {
                  bookmark.toggleBookmark_s(startStation);
                },
                icon: bookmark.isExist_s(startStation)
                    ? const Icon(Icons.bookmark_rounded, color: Colors.blueAccent,)
                    : const Icon(Icons.bookmark_outline_rounded, color: Colors.blueAccent,)
            ),
          )],
          )
      ),
    );
  }
}


