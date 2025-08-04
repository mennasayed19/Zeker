import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zeker_app/core/helpers/audio_player.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit() : super(RadioInitial());

    bool isPlaying = false;
void togglePlay(String url) async {
    if (isPlaying) {
      await CustomAudioPlayer.pause();
      emit(RadioPaused());
    } else {
      await CustomAudioPlayer.play(url: url);
      emit(RadioPlaying());
    }
    isPlaying = !isPlaying;
  }

    void stop() async {
    await CustomAudioPlayer.stop();
    emit(RadioStopped());
    isPlaying = false;
  }

}
