import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nymble_pet_adoption/provider/provider.dart';
import 'package:nymble_pet_adoption/u.dart';

import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.tColor2,
        body: Stack(
      children: [
        Stack(
          children: [
            ListView(children: [
              const SizedBox(
                height: 16,
              ),
               const Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage('https://img.freepik.com/free-photo/looking-food-cute-black-french-bulldog-posing-isolated-white-studio-background_155003-46328.jpg?t=st=1713900471~exp=1713904071~hmac=98566b7e782460d543cdf3463a61c1871aef62387a6c1e0e2c5bd5e5f1df2cc9&w=740'), 
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "User",
                style: AppFonts.quicksand(size: 30,color:context.read<ThemeControl>().value ? AppColors.textColor: Colors.white),
                textAlign: TextAlign.center,
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    context.read<ThemeControl>().themeValue();
                  },
                  leading: (context.read<ThemeControl>().value)
                      ? const Icon(CupertinoIcons.lightbulb)
                      : const Icon(CupertinoIcons.sun_max),
                  title: (context.read<ThemeControl>().value)
                      ?  Text('Light Mode', style: AppFonts.quicksand(size: 20,color: AppColors.textColor),)
                      :  Text('Dark Mode',style: AppFonts.quicksand(size: 20,color: Colors.white)),
                ),
              ),
            ]),
          ],
        ),
      ],
    ));
  }
}
