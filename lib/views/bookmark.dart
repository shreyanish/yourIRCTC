import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yourirctc/views/home.dart';
import 'package:yourirctc/views/widgets/bookmark_card.dart';

import '../auth_service.dart';
import '../services/providers/bookmark_provider.dart';

class BookmarkPage extends ConsumerWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkprovider = ChangeNotifierProvider<BookmarkProvider>((ref) {
      return BookmarkProvider();
    });
    final bookmark = ref.read(bookmarkprovider);
    print('bmpage - $bookmark.traincards');
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        final route = MaterialPageRoute(
                            builder: (context) => const HomePage(),
                        );
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.blueAccent,
                          size: 40),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.train,
                          color: Colors.blueAccent,
                          size: 50,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Your",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),),
                            Text("IRCTC",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: AuthService().getProfileImageS(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height /1.2,
            child: ListView.builder(
              itemCount: bookmark.traincards.length,
                itemBuilder: (context, index) {
                final train = bookmark.traincards[index];
                return BookmarkCard(train: train);
                }
            ),
          ),

        ],
      ),
    );
  }
}
