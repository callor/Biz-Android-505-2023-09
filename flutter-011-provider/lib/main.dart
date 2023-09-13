import 'package:flutter/material.dart';
import 'package:mview/pages/home_page.dart';
import 'package:mview/pages/settings_page.dart';
import 'package:mview/ui_models/page_view_model.dart';
import 'package:mview/ui_models/theme_controller.dart';
import 'package:mview/ui_models/timer_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ThemeController themeController = ThemeController();
  await themeController.initSystemTheme();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TimerViewModel()),
      ChangeNotifierProvider(create: (_) => PageViewModel()),
    ],
    child: App(themeController: themeController),
  ));
}

class App extends StatelessWidget {
  const App({super.key, required this.themeController});
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    var pageViewModel = context.watch<PageViewModel>();

    /// 혹시 MaterialApp 의 themeMode 속성이 변경되면 화면을 다시 rendering
    return ListenableBuilder(
      listenable: themeController,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        darkTheme: ThemeData.dark(),
        themeMode: themeController.themeMode,
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
                  SettingsPage(themeController: themeController),
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
      ),
    );
  }
}
