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
    "Fique por dentro das principais\ninovações que transformam sua\ncarreira e seu negócio",
    "Descubra diariamente novos temas e\nconteúdos que realmente importam\npara você",
    "Aprenda as estratégias de sucesso\ncom as empresas mais inovadoras do\nmundo"
  ];
  final titleText = [
    "Conhecimento\ndo agora",
    "Experiência\nPersonalizada",
    "Imersões\nInternacionais"
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
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    height: _videoPlayerController.value.size.height,
                    width: _videoPlayerController.value.size.width,
                    child: VideoPlayer(_videoPlayerController),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 25, bottom: 32),
                      child: SvgPicture.asset(
                        logo,
                        color: const Color.fromRGBO(252, 249, 249, 1),
                        semanticsLabel: 'Startse Logo',
                        fit: BoxFit.contain,
                        width: 80,
                      ),
                    ),
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlayInterval: const Duration(seconds: 3),
                        viewportFraction: 1,
                        height: 140,
                        autoPlay: true,
                      ),
                      itemCount: contentText.length,
                      itemBuilder: (context, itemIndex, realIndex) {
                        return Container(
                          padding: const EdgeInsets.only(left: 25),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(titleText[itemIndex],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 24)),
                              const SizedBox(
                                height: 20,
                                width: 20,
                              ),
                              Text(contentText[itemIndex],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 13))
                            ],
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 25),
                      child: Row(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              width: 50,
                              height: 8,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white)),
                          Container(
                              alignment: Alignment.centerLeft,
                              width: 50,
                              height: 8,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white)),
                          Container(
                              alignment: Alignment.centerLeft,
                              width: 50,
                              height: 8,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 25),
                      child: ElevatedButton(
                          onPressed: () {
                            print('clicou');
                          },
                          child: Text('Começar'),
                          style: ElevatedButton.styleFrom(
                              alignment: Alignment.center,
                              textStyle: const TextStyle(fontSize: 20))),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
