import 'package:crud_app/user_provider.dart';
import 'package:crud_app/user.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    List<User> users = userProvider.users;
    int usersLength = users.length;
    return Scaffold(
      appBar: AppBar(
        title: Text('User list'),
        leading: BackButton(
          onPressed: () {
            userProvider.indexUser = null;
            Navigator.popAndPushNamed(context, '/create');
          },
        ),
      ),
      body: ListView.builder(
          itemCount: usersLength,
          itemBuilder: (BuildContext contextBuilder, indexBuilder) => Container(
                child: ListTile(
                  title: Text(users[indexBuilder].name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            userProvider.userSelected = users[indexBuilder];
                            userProvider.indexUser = indexBuilder;
                            Navigator.popAndPushNamed(context, '/create');
                          },
                          icon: Icon(Icons.edit))
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 0.8))),
              )),
    );
  }
}
