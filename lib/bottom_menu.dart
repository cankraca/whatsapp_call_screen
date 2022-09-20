import 'package:flutter/material.dart';
import 'asset_constants.dart';
import 'controls.dart';
import 'text_constants.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        color: Colors.black,
        width: width,
        height: height * 0.4,
        child: Column(
          children: [
            _topIcon(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _voiceIcon(),
                _videoIcon(),
                _micIcon(),
                _hangupIcon(),
              ],
            ),
            SizedBox(height: 15),
            Divider(
              thickness: 0.1,
              color: Colors.white,
            ),
            AddParticipant(),
            UserCard()
          ],
        ),
      ),
    );
  }

  IconButton _topIcon() {
    return IconButton(
      onPressed: () {
        setState(
          () {
            Controls.isShowed = !Controls.isShowed;
          },
        );
      },
      icon: Controls.isShowed
          ? Icon(Icons.keyboard_arrow_down)
          : Icon(Icons.keyboard_arrow_up),
    );
  }

  IconButton _voiceIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          Controls.isVoiceOn = !Controls.isVoiceOn;
        });
      },
      icon: Controls.isVoiceOn
          ? Icon(Icons.volume_up_sharp)
          : Icon(Icons.volume_off),
    );
  }

  IconButton _videoIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          Controls.isVideoOn = !Controls.isVideoOn;
        });
      },
      icon: Controls.isVideoOn
          ? Icon(Icons.videocam_rounded)
          : Icon(Icons.videocam_off),
    );
  }

  IconButton _micIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          Controls.isMicOn = !Controls.isMicOn;
        });
      },
      icon: Controls.isMicOn ? Icon(Icons.mic_off) : Icon(Icons.mic_outlined),
    );
  }

  CircleAvatar _hangupIcon() {
    return CircleAvatar(
      backgroundColor: Colors.red,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.call_end,
          color: Colors.white,
        ),
      ),
    );
  }
}

class AddParticipant extends StatelessWidget {
  const AddParticipant({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        backgroundColor: Color(0xff128C7E),
        radius: 15,
        child: Icon(
          Icons.person_add_sharp,
          color: Colors.white,
          size: 17,
        ),
      ),
      title: Text(TextConstants.addParticipant),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        radius: 15,
        backgroundImage: AssetImage(AssetConstants.profilePicture),
      ),
      title: Text(TextConstants.userName),
    );
  }
}
