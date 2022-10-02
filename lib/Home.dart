import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

///TIPOS DE EXECUÇÃO
/*UrlSource: obtenha o áudio de uma URL remota da Internet. Este pode ser um link direto para um arquivo suportado a ser baixado, ou um fluxo de rádio.
DeviceFileSource: acesse um arquivo no dispositivo do usuário, provavelmente selecionado por um catador de arquivos
AssetSource: jogue um ativo empacotado com seu aplicativo, normalmente dentro do diretório assets
BytesSource (apenas algumas plataformas): passe nos bytes do seu áudio diretamente */
AudioPlayer _vPlayer = AudioPlayer();
double _Volume = 1;

void _execute() async {
  //await vPlayer.play(UrlSource('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
  _vPlayer.setVolume(_Volume);
  await _vPlayer.play(AssetSource('Audio/musica.mp3'));
}

void _pause() async {
  ///grava onde parou
  await _vPlayer.pause();
}

///Para a música e reinicia a posição da música.
void _stop() async {
  await _vPlayer.stop();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Executando SONS'),
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 16),
              child: Text("VOLUME",
              style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.bold
              ),
              )
          ),

          Padding(
              padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: Slider(
                  value: _Volume,
                  min: 0,
                  max: 1,
                  onChanged: (double vNovoVolume) {
                    setState(() {
                      _Volume = vNovoVolume;
                    });

                    ///chama o método que regula o volume...
                    _vPlayer.setVolume(vNovoVolume);
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Image.asset('assets/img/play.png'),
                onTap: _execute,
              ),
              GestureDetector(
                child: Image.asset('assets/img/pause.png'),
                onTap: _pause,
              ),
              GestureDetector(
                child: Image.asset('assets/img/stop.png'),
                onTap: _stop,
              ),
            ],
          )
        ],
      ),
    );
  }
}
