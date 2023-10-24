import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/core/Widgets/appbar_welcom.dart';
import 'package:mk/core/const_widget/my_colors.dart';
import 'package:mk/featchers/Article/presentation/bloc/message_cuibite/messag_cubit.dart';
import 'package:mk/featchers/Authontification/presentation/cubit/auth_cubit.dart';
import 'package:mk/featchers/welcome_screen/presentation/ui/welcome_screen_page.dart';
import 'package:mk/injection_container.dart' as di;

import '../../../../core/Widgets/core_widgets.dart';
import '../bloc/get_mes_articles_cuibit/get_mes_articles_cubit.dart';
import '../widgets/grid_view_body.dart';

Color mygreen = const Color.fromARGB(115, 76, 175, 79);
Color myteal = const Color.fromARGB(129, 0, 150, 135);
Color myblue = const Color.fromARGB(121, 33, 149, 243);
Color profilcolor = const Color.fromARGB(84, 0, 0, 0);

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user});
  final User? user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.sl<GetMesArticlesCubit>()..mesArticleLoding(),
          ),
          BlocProvider(
            create: (_) => di.sl<MessagCubit>()..getMessagesEvent(),
          )
        ],
        child: Scaffold(
          backgroundColor: mybluebackgroundcolor,
          body: _buildBody(context, widget.user),
        ));
  }
}

_buildBody(BuildContext context, User? user) {
  int currentIndex = 0;
  final List<Widget> pages = [
    profil(),
    articles(user),
    message(context),
    info(context),
  ];

  return StatefulBuilder(
    builder: (context, setState) {
      return SingleChildScrollView(
        child: Column(
          children: [
            AppbarWelcom().appBarWidget(context, user),
            BottomNavigationBar(
              backgroundColor: const Color.fromARGB(98, 0, 0, 0),
              selectedItemColor: Colors.amber,
              unselectedItemColor: Colors.white,
              elevation: 0,
              currentIndex: currentIndex,
              onTap: (int newIndex) {
                setState(() {
                  currentIndex = newIndex;
                });
              },
              items: [
                const BottomNavigationBarItem(
                  backgroundColor: Color.fromARGB(98, 0, 0, 0),
                  icon: Icon(Icons.person),
                  label: 'Profil',
                ),
                BottomNavigationBarItem(
                  backgroundColor: mygreen,
                  icon: const Icon(Icons.category),
                  label: 'Articles',
                ),
                BottomNavigationBarItem(
                  backgroundColor: myteal,
                  icon: const Icon(Icons.message),
                  label: 'Message',
                ),
                BottomNavigationBarItem(
                  backgroundColor: myblue,
                  icon: const Icon(Icons.info),
                  label: 'Info',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          user!.photoURL != null
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipOval(
                                      child: Image.network(
                                    user.photoURL!,
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  )),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Icon(
                                      Icons.person,
                                      size: 100,
                                    ),
                                  ),
                                ),
                          const Text(
                            'Name and Prnam',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              user.email!,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 200, 200, 200)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pages[currentIndex]
                  ],
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

profil() {
  return Expanded(
    child: Container(
      constraints: const BoxConstraints(maxHeight: 1000, maxWidth: 1000),
      color: profilcolor,
    ),
  );
}

articles(User? user) {
  return Expanded(
    child: Container(
      constraints: const BoxConstraints(maxHeight: 1000, maxWidth: 1000),
      color: mygreen,
      child: BlocBuilder<GetMesArticlesCubit, GetMesArticlesState>(
        builder: (context, state) {
          if (state is LodidMesArticlesState) {
            return GridViewBody(
              articles: state.articles,
              isDisktop: true,
              user: user,
            );
          } else {
            return const SizedBox(
              child: Center(
                child: CerclulareLodingWidget(),
              ),
            );
          }
        },
      ),
    ),
  );
}

message(BuildContext context) {
  TextEditingController textEditingController = TextEditingController();
  String messagevalue = '';

  return StatefulBuilder(
    builder: (context, setState) {
      return Expanded(
        child: Container(
          constraints: const BoxConstraints(maxHeight: 500),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: myteal,
                  child: BlocBuilder<MessagCubit, MessagState>(
                    builder: (context, state) {
                      if (state is LodidMessagesState) {
                        return StreamBuilder<QuerySnapshot>(
                          stream: state.messages,
                          builder: (context, snapshot) {
                            final List<Map<String,String>> mess = [];
                            if (snapshot.hasData) {
                              final messages = snapshot.data!.docs;
                              for (var message in messages) {
                                mess.add({
                                  "message":message['message'],
                                  "email":message['email'],
                                });
                              }
                              return ListView.builder(
                                itemCount: mess.length,
                                itemBuilder:(context, index) {
                                  final messageMap =mess[index];
                                  
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8 ,left: 8,right: 150,bottom: 8),
                                  
                                      child: Container( 

                                          decoration:const BoxDecoration(
                                        color: Color.fromARGB(255, 9, 76, 109),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(25),
                                          bottomRight: Radius.circular(25)
                                          )
                                      ), child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,children: [
                                          Text(messageMap['email']!,style: const TextStyle(color: Colors.grey,fontSize: 10),),
                                          Text(messageMap['message']!,style: const TextStyle(color: Colors.white,fontSize: 14),),
                                        ],),
                                      )),
                                    
                                  ); 
                                },
                                
                                );
                            } else {
                              return const CerclulareLodingWidget();
                            }
                          },
                        );
                      }
                      return const CerclulareLodingWidget();
                    },
                  ),
                ),
              ),
              Container(
                constraints: const BoxConstraints(minHeight: 50, maxHeight: 60),
                decoration: const BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.blue, Colors.orange])),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: textEditingController,
                        onChanged: (value) {
                          setState(() {
                            messagevalue = value;
                          });
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          hintText: 'Écrire un message....',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    MaterialButton(
                      hoverColor: Colors.red,
                      onPressed: () {
                        textEditingController.clear();
                        BlocProvider.of<MessagCubit>(context)
                            .sendMessageEvent(messagevalue);
                      },
                      child: const Text(
                        'Send',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

info(BuildContext context) {
  return Expanded(
    child: Container(
      constraints: const BoxConstraints(maxHeight: 1000, maxWidth: 1000),
      color: myblue,
      child: MaterialButton(
          onPressed: () {
            BlocProvider.of<AuthCubit>(context).singOut();
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const WelcomeScreen()));
          },
          child: Container(
              color: Colors.amber,
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Deconection',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                  )
                ],
              ))),
    ),
  );
}
