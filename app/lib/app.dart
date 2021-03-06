import "package:flutter/material.dart";

import "pages/home_page/home_page.dart";
import "pages/search_page/search_page.dart";
import "pages/settings_page/settings_page.dart";
import "pages/settings_page/select_nutritive_page.dart";
import "pages/settings_page/set_server_url_page.dart";
import "pages/help_page/help_page.dart";

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.orange,
            ),
            initialRoute: "/",
            routes: {
                "/": (context) => HomePage(),
                "/search": (context) => SearchPage(),
                "/settings": (context) => SettingsPage(),
                "/settings/select_nutritive": (context) => SelectNutritivePage(),
                "/settings/set_server_url": (context) => SetServerURLPage(),
                "/help": (context) => HelpPage(),
            },
        );
    }
}
