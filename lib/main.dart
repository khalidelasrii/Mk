import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/article/article_bloc.dart';
import 'package:mk/featchers/messaget_futchers/presentation/bloc/descusion_cubit/descusion_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/bloc/welcome_article_bloc/welcome_article_bloc_bloc.dart';
import 'package:mk/featchers/welcome_screen/presentation/ui/welcome_screen_page.dart';
import 'featchers/Authontification/presentation/cubit/auth_cubit.dart';
import 'featchers/messaget_futchers/presentation/bloc/message_cubit/messages_cubit.dart';
import 'featchers/welcome_screen/presentation/bloc/toolbar_Cuibit/toolbar_cubit.dart';
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
            create: (_) => di.sl<ArticleBloc>(),
          ),
          BlocProvider(
            create: (_) => di.sl<AddordeletorupdateBloc>(),
          ),
          BlocProvider(
            create: (_) => di.sl<AuthCubit>(),
          ),
          BlocProvider(create: (context) => di.sl<ToolbarCubit>()),
          BlocProvider(create: (context) => di.sl<WelcomeArticleBlocBloc>()),
          BlocProvider(create: (context) => di.sl<MessagesCubit>()),
          BlocProvider(create: (context) => di.sl<DescusionCubit>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            cardColor: Colors.white,
            primaryColor: Colors.pink,
            hintColor: Colors.red,
            shadowColor: Colors.white,
          ),
          home: const WelcomeScreen(),
        ));
  }
}
