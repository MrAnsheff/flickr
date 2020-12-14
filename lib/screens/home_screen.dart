import 'package:flutter/material.dart';
import 'package:flicr/blocs/main_bloc_provider.dart';
import 'package:flicr/blocs/main_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = MainBlocProvider.of(context);
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: bloc.listOut,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              bloc.fetchItems();
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/item',
                      arguments: [index, snapshot.data[index].media]),
                  child: Card(
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: snapshot.data[index].media,
                          placeholder: (context, url) =>
                              CupertinoActivityIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fadeInDuration: Duration(seconds: 1),
                          height: 300,
                        ),
                        GestureDetector(
                          child: snapshot.data[index].liked
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
                          onTap: () => bloc.liker([index]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
