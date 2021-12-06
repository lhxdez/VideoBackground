import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const VideoTest());
}

class VideoTest extends StatefulWidget {
  const VideoTest({Key? key}) : super(key: key);

  @override
  _VideoTestState createState() => _VideoTestState();
}

class _VideoTestState extends State<VideoTest> {
  late VideoPlayerController _videoPlayerController;
  final contentText = [
    "Fique por dentro das principais inovações que transformam sua carreira e seu negócio",
    "Descubra diariamente novos temas e conteúdos que realmente importam para você",
    "Aprenda as estratégias de sucesso com as empresas mais inovadoras do mundo"
  ];
  final titleText = [
    "Conhecimento do agora",
    "Experiência Personalizada",
    "Imersões Internacionais"
  ];
  final String logo = 'lib/assets/startSe.svg';

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('lib/assets/cityBoulevard.mp4')
          ..initialize().then((context) {
            _videoPlayerController.play();
            _videoPlayerController.setLooping(true);
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: const MediaQueryData(),
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              // SizedBox.expand(
              //   child: FittedBox(
              //     fit: BoxFit.cover,
              //     child: SizedBox(
              //       height: _videoPlayerController.value.size.height,
              //       width: _videoPlayerController.value.size.width,
              //       child: VideoPlayer(_videoPlayerController),
              //     ),
              //   ),
              // ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        logo,
                        color: Colors.black,
                        semanticsLabel: 'Startse Logo',
                        fit: BoxFit.contain,
                        width: 62,
                      ),
                      Container(
                        width: 200,
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 50,
                            autoPlay: true,
                          ),
                          itemCount: contentText.length,
                          itemBuilder: (context, itemIndex, realIndex) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(titleText[itemIndex],
                                      textAlign: TextAlign.left,
                                      style:
                                          const TextStyle(color: Colors.red)),
                                ),
                                Text(contentText[itemIndex],
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 6)),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
