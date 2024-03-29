import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:privertenotes/Views/notes/notes_list_view.dart';
import 'package:privertenotes/services/auth/auth_service.dart';
import 'package:privertenotes/services/crud/note_service.dart';
import '../../constants/routes.dart';
import '../../enums/menu_action.dart';
import 'dart:developer' as devtool show log;

import '../../utilities/dialogs/logout_dialog.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  late final NotesService _notesService;
  String get userEmail => AuthService.firebase().currentUser!.email!;

  @override
  void initState() {
    _notesService = NotesService();
    _notesService.open();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Notes"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(newNoteRoute);
              },
              icon: const Icon(Icons.add),
            ),
            PopupMenuButton(
                onSelected: (Menu item) async {
                  devtool.log(item.toString());
                  switch (item) {
                    case Menu.logout:
                      final shouldLogOut = await showLogOutDialog(context);
                      if (shouldLogOut) {
                        await AuthService.firebase().logOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            loginRoute, (route) => false);
                      }
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                      const PopupMenuItem<Menu>(
                        value: Menu.logout,
                        child: Text('Logout'),
                      ),
                    ]),
          ],
        ),
        body: FutureBuilder(
          future: _notesService.getOrCreateUser(email: userEmail),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return StreamBuilder(
                    stream: _notesService.allNotes,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.active:
                          if (snapshot.hasData) {
                            final allNotes =
                                snapshot.data as List<DatabaseNote>;
                            print(allNotes);
                            return NotesListView(
                                notes: allNotes,
                                onDeleteNote: (note) async {
                                  await _notesService.deleteNote(id: note.id);
                                });
                          } else {
                            return const CircularProgressIndicator();
                          }

                        default:
                          return const CircularProgressIndicator();
                      }
                    });
              default:
                return const CircularProgressIndicator();
            }
          },
        ));
  }
}

// Future<bool> showLogOutDialog(BuildContext context) {
//   return showDialog<bool>(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Sign Out"),
//           content: const Text("Are you sure you want to sign out ?"),
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(false);
//                 },
//                 child: const Text('Cancel')),
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(true);
//                 },
//                 child: const Text('Log out')),
//           ],
//         );
//       }).then((value) => value ?? false);
// }
