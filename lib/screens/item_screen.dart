import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flicr/blocs/main_bloc_provider.dart';
import 'package:flicr/blocs/main_bloc.dart';

class ItemScreen extends StatelessWidget {
  final List<dynamic> itemData;
  ItemScreen(this.itemData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = MainBlocProvider.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: itemData[1],
              placeholder: (context, url) => CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fadeInDuration: Duration(seconds: 1),
            ),
            SizedBox(
              height: 40,
            ),
            StreamBuilder(
                stream: bloc.listOut,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Icon(
                      Icons.favorite,
                      size: 50,
                      color: Colors.grey[400],
                    );
                  }
                  return GestureDetector(
                    child: snapshot.data[itemData[0]].liked
                        ? Icon(
                            Icons.favorite,
                            size: 50,
                            color: Colors.red[900],
                          )
                        : Icon(
                            Icons.favorite,
                            size: 50,
                            color: Colors.grey[400],
                          ),
                    onTap: () => bloc.liker([itemData[0]]),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
