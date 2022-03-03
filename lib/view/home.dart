import 'package:apitest/models/AlbumModel.dart';
import 'package:apitest/providers/album_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _albumProvider = Provider.of<AlbumProvider>(context);

    return Scaffold(
        appBar:AppBar(
          leading: Icon(Icons.android),
          title: Text('Api with Provider'),
          actions: [
          ],
          backgroundColor: Colors.black87,
        ),
        body: Center(child: AlbumListView(context)));
  }

  Widget AlbumListView(BuildContext context) {
    var _albumProvider = Provider.of<AlbumProvider>(context);
    if (_albumProvider.isLoading) {
      _albumProvider.GetAllAlbums();
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _albumProvider.albums.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                title: Text(_albumProvider.albums[index].title),
                contentPadding: const EdgeInsets.all(8),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(_albumProvider.albums[index].thumbnailUrl),
                ),
              ));
        });
  }
}
