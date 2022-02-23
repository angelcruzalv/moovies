import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moovies/models/movie.dart';
import 'package:moovies/views/export_views.dart';

class DetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    final Movie myMovie;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate(
                [_PosterAndTitle(), _OverView(), CastingCards()]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.red,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black26,
          padding: EdgeInsets.only(bottom: 15),
          child: Text('movie.title'),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 200,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This is the Movie Title',
                style: textTheme.headline6,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'This is the Movie Original Title',
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 25,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Vote AVG',
                    style: textTheme.caption,
                  )
                ],
              ),

              // color: Colors.red,

              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: SvgPicture.network(
                        'https://upload.wikimedia.org/wikipedia/commons/0/08/Netflix_2015_logo.svg'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: SvgPicture.network(
                        'https://upload.wikimedia.org/wikipedia/commons/1/17/HBO_Max_Logo.svg'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: SvgPicture.network(
                        'https://upload.wikimedia.org/wikipedia/commons/1/11/Amazon_Prime_Video_logo.svg'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: SvgPicture.network(
                        'https://upload.wikimedia.org/wikipedia/commons/2/28/Apple_TV_Plus_Logo.svg'),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Sunt sit consequat excepteur non aliqua dolore laboris cupidatat ipsum velit sunt sit ex. Duis deserunt elit laborum ad cupidatat. Mollit officia amet in minim dolor. Aute veniam labore irure est do deserunt irure ipsum anim cillum ad irure id. Laboris ullamco nostrud culpa sit fugiat incididunt laboris consequat labore ut adipisicing consectetur voluptate dolor.Ut mollit nulla exercitation occaecat consequat consequat veniam commodo est. Consequat reprehenderit do incididunt commodo eiusmod aute tempor do Lorem officia. Enim enim eu ea consectetur mollit adipisicing.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
