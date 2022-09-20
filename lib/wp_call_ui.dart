import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'asset_constants.dart';
import 'bottom_menu.dart';
import 'controls.dart';
import 'text_constants.dart';

class CallUi extends StatefulWidget {
  const CallUi({super.key});

  @override
  State<CallUi> createState() => _CallUiState();
}

class _CallUiState extends State<CallUi> {
  Duration duration = Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(),
        title: MyTitle(),
        actions: [MyLeadingWidget()],
      ),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetConstants.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    UserName(),
                    buildTime(),
                  ],
                ),
                ProfilePicture(),
              ],
            ),
          ),
          MenuOpacity(),
          AnimatedMenu()
        ],
      ),
    );
  }

  Text buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      '$hours:$minutes:$seconds',
      style: Theme.of(context)
          .textTheme
          .headline5!
          .copyWith(color: Colors.white54),
    );
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => _addTime());
  }

  _addTime() {
    setState(() {
      final seconds = duration.inSeconds + 1;
      duration = Duration(seconds: seconds);
    });
  }
}

class MenuOpacity extends StatelessWidget {
  const MenuOpacity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 200),
      opacity: Controls.isShowed ? 1.0 : 0.0,
      child: BackdropFilter(
        filter: ImageFilter.blur(),
        child: Container(
          color: Colors.black.withOpacity(.3),
        ),
      ),
    );
  }
}

class AnimatedMenu extends StatelessWidget {
  const AnimatedMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 200),
      left: 0,
      bottom: Controls.isShowed
          ? 0
          : -(MediaQuery.of(context).size.height * 0.4 - 104),
      child: MenuWidget(),
    );
  }
}

class MyLeadingWidget extends StatelessWidget {
  const MyLeadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: IconButton(
        onPressed: () {},
        icon: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.person_add_sharp,
          ),
        ),
      ),
    );
  }
}

class MyTitle extends StatelessWidget {
  const MyTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.lock,
          color: Colors.white54,
          size: 17,
        ),
        SizedBox(width: 3),
        Text(
          TextConstants.appBarTitle,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white54),
        ),
      ],
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.arrow_back_ios_new,
        size: 20,
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      TextConstants.userName,
      style: Theme.of(context).textTheme.headline4!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 80,
      backgroundImage: AssetImage(
        AssetConstants.profilePicture,
      ),
    );
  }
}
