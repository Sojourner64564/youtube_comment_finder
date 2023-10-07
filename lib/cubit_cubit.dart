import 'package:bloc/bloc.dart';
import 'package:html/parser.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'cubit_state.dart';

class MyCubit extends Cubit<MyState> {
  MyCubit() : super(Initial());
//AIzaSyCHzVbBgBV7jxMOaTNhngcW_O3AeIWtLmQ

  void getif() async {
    var document =
        parse(sourceUrl: 'https://ufa.dikoed.ru/catalog/myed_paseka/', '');
    // print(document.head);
    //print(document.body);
    var response = await http
        .get(Uri.parse('https://www.youtube.com/watch?v=R5tLKlaeEac'));
    //If the http request is successful the statusCode will be 200
    if (response.statusCode == 200) {
      final htmlToParse = response.body;
      var myDocument = parse(htmlToParse);
      emit(Loaded(htmlToParse));
      print(myDocument.body);
    } else {
      print(response.statusCode);
    }
  }

  void myMethod() async {
    final response = await http.get(
      Uri.parse(
          'https://www.googleapis.com/youtube/v3/commentThreads?key=AIzaSyAwN8yc4ittxrac_rhW4swd63odvZbHRD8&part=snippet,replies&videoId=kWyXbLOQ1Lc'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      emit(Loaded(response.body));
      print(response.body);
    } else {
      print(response.statusCode);
      //Uri.https(authority)
    }
  }
}

/*
{
    "kind": "youtube#commentThreadListResponse",
    "etag": "IEuEhAYNzqyTnpDRGJ0dzi9RhuA",
    "pageInfo": {
        "totalResults": 1,
        "resultsPerPage": 20
    },
    "items": [
        {
            "kind": "youtube#commentThread",
            "etag": "cil1ISe8F0oqppB-4XmJb7KPzlo",
            "id": "UgwJNkaFoiw6uPCNGD14AaABAg",
            "snippet": {
                "channelId": "UC4Zm2tg3KxUHQiD2g8iikmw",
                "videoId": "kWyXbLOQ1Lc",
                "topLevelComment": {
                    "kind": "youtube#comment",
                    "etag": "aS59oRd4eStnHt650VyftLKyMSI",
                    "id": "UgwJNkaFoiw6uPCNGD14AaABAg",
                    "snippet": {
                        "channelId": "UC4Zm2tg3KxUHQiD2g8iikmw",
                        "videoId": "kWyXbLOQ1Lc",
                        "textDisplay": "мой топ левел коммент",
                        "textOriginal": "мой топ левел коммент",
                        "authorDisplayName": "Sojourner",
                        "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/APkrFKacInCK45LXPp0B8268dm5pDUW4mIrl5skZma3U=s48-c-k-c0x00ffffff-no-rj",
                        "authorChannelUrl": "http://www.youtube.com/channel/UC9oS0MSj_-bFWAW2MjeNYWA",
                        "authorChannelId": {
                            "value": "UC9oS0MSj_-bFWAW2MjeNYWA"
                        },
                        "canRate": true,
                        "viewerRating": "none",
                        "likeCount": 0,
                        "publishedAt": "2023-10-06T16:54:22Z",
                        "updatedAt": "2023-10-06T16:56:22Z"
                    }
                },
                "canReply": true,
                "totalReplyCount": 3,
                "isPublic": true
            },
            "replies": {
                "comments": [
                    {
                        "kind": "youtube#comment",
                        "etag": "lSEcbFQJr7Ko3xh-VseIX5RY7bA",
                        "id": "UgwJNkaFoiw6uPCNGD14AaABAg.9vXeHEf3_Uh9vXez3fu5WW",
                        "snippet": {
                            "channelId": "UC4Zm2tg3KxUHQiD2g8iikmw",
                            "videoId": "kWyXbLOQ1Lc",
                            "textDisplay": "ответ на анозер ван коммент",
                            "textOriginal": "ответ на анозер ван коммент",
                            "parentId": "UgwJNkaFoiw6uPCNGD14AaABAg",
                            "authorDisplayName": "Sojourner",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/APkrFKacInCK45LXPp0B8268dm5pDUW4mIrl5skZma3U=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UC9oS0MSj_-bFWAW2MjeNYWA",
                            "authorChannelId": {
                                "value": "UC9oS0MSj_-bFWAW2MjeNYWA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-10-06T17:00:29Z",
                            "updatedAt": "2023-10-06T17:00:29Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "9fG5YCOezOm0BQPv_nvqRwk7Cdw",
                        "id": "UgwJNkaFoiw6uPCNGD14AaABAg.9vXeHEf3_Uh9vXee7K0nuu",
                        "snippet": {
                            "channelId": "UC4Zm2tg3KxUHQiD2g8iikmw",
                            "videoId": "kWyXbLOQ1Lc",
                            "textDisplay": "второй коммент",
                            "textOriginal": "второй коммент",
                            "parentId": "UgwJNkaFoiw6uPCNGD14AaABAg",
                            "authorDisplayName": "Sojourner",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/APkrFKacInCK45LXPp0B8268dm5pDUW4mIrl5skZma3U=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UC9oS0MSj_-bFWAW2MjeNYWA",
                            "authorChannelId": {
                                "value": "UC9oS0MSj_-bFWAW2MjeNYWA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-10-06T16:57:37Z",
                            "updatedAt": "2023-10-06T16:57:37Z"
                        }
                    },
                    {
                        "kind": "youtube#comment",
                        "etag": "q5UH3HfX0jC0gLgyxdMJwQP3wR8",
                        "id": "UgwJNkaFoiw6uPCNGD14AaABAg.9vXeHEf3_Uh9vXeHlenfGn",
                        "snippet": {
                            "channelId": "UC4Zm2tg3KxUHQiD2g8iikmw",
                            "videoId": "kWyXbLOQ1Lc",
                            "textDisplay": "анозер ван коммент",
                            "textOriginal": "анозер ван коммент",
                            "parentId": "UgwJNkaFoiw6uPCNGD14AaABAg",
                            "authorDisplayName": "Sojourner",
                            "authorProfileImageUrl": "https://yt3.ggpht.com/ytc/APkrFKacInCK45LXPp0B8268dm5pDUW4mIrl5skZma3U=s48-c-k-c0x00ffffff-no-rj",
                            "authorChannelUrl": "http://www.youtube.com/channel/UC9oS0MSj_-bFWAW2MjeNYWA",
                            "authorChannelId": {
                                "value": "UC9oS0MSj_-bFWAW2MjeNYWA"
                            },
                            "canRate": true,
                            "viewerRating": "none",
                            "likeCount": 0,
                            "publishedAt": "2023-10-06T16:54:26Z",
                            "updatedAt": "2023-10-06T16:57:18Z"
                        }
                    }
                ]
            }
        }
    ]
}
 */