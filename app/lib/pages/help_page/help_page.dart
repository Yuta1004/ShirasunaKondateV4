import "package:flutter/material.dart";

class HelpPage extends StatefulWidget {
    @override
    _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
   @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    "アプリの使い方",
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
            ),
            body: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Center(
                    child: Row(
                        children: buldHelpCards(),
                    ),
                ),
            ),
        );
    }

    List<Widget> buldHelpCards() {
        final images = ["help_1.png", "help_2.png", "help_3.png", "help_4.png"];
        var cards = <Widget>[];
        for(String image in images) {
            cards.add(
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                        ),
                        shadowColor: Colors.black,
                        elevation: 16,
                        child: Container(
                            width: MediaQuery.of(context).size.height*0.85*90/195,
                            height: MediaQuery.of(context).size.height*0.85,
                            child: FittedBox(
                                fit: BoxFit.fill,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(128),
                                    child: Image.asset("assets/images/"+image),
                                ),
                            ),
                        ),
                    )
                )
            );
        }
        return cards;
    }
}
