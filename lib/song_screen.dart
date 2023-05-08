import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:test_music_app/models/playlist_model.dart';
import 'package:test_music_app/player_buttos.dart';
import 'package:test_music_app/seekbar.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import 'models/song_model.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  Song song = Get.arguments ?? Song.songs[0];


  @override
  void initState(){
    super.initState();
    audioPlayer.setAudioSource(
        ConcatenatingAudioSource(
            children: [
              AudioSource.uri(
                  Uri.parse('asset:///${song.url}')),
            ])
    );
  }

  @override
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration, SeekBarData>(
          audioPlayer.positionStream,
          audioPlayer.positionStream,
              (Duration position, Duration? duration){
            return SeekBarData(position, duration ?? Duration.zero);
          });
  @override
  Widget build(BuildContext context) {
    Playlist playlist = Playlist.playlists[0];
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade800.withOpacity(0.8),
                Colors.deepPurple.shade200.withOpacity(0.8),
              ])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                        playlist.imageUrl,
                      height: MediaQuery.of(context).size.height *0.3,
                      width: MediaQuery.of(context).size.height *0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 30,),
                  _MusicPlayer(
                    song: song,
                    seekBarDataStream: _seekBarDataStream,
                    audioPlayer: audioPlayer,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MusicPlayer extends StatelessWidget {
  const _MusicPlayer({Key? key,
    required this.song,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer
  }) : _seekBarDataStream = seekBarDataStream,super(key: key);

  final Song song;
  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
      child: Column(
        children: [
          Text(
            song.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            song.description,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white
            ),
          ),
          SizedBox(height: 30,),
          StreamBuilder<SeekBarData>(
              stream: _seekBarDataStream,
              builder: (context, snapshot){
                final positionData = snapshot.data;
                return SeekBar(
                  position: positionData?.position?? Duration.zero,
                  duration: positionData?.duration?? Duration.zero,
                  onChangeEnd: audioPlayer.seek,
                );
              }
          ),
          PlayerButtons(audioPlayer: audioPlayer)
        ],
      ),
    );
  }
}


