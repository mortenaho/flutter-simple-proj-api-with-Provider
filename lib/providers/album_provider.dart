import 'package:apitest/models/AlbumModel.dart';
import 'package:apitest/services/album_services.dart';
import 'package:flutter/cupertino.dart';

class AlbumProvider with ChangeNotifier {
  late AlbumServices albumServices;
  Album album = new Album();
  List<Album> albums = [];

  AlbumProvider() {
    albumServices = new AlbumServices(this);
  }

  late bool isLoading = true;

  Album getAlbum() {
    return album;
  }

  List<Album> getAlbums() {
    return albums;
  }

  setIsLoading(bool value) async{
    isLoading = value;
    notifyListeners();
  }
  setAlbums(List<Album> values) {
    albums = values;
   // notifyListeners();
  }
  GetAllAlbums() async {
     await albumServices.getAllAlbums();
  }
}
