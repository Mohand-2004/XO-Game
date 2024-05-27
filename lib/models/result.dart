import 'package:xo_game/models/player.dart';
abstract class Result{}
class WinResult extends Result{
  final Player winner;
  WinResult({required this.winner});
}
class TieResult extends Result{}