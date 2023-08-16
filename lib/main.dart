import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/posts/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/posts/presentation/bloc/article/article_bloc.dart';
import 'featchers/posts/presentation/ui/add_article.dart';
import 'featchers/posts/presentation/ui/home_page.dart';
import 'featchers/posts/presentation/ui/update_article.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBxlxB-nnjgEN542jqPvQrQo9O9KhgO9D8",
      authDomain: "milotech-33497.firebaseapp.com",
      projectId: "milotech-33497",
      storageBucket: "milotech-33497.appspot.com",
      messagingSenderId: "1090838931629",
      appId: "1:1090838931629:web:64efe23033a1a187277e24",
    ),
  );
  await di.init();
  runApp(const Maktabati());
}

class Maktabati extends StatelessWidget {
  const Maktabati({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<ArticleBloc>()..add(GetAllArticlesEvent()),
        ),
        BlocProvider(
          create: (_) => di.sl<AddordeletorupdateBloc>(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(focusColor: Colors.blue),
          initialRoute: HomePage.screenRout,
          routes: {
            HomePage.screenRout: (context) => const HomePage(),
            AddArticle.screenRout: (context) => const AddArticle(),
            UpdateArticle.screenRout: (context) => const UpdateArticle(),
          }),
    );
  }
}
