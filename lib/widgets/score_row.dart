import 'package:flutter/material.dart';
import 'package:xo_game/models/lable.dart';
import 'package:xo_game/models/player.dart';
class ScoreRow extends StatelessWidget{
  final Player player;
  const ScoreRow({super.key,required this.player});
  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        // win logo
        Expanded(
          flex: 14,
          child: Image(
            image: AssetImage(player.lable == Lable.X ? 'assets/images/first.png' : 'assets/images/first1.png'),
          )
        ),

        // space between
        const SizedBox(width: 8,),

        // player text
        const Expanded(
          flex: 31,
          child: SizedBox(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'player',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Comic Sans',
                ),
              ),
            ),
          )
        ),

        // space between
        const SizedBox(width: 3,),

        // player character icon
        Expanded(
          flex: 10,
          child: Image(image: player.image)
        ),

        // space between
        const SizedBox(width: 8,),

        // score text
        const Expanded(
          flex: 35,
          child: SizedBox(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'score :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Comic Sans',
                ),
              ),
            ),
          )
        ),

        // player score
        Expanded(
          flex: 10,
          child: SizedBox(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                ' ${player.winTimes}',
                style: const TextStyle(
                  fontFamily: 'Impact',
                ),
              ),
            ),
          )
        ),
      ],
    );
  }
}