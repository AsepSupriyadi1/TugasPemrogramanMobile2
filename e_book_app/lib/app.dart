import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookmarksProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        title: 'E-book App',
        home: const Scaffold(
          // body: BottomNavbar(),
          body: LoginScreen(),
        ),
      ),
    );
  }
}

class BookmarksProvider with ChangeNotifier {

  // Variable ini adalah variable yang nantinya di share ke screen detail buku dan bookmarked book
  final List<BookItem> _boomarkedBookList = <BookItem>[];

  // Method untuk mengambil list buku
  List<BookItem> getBookmark() {
    return _boomarkedBookList;
  }

  // Method untuk mengecheck apakah buku sudah ada dalam list atau tidak
  bool isBookItemExist(BookItem reqItem) {
    return getBookmark().contains(reqItem);
  }

  // Method dengan kondisi apabila bukunya belum ada maka tambahkan jika sudah ada maka delete
  void addOrDeleteFromBookmark(BuildContext context, BookItem reqItem) {
    if (isBookItemExist(reqItem)) {
      _boomarkedBookList.remove(reqItem);
      showToast(
        "Book successfully removed!",
        context: context,
        animation: StyledToastAnimation.slideFromBottom,
      );
    } else {
      _boomarkedBookList.add(reqItem);
      showToast(
        "Book successfully added!",
        context: context,
        animation: StyledToastAnimation.slideFromBottom,
      );
    }

    notifyListeners();
  }
}
