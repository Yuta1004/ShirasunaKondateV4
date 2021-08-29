import "package:flutter/material.dart";

import "pages/home_page/home_page.dart";

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.orange,
            ),
            home: HomePage(),
        );
    }
}
