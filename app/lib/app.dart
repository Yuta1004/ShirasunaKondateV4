import "package:flutter/material.dart";

import "pages/home_page/home_page.dart";
import "pages/search_page/search_page.dart";

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
            },
        );
    }
}
