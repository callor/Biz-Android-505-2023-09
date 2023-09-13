import 'package:flutter/material.dart';
import 'package:mview/pages/home_page.dart';
import 'package:mview/pages/settings_page.dart';
import 'package:mview/ui_models/page_view_model.dart';
import 'package:mview/ui_models/timer_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TimerViewModel()),
      ChangeNotifierProvider(create: (_) => PageViewModel()),
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var pageViewModel = context.watch<PageViewModel>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/pomodors.jpg"),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: PageView(
              controller: pageViewModel.pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: ((newIndex) =>
                  pageViewModel.pageViewChange(newIndex)),
              children: [
                const HomePage(),
                SettingsPage(),
              ]),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: pageViewModel.pageIndex,
            onTap: (index) => pageViewModel.bottomNavTap(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: "설정"),
            ],
          ),
        ),
      ),
    );
  }
}
