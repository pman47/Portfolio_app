import 'package:flutter/material.dart';
import 'package:portfolio/responsive_widget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
        ),
        drawer: ResponsiveWidget.isSmallScreen(context)
            ? Drawer(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    NavButton(
                      text: "about",
                      onPressed: () {},
                    ),
                    NavButton(
                      text: "work",
                      onPressed: () {},
                    ),
                    NavButton(
                      text: "contact",
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            : null,
        body: SingleChildScrollView(
          child: AnimatedPadding(
            duration: Duration(seconds: 1),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
            child: ResponsiveWidget(
              largeScreen: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NavHeader(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ProfileInfo(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  SocialInfo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MKDOT(),
          if (!ResponsiveWidget.isSmallScreen(context))
            Row(
              children: [
                NavButton(
                  text: "about",
                  onPressed: () {},
                ),
                NavButton(
                  text: "work",
                  onPressed: () {},
                ),
                NavButton(
                  text: "contact",
                  onPressed: () {},
                ),
              ],
            )
        ],
      ),
    );
  }
}

class MKDOT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("MK",
            textScaleFactor: 2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        SizedBox(width: 5),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
          ),
        )
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

  const NavButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.color = Colors.orange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
      ),
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side: BorderSide(color: color)))),
      onPressed: onPressed,
    );
  }
}

class ProfileInfo extends StatelessWidget {
  profileImage(context) => AnimatedContainer(
        duration: Duration(seconds: 1),
        height: ResponsiveWidget.isLargeScreen(context)
            ? MediaQuery.of(context).size.height * 0.4
            : MediaQuery.of(context).size.width * 0.4,
        width: ResponsiveWidget.isLargeScreen(context)
            ? MediaQuery.of(context).size.height * 0.4
            : MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("Manish.png"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );

  final profileData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Hi there! My name is",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.orange),
      ),
      Text(
        "Manish\nPrajapati",
        textScaleFactor: 5,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Text(
        "I am a noob developer...\n"
        "I am noob...\n"
        "...",
        softWrap: true,
        textScaleFactor: 1.5,
        style: TextStyle(color: Colors.white70),
      ),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("Resume"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.white,
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 50),
            ),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {},
            // shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            child: Text("Say Hi!"),
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onPrimary: Colors.white,
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 50),
              side: BorderSide(color: Colors.red, width: 2),
            ),
          )
        ],
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[profileImage(context), profileData],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          profileImage(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          profileData,
        ],
      ),
    );
  }
}

class SocialInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NavButton(
                text: "Github",
                onPressed: () {},
                color: Colors.blue,
              ),
              NavButton(
                text: "Twitter",
                onPressed: () {},
                color: Colors.blue,
              ),
              NavButton(
                text: "Facebook",
                onPressed: () {},
                color: Colors.blue,
              ),
            ],
          ),
          Text(
            "Manish Prajapati ©2021",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NavButton(
            text: "Github",
            onPressed: () {},
            color: Colors.blue,
          ),
          NavButton(
            text: "Twitter",
            onPressed: () {},
            color: Colors.blue,
          ),
          NavButton(
            text: "Facebook",
            onPressed: () {},
            color: Colors.blue,
          ),
          Text(
            "Manish Prajapati ©2021",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
