import 'dart:convert' as convert;

import 'package:apitest/models/AlbumModel.dart';
import 'package:apitest/providers/album_provider.dart';
import 'package:apitest/services/base_services.dart';
import 'package:http/http.dart' as http;

class AlbumServices extends BaseServices {
  AlbumProvider albumProvider;

  AlbumServices(this.albumProvider);

   getAllAlbums() async {
     if (this.albumProvider.isLoading) {
       try {
         var response = await http
             .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
         if (response.statusCode == 200) {
           Iterable data = convert.jsonDecode(response.body);
           List<Album> albums =
           List<Album>.from(data.map((model) => Album.fromMap(model)));
           this.albumProvider.setAlbums(albums);
         } else {
           print('Request failed with status: ${response.statusCode}.');
         }
       } catch (exception) {
         print('Error Request: ${exception}.');
       }
       this.albumProvider.setIsLoading(false);
     }
   }
}
