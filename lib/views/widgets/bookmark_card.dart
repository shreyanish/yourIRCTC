import 'package:flutter/material.dart';
import 'package:yourirctc/globals.dart' as globals;
import '../../services/providers/bookmark_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class BookmarkCard extends ConsumerWidget {
  final String train;


  BookmarkCard({super.key,
    required this.train,

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                train,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  bookmark.toggleBookmark_t(train);
                },
                icon: bookmark.isExist_t(train)
                    ? const Icon(Icons.bookmark_rounded, color: Colors.blueAccent,)
                    : const Icon(Icons.bookmark_outline_rounded, color: Colors.blueAccent,)
            ),
          ],
        ),
      ),
    );
  }
}
