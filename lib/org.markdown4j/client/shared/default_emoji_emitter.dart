//
//  DefaultEmojiEmitter.java
//  markdown4j-gwt
//
//  Created by William Shakour (billy1380) on 18 Jul 2017.
//  Copyright © 2017 WillShex Limited. All rights reserved.
//

import 'package:markdown4f/markdown4f.dart';

/// @author William Shakour (billy1380)
///
class DefaultEmojiEmitter implements EmojiEmitter {
  /* private */ static const String START = "&#x";
  /* private */ static const String END = ";";
  /* private */ static const String SEPARATOR = END + START;

  /* (non-Javadoc)
	 * 
	 * @see com.github.rjeschke.txtmark.EmojiEmitter#emitEmoji(java.lang.
	 * StringBuilder, java.lang.String,
	 * com.github.rjeschke.txtmark.Decorator) */
  @override
  void emitEmoji(StringBuffer out, String name, Decorator decorator) {
    out.write(html(name));
  }

  static String html(String name) {
    String c = code(name), html = "";

    if (c == null) {
    } else {
      html = "$START${c.replaceAll("_", SEPARATOR)}$END";
    }

    return html;
  }

  static String code(String name) {
    // smiling face with open mouth and smiling eyes
    if (":u1f604:" == name || ":smile:" == name) return "1f604";
    // smiling face with open mouth
    if (":u1f603:" == name || ":smiley:" == name) return "1f603";
    // grinning face
    if (":u1f600:" == name || ":grinning:" == name) return "1f600";
    // smiling face with smiling eyes
    if (":u1f60a:" == name) return "1f60a";
    // white smiling face
    if (":u263a:" == name || ":relaxed:" == name) return "263a";
    // winking face
    if (":u1f609:" == name || ":wink:" == name) return "1f609";
    // smiling face with heart-shaped eyes
    if (":u1f60d:" == name || ":heart_eyes:" == name) return "1f60d";
    // face throwing a kiss
    if (":u1f618:" == name || ":kissing_heart:" == name) return "1f618";
    // kissing face with closed eyes
    if (":u1f61a:" == name || ":kissing_closed_eyes:" == name) return "1f61a";
    // kissing face
    if (":u1f617:" == name || ":kissing:" == name) return "1f617";
    // kissing face with smiling eyes
    if (":u1f619:" == name || ":kissing_smiling_eyes:" == name) return "1f619";
    // face with stuck-out tongue and winking eye
    if (":u1f61c:" == name || ":stuck_out_tongue_winking_eye:" == name)
      return "1f61c";
    // face with stuck-out tongue and tightly-closed eyes
    if (":u1f61d:" == name || ":stuck_out_tongue_closed_eyes:" == name)
      return "1f61d";
    // face with stuck-out tongue
    if (":u1f61b:" == name || ":stuck_out_tongue:" == name) return "1f61b";
    // flushed face
    if (":u1f633:" == name || ":flushed:" == name) return "1f633";
    // grinning face with smiling eyes
    if (":u1f601:" == name || ":grin:" == name) return "1f601";
    // pensive face
    if (":u1f614:" == name || ":pensive:" == name) return "1f614";
    // relieved face
    if (":u1f60c:" == name || ":relieved:" == name) return "1f60c";
    // unamused face
    if (":u1f612:" == name || ":unamused:" == name) return "1f612";
    // disappointed face
    if (":u1f61e:" == name || ":disappointed:" == name) return "1f61e";
    // persevering face
    if (":u1f623:" == name || ":persevere:" == name) return "1f623";
    // crying face
    if (":u1f622:" == name || ":cry:" == name) return "1f622";
    // face with tears of joy
    if (":u1f602:" == name || ":joy:" == name) return "1f602";
    // loudly crying face
    if (":u1f62d:" == name || ":sob:" == name) return "1f62d";
    // sleepy face
    if (":u1f62a:" == name || ":sleepy:" == name) return "1f62a";
    // disappointed but relieved face
    if (":u1f625:" == name || ":disappointed_relieved:" == name) return "1f625";
    // face with open mouth and cold sweat
    if (":u1f630:" == name || ":cold_sweat:" == name) return "1f630";
    // smiling face with open mouth and cold sweat
    if (":u1f605:" == name || ":sweat_smile:" == name) return "1f605";
    // face with cold sweat
    if (":u1f613:" == name || ":sweat:" == name) return "1f613";
    // weary face
    if (":u1f629:" == name || ":weary:" == name) return "1f629";
    // tired face
    if (":u1f62b:" == name || ":tired_face:" == name) return "1f62b";
    // fearful face
    if (":u1f628:" == name || ":fearful:" == name) return "1f628";
    // face screaming in fear
    if (":u1f631:" == name || ":scream:" == name) return "1f631";
    // angry face
    if (":u1f620:" == name || ":angry:" == name) return "1f620";
    // pouting face
    if (":u1f621:" == name || ":rage:" == name) return "1f621";
    // face with look of triumph
    if (":u1f624:" == name || ":triumph:" == name) return "1f624";
    // confounded face
    if (":u1f616:" == name || ":confounded:" == name) return "1f616";
    // smiling face with open mouth and tightly-closed eyes
    if (":u1f606:" == name || ":laughing:" == name || ":satisfied:" == name)
      return "1f606";
    // face savouring delicious food
    if (":u1f60b:" == name || ":yum:" == name) return "1f60b";
    // face with medical mask
    if (":u1f637:" == name || ":mask:" == name) return "1f637";
    // smiling face with sunglasses
    if (":u1f60e:" == name || ":sunglasses:" == name) return "1f60e";
    // sleeping face
    if (":u1f634:" == name || ":sleeping:" == name) return "1f634";
    // dizzy face
    if (":u1f635:" == name || ":dizzy_face:" == name) return "1f635";
    // astonished face
    if (":u1f632:" == name || ":astonished:" == name) return "1f632";
    // worried face
    if (":u1f61f:" == name || ":worried:" == name) return "1f61f";
    // frowning face with open mouth
    if (":u1f626:" == name || ":frowning:" == name) return "1f626";
    // anguished face
    if (":u1f627:" == name || ":anguished:" == name) return "1f627";
    // smiling face with horns
    if (":u1f608:" == name || ":smiling_imp:" == name) return "1f608";
    // imp
    if (":u1f47f:" == name || ":imp:" == name) return "1f47f";
    // face with open mouth
    if (":u1f62e:" == name || ":open_mouth:" == name) return "1f62e";
    // grimacing face
    if (":u1f62c:" == name || ":grimacing:" == name) return "1f62c";
    // neutral face
    if (":u1f610:" == name || ":neutral_face:" == name) return "1f610";
    // confused face
    if (":u1f615:" == name || ":confused:" == name) return "1f615";
    // hushed face
    if (":u1f62f:" == name || ":hushed:" == name) return "1f62f";
    // face without mouth
    if (":u1f636:" == name || ":no_mouth:" == name) return "1f636";
    // smiling face with halo
    if (":u1f607:" == name || ":innocent:" == name) return "1f607";
    // smirking face
    if (":u1f60f:" == name || ":smirk:" == name) return "1f60f";
    // expressionless face
    if (":u1f611:" == name || ":expressionless:" == name) return "1f611";
    // man with gua pi mao
    if (":u1f472:" == name || ":man_with_gua_pi_mao:" == name) return "1f472";
    // man with turban
    if (":u1f473:" == name || ":man_with_turban:" == name) return "1f473";
    // police officer
    if (":u1f46e:" == name || ":cop:" == name) return "1f46e";
    // construction worker
    if (":u1f477:" == name || ":construction_worker:" == name) return "1f477";
    // guardsman
    if (":u1f482:" == name || ":guardsman:" == name) return "1f482";
    // baby
    if (":u1f476:" == name || ":baby:" == name) return "1f476";
    // boy
    if (":u1f466:" == name || ":boy:" == name) return "1f466";
    // girl
    if (":u1f467:" == name || ":girl:" == name) return "1f467";
    // man
    if (":u1f468:" == name || ":man:" == name) return "1f468";
    // woman
    if (":u1f469:" == name || ":woman:" == name) return "1f469";
    // older man
    if (":u1f474:" == name || ":older_man:" == name) return "1f474";
    // older woman
    if (":u1f475:" == name || ":older_woman:" == name) return "1f475";
    // person with blond hair
    if (":u1f471:" == name || ":person_with_blond_hair:" == name)
      return "1f471";
    // baby angel
    if (":u1f47c:" == name || ":angel:" == name) return "1f47c";
    // princess
    if (":u1f478:" == name || ":princess:" == name) return "1f478";
    // smiling cat face with open mouth
    if (":u1f63a:" == name || ":smiley_cat:" == name) return "1f63a";
    // grinning cat face with smiling eyes
    if (":u1f638:" == name || ":smile_cat:" == name) return "1f638";
    // smiling cat face with heart-shaped eyes
    if (":u1f63b:" == name || ":heart_eyes_cat:" == name) return "1f63b";
    // kissing cat face with closed eyes
    if (":u1f63d:" == name || ":kissing_cat:" == name) return "1f63d";
    // cat face with wry smile
    if (":u1f63c:" == name || ":smirk_cat:" == name) return "1f63c";
    // weary cat face
    if (":u1f640:" == name || ":scream_cat:" == name) return "1f640";
    // crying cat face
    if (":u1f63f:" == name || ":crying_cat_face:" == name) return "1f63f";
    // cat face with tears of joy
    if (":u1f639:" == name || ":joy_cat:" == name) return "1f639";
    // pouting cat face
    if (":u1f63e:" == name || ":pouting_cat:" == name) return "1f63e";
    // japanese ogre
    if (":u1f479:" == name || ":japanese_ogre:" == name) return "1f479";
    // japanese goblin
    if (":u1f47a:" == name || ":japanese_goblin:" == name) return "1f47a";
    // see-no-evil monkey
    if (":u1f648:" == name || ":see_no_evil:" == name) return "1f648";
    // hear-no-evil monkey
    if (":u1f649:" == name || ":hear_no_evil:" == name) return "1f649";
    // speak-no-evil monkey
    if (":u1f64a:" == name || ":speak_no_evil:" == name) return "1f64a";
    // skull
    if (":u1f480:" == name || ":skull:" == name) return "1f480";
    // extraterrestrial alien
    if (":u1f47d:" == name || ":alien:" == name) return "1f47d";
    // pile of poo
    if (":u1f4a9:" == name ||
        ":hankey:" == name ||
        ":poop:" == name ||
        ":shit:" == name) return "1f4a9";
    // fire
    if (":u1f525:" == name || ":fire:" == name) return "1f525";
    // sparkles
    if (":u2728:" == name || ":sparkles:" == name) return "2728";
    // glowing star
    if (":u1f31f:" == name || ":star2:" == name) return "1f31f";
    // dizzy symbol
    if (":u1f4ab:" == name || ":dizzy:" == name) return "1f4ab";
    // collision symbol
    if (":u1f4a5:" == name || ":boom:" == name || ":collision:" == name)
      return "1f4a5";
    // anger symbol
    if (":u1f4a2:" == name || ":anger:" == name) return "1f4a2";
    // splashing sweat symbol
    if (":u1f4a6:" == name || ":sweat_drops:" == name) return "1f4a6";
    // droplet
    if (":u1f4a7:" == name || ":droplet:" == name) return "1f4a7";
    // sleeping symbol
    if (":u1f4a4:" == name || ":zzz:" == name) return "1f4a4";
    // dash symbol
    if (":u1f4a8:" == name || ":dash:" == name) return "1f4a8";
    // ear
    if (":u1f442:" == name || ":ear:" == name) return "1f442";
    // eyes
    if (":u1f440:" == name || ":eyes:" == name) return "1f440";
    // nose
    if (":u1f443:" == name || ":nose:" == name) return "1f443";
    // tongue
    if (":u1f445:" == name || ":tongue:" == name) return "1f445";
    // mouth
    if (":u1f444:" == name || ":lips:" == name) return "1f444";
    // thumbs up sign
    if (":u1f44d:" == name || ":+1:" == name || ":thumbsup:" == name)
      return "1f44d";
    // thumbs down sign
    if (":u1f44e:" == name || ":-1:" == name || ":thumbsdown:" == name)
      return "1f44e";
    // ok hand sign
    if (":u1f44c:" == name || ":ok_hand:" == name) return "1f44c";
    // fisted hand sign
    if (":u1f44a:" == name || ":facepunch:" == name || ":punch:" == name)
      return "1f44a";
    // raised fist
    if (":u270a:" == name || ":fist:" == name) return "270a";
    // victory hand
    if (":u270c:" == name || ":v:" == name) return "270c";
    // waving hand sign
    if (":u1f44b:" == name || ":wave:" == name) return "1f44b";
    // raised hand
    if (":u270b:" == name || ":hand:" == name || ":raised_hand:" == name)
      return "270b";
    // open hands sign
    if (":u1f450:" == name || ":open_hands:" == name) return "1f450";
    // white up pointing backhand index
    if (":u1f446:" == name || ":point_up_2:" == name) return "1f446";
    // white down pointing backhand index
    if (":u1f447:" == name || ":point_down:" == name) return "1f447";
    // white right pointing backhand index
    if (":u1f449:" == name || ":point_right:" == name) return "1f449";
    // white left pointing backhand index
    if (":u1f448:" == name || ":point_left:" == name) return "1f448";
    // person raising both hands in celebration
    if (":u1f64c:" == name || ":raised_hands:" == name) return "1f64c";
    // person with folded hands
    if (":u1f64f:" == name || ":pray:" == name) return "1f64f";
    // white up pointing index
    if (":u261d:" == name || ":point_up:" == name) return "261d";
    // clapping hands sign
    if (":u1f44f:" == name || ":clap:" == name) return "1f44f";
    // flexed biceps
    if (":u1f4aa:" == name || ":muscle:" == name) return "1f4aa";
    // pedestrian
    if (":u1f6b6:" == name || ":walking:" == name) return "1f6b6";
    // runner
    if (":u1f3c3:" == name || ":runner:" == name || ":running:" == name)
      return "1f3c3";
    // dancer
    if (":u1f483:" == name || ":dancer:" == name) return "1f483";
    // man and woman holding hands
    if (":u1f46b:" == name || ":couple:" == name) return "1f46b";
    // family
    if (":u1f46a:" == name || ":family:" == name) return "1f46a";
    // two men holding hands
    if (":u1f46c:" == name || ":two_men_holding_hands:" == name) return "1f46c";
    // two women holding hands
    if (":u1f46d:" == name || ":two_women_holding_hands:" == name)
      return "1f46d";
    // kiss
    if (":u1f48f:" == name || ":couplekiss:" == name) return "1f48f";
    // couple with heart
    if (":u1f491:" == name || ":couple_with_heart:" == name) return "1f491";
    // woman with bunny ears
    if (":u1f46f:" == name || ":dancers:" == name) return "1f46f";
    // face with ok gesture
    if (":u1f646:" == name || ":ok_woman:" == name) return "1f646";
    // face with no good gesture
    if (":u1f645:" == name || ":no_good:" == name) return "1f645";
    // information desk person
    if (":u1f481:" == name || ":information_desk_person:" == name)
      return "1f481";
    // happy person raising one hand
    if (":u1f64b:" == name || ":raising_hand:" == name) return "1f64b";
    // face massage
    if (":u1f486:" == name || ":massage:" == name) return "1f486";
    // haircut
    if (":u1f487:" == name || ":haircut:" == name) return "1f487";
    // nail polish
    if (":u1f485:" == name || ":nail_care:" == name) return "1f485";
    // bride with veil
    if (":u1f470:" == name || ":bride_with_veil:" == name) return "1f470";
    // person with pouting face
    if (":u1f64e:" == name || ":person_with_pouting_face:" == name)
      return "1f64e";
    // person frowning
    if (":u1f64d:" == name || ":person_frowning:" == name) return "1f64d";
    // person bowing deeply
    if (":u1f647:" == name || ":bow:" == name) return "1f647";
    // top hat
    if (":u1f3a9:" == name || ":tophat:" == name) return "1f3a9";
    // crown
    if (":u1f451:" == name || ":crown:" == name) return "1f451";
    // womans hat
    if (":u1f452:" == name || ":womans_hat:" == name) return "1f452";
    // athletic shoe
    if (":u1f45f:" == name || ":athletic_shoe:" == name) return "1f45f";
    // mans shoe
    if (":u1f45e:" == name || ":mans_shoe:" == name || ":shoe:" == name)
      return "1f45e";
    // womans sandal
    if (":u1f461:" == name || ":sandal:" == name) return "1f461";
    // high-heeled shoe
    if (":u1f460:" == name || ":high_heel:" == name) return "1f460";
    // womans boots
    if (":u1f462:" == name || ":boot:" == name) return "1f462";
    // t-shirt
    if (":u1f455:" == name || ":shirt:" == name || ":tshirt:" == name)
      return "1f455";
    // necktie
    if (":u1f454:" == name || ":necktie:" == name) return "1f454";
    // womans clothes
    if (":u1f45a:" == name || ":womans_clothes:" == name) return "1f45a";
    // dress
    if (":u1f457:" == name || ":dress:" == name) return "1f457";
    // running shirt with sash
    if (":u1f3bd:" == name || ":running_shirt_with_sash:" == name)
      return "1f3bd";
    // jeans
    if (":u1f456:" == name || ":jeans:" == name) return "1f456";
    // kimono
    if (":u1f458:" == name || ":kimono:" == name) return "1f458";
    // bikini
    if (":u1f459:" == name || ":bikini:" == name) return "1f459";
    // briefcase
    if (":u1f4bc:" == name || ":briefcase:" == name) return "1f4bc";
    // handbag
    if (":u1f45c:" == name || ":handbag:" == name) return "1f45c";
    // pouch
    if (":u1f45d:" == name || ":pouch:" == name) return "1f45d";
    // purse
    if (":u1f45b:" == name || ":purse:" == name) return "1f45b";
    // eyeglasses
    if (":u1f453:" == name || ":eyeglasses:" == name) return "1f453";
    // ribbon
    if (":u1f380:" == name || ":ribbon:" == name) return "1f380";
    // closed umbrella
    if (":u1f302:" == name || ":closed_umbrella:" == name) return "1f302";
    // lipstick
    if (":u1f484:" == name || ":lipstick:" == name) return "1f484";
    // yellow heart
    if (":u1f49b:" == name || ":yellow_heart:" == name) return "1f49b";
    // blue heart
    if (":u1f499:" == name || ":blue_heart:" == name) return "1f499";
    // purple heart
    if (":u1f49c:" == name || ":purple_heart:" == name) return "1f49c";
    // green heart
    if (":u1f49a:" == name || ":green_heart:" == name) return "1f49a";
    // heavy black heart
    if (":u2764:" == name || ":heart:" == name) return "2764";
    // broken heart
    if (":u1f494:" == name || ":broken_heart:" == name) return "1f494";
    // growing heart
    if (":u1f497:" == name || ":heartpulse:" == name) return "1f497";
    // beating heart
    if (":u1f493:" == name || ":heartbeat:" == name) return "1f493";
    // two hearts
    if (":u1f495:" == name || ":two_hearts:" == name) return "1f495";
    // sparkling heart
    if (":u1f496:" == name || ":sparkling_heart:" == name) return "1f496";
    // revolving hearts
    if (":u1f49e:" == name || ":revolving_hearts:" == name) return "1f49e";
    // heart with arrow
    if (":u1f498:" == name || ":cupid:" == name) return "1f498";
    // love letter
    if (":u1f48c:" == name || ":love_letter:" == name) return "1f48c";
    // kiss mark
    if (":u1f48b:" == name || ":kiss:" == name) return "1f48b";
    // ring
    if (":u1f48d:" == name || ":ring:" == name) return "1f48d";
    // gem stone
    if (":u1f48e:" == name || ":gem:" == name) return "1f48e";
    // bust in silhouette
    if (":u1f464:" == name || ":bust_in_silhouette:" == name) return "1f464";
    // busts in silhouette
    if (":u1f465:" == name || ":busts_in_silhouette:" == name) return "1f465";
    // speech balloon
    if (":u1f4ac:" == name || ":speech_balloon:" == name) return "1f4ac";
    // footprints
    if (":u1f463:" == name || ":footprints:" == name) return "1f463";
    // thought balloon
    if (":u1f4ad:" == name || ":thought_balloon:" == name) return "1f4ad";
    // dog face
    if (":u1f436:" == name || ":dog:" == name) return "1f436";
    // wolf face
    if (":u1f43a:" == name || ":wolf:" == name) return "1f43a";
    // cat face
    if (":u1f431:" == name || ":cat:" == name) return "1f431";
    // mouse face
    if (":u1f42d:" == name || ":mouse:" == name) return "1f42d";
    // hamster face
    if (":u1f439:" == name || ":hamster:" == name) return "1f439";
    // rabbit face
    if (":u1f430:" == name || ":rabbit:" == name) return "1f430";
    // frog face
    if (":u1f438:" == name || ":frog:" == name) return "1f438";
    // tiger face
    if (":u1f42f:" == name || ":tiger:" == name) return "1f42f";
    // koala
    if (":u1f428:" == name || ":koala:" == name) return "1f428";
    // bear face
    if (":u1f43b:" == name || ":bear:" == name) return "1f43b";
    // pig face
    if (":u1f437:" == name || ":pig:" == name) return "1f437";
    // pig nose
    if (":u1f43d:" == name || ":pig_nose:" == name) return "1f43d";
    // cow face
    if (":u1f42e:" == name || ":cow:" == name) return "1f42e";
    // boar
    if (":u1f417:" == name || ":boar:" == name) return "1f417";
    // monkey face
    if (":u1f435:" == name || ":monkey_face:" == name) return "1f435";
    // monkey
    if (":u1f412:" == name || ":monkey:" == name) return "1f412";
    // horse face
    if (":u1f434:" == name || ":horse:" == name) return "1f434";
    // sheep
    if (":u1f411:" == name || ":sheep:" == name) return "1f411";
    // elephant
    if (":u1f418:" == name || ":elephant:" == name) return "1f418";
    // panda face
    if (":u1f43c:" == name || ":panda_face:" == name) return "1f43c";
    // penguin
    if (":u1f427:" == name || ":penguin:" == name) return "1f427";
    // bird
    if (":u1f426:" == name || ":bird:" == name) return "1f426";
    // baby chick
    if (":u1f424:" == name || ":baby_chick:" == name) return "1f424";
    // front-facing baby chick
    if (":u1f425:" == name || ":hatched_chick:" == name) return "1f425";
    // hatching chick
    if (":u1f423:" == name || ":hatching_chick:" == name) return "1f423";
    // chicken
    if (":u1f414:" == name || ":chicken:" == name) return "1f414";
    // snake
    if (":u1f40d:" == name || ":snake:" == name) return "1f40d";
    // turtle
    if (":u1f422:" == name || ":turtle:" == name) return "1f422";
    // bug
    if (":u1f41b:" == name || ":bug:" == name) return "1f41b";
    // honeybee
    if (":u1f41d:" == name || ":bee:" == name || ":honeybee:" == name)
      return "1f41d";
    // ant
    if (":u1f41c:" == name || ":ant:" == name) return "1f41c";
    // lady beetle
    if (":u1f41e:" == name || ":beetle:" == name) return "1f41e";
    // snail
    if (":u1f40c:" == name || ":snail:" == name) return "1f40c";
    // octopus
    if (":u1f419:" == name || ":octopus:" == name) return "1f419";
    // spiral shell
    if (":u1f41a:" == name || ":shell:" == name) return "1f41a";
    // tropical fish
    if (":u1f420:" == name || ":tropical_fish:" == name) return "1f420";
    // fish
    if (":u1f41f:" == name || ":fish:" == name) return "1f41f";
    // dolphin
    if (":u1f42c:" == name || ":dolphin:" == name || ":flipper:" == name)
      return "1f42c";
    // spouting whale
    if (":u1f433:" == name || ":whale:" == name) return "1f433";
    // whale
    if (":u1f40b:" == name || ":whale2:" == name) return "1f40b";
    // cow
    if (":u1f404:" == name || ":cow2:" == name) return "1f404";
    // ram
    if (":u1f40f:" == name || ":ram:" == name) return "1f40f";
    // rat
    if (":u1f400:" == name || ":rat:" == name) return "1f400";
    // water buffalo
    if (":u1f403:" == name || ":water_buffalo:" == name) return "1f403";
    // tiger
    if (":u1f405:" == name || ":tiger2:" == name) return "1f405";
    // rabbit
    if (":u1f407:" == name || ":rabbit2:" == name) return "1f407";
    // dragon
    if (":u1f409:" == name || ":dragon:" == name) return "1f409";
    // horse
    if (":u1f40e:" == name || ":racehorse:" == name) return "1f40e";
    // goat
    if (":u1f410:" == name || ":goat:" == name) return "1f410";
    // rooster
    if (":u1f413:" == name || ":rooster:" == name) return "1f413";
    // dog
    if (":u1f415:" == name || ":dog2:" == name) return "1f415";
    // pig
    if (":u1f416:" == name || ":pig2:" == name) return "1f416";
    // mouse
    if (":u1f401:" == name || ":mouse2:" == name) return "1f401";
    // ox
    if (":u1f402:" == name || ":ox:" == name) return "1f402";
    // dragon face
    if (":u1f432:" == name || ":dragon_face:" == name) return "1f432";
    // blowfish
    if (":u1f421:" == name || ":blowfish:" == name) return "1f421";
    // crocodile
    if (":u1f40a:" == name || ":crocodile:" == name) return "1f40a";
    // bactrian camel
    if (":u1f42b:" == name || ":camel:" == name) return "1f42b";
    // dromedary camel
    if (":u1f42a:" == name || ":dromedary_camel:" == name) return "1f42a";
    // leopard
    if (":u1f406:" == name || ":leopard:" == name) return "1f406";
    // cat
    if (":u1f408:" == name || ":cat2:" == name) return "1f408";
    // poodle
    if (":u1f429:" == name || ":poodle:" == name) return "1f429";
    // paw prints
    if (":u1f43e:" == name || ":feet:" == name || ":paw_prints:" == name)
      return "1f43e";
    // bouquet
    if (":u1f490:" == name || ":bouquet:" == name) return "1f490";
    // cherry blossom
    if (":u1f338:" == name || ":cherry_blossom:" == name) return "1f338";
    // tulip
    if (":u1f337:" == name || ":tulip:" == name) return "1f337";
    // four leaf clover
    if (":u1f340:" == name || ":four_leaf_clover:" == name) return "1f340";
    // rose
    if (":u1f339:" == name || ":rose:" == name) return "1f339";
    // sunflower
    if (":u1f33b:" == name || ":sunflower:" == name) return "1f33b";
    // hibiscus
    if (":u1f33a:" == name || ":hibiscus:" == name) return "1f33a";
    // maple leaf
    if (":u1f341:" == name || ":maple_leaf:" == name) return "1f341";
    // leaf fluttering in wind
    if (":u1f343:" == name || ":leaves:" == name) return "1f343";
    // fallen leaf
    if (":u1f342:" == name || ":fallen_leaf:" == name) return "1f342";
    // herb
    if (":u1f33f:" == name || ":herb:" == name) return "1f33f";
    // ear of rice
    if (":u1f33e:" == name || ":ear_of_rice:" == name) return "1f33e";
    // mushroom
    if (":u1f344:" == name || ":mushroom:" == name) return "1f344";
    // cactus
    if (":u1f335:" == name || ":cactus:" == name) return "1f335";
    // palm tree
    if (":u1f334:" == name || ":palm_tree:" == name) return "1f334";
    // evergreen tree
    if (":u1f332:" == name || ":evergreen_tree:" == name) return "1f332";
    // deciduous tree
    if (":u1f333:" == name || ":deciduous_tree:" == name) return "1f333";
    // chestnut
    if (":u1f330:" == name || ":chestnut:" == name) return "1f330";
    // seedling
    if (":u1f331:" == name || ":seedling:" == name) return "1f331";
    // blossom
    if (":u1f33c:" == name || ":blossom:" == name) return "1f33c";
    // globe with meridians
    if (":u1f310:" == name || ":globe_with_meridians:" == name) return "1f310";
    // sun with face
    if (":u1f31e:" == name || ":sun_with_face:" == name) return "1f31e";
    // full moon with face
    if (":u1f31d:" == name || ":full_moon_with_face:" == name) return "1f31d";
    // new moon with face
    if (":u1f31a:" == name || ":new_moon_with_face:" == name) return "1f31a";
    // new moon symbol
    if (":u1f311:" == name || ":new_moon:" == name) return "1f311";
    // waxing crescent moon symbol
    if (":u1f312:" == name || ":waxing_crescent_moon:" == name) return "1f312";
    // first quarter moon symbol
    if (":u1f313:" == name || ":first_quarter_moon:" == name) return "1f313";
    // waxing gibbous moon symbol
    if (":u1f314:" == name ||
        ":moon:" == name ||
        ":waxing_gibbous_moon:" == name) return "1f314";
    // full moon symbol
    if (":u1f315:" == name || ":full_moon:" == name) return "1f315";
    // waning gibbous moon symbol
    if (":u1f316:" == name || ":waning_gibbous_moon:" == name) return "1f316";
    // last quarter moon symbol
    if (":u1f317:" == name || ":last_quarter_moon:" == name) return "1f317";
    // waning crescent moon symbol
    if (":u1f318:" == name || ":waning_crescent_moon:" == name) return "1f318";
    // last quarter moon with face
    if (":u1f31c:" == name || ":last_quarter_moon_with_face:" == name)
      return "1f31c";
    // first quarter moon with face
    if (":u1f31b:" == name || ":first_quarter_moon_with_face:" == name)
      return "1f31b";
    // crescent moon
    if (":u1f319:" == name || ":crescent_moon:" == name) return "1f319";
    // earth globe europe-africa
    if (":u1f30d:" == name || ":earth_africa:" == name) return "1f30d";
    // earth globe americas
    if (":u1f30e:" == name || ":earth_americas:" == name) return "1f30e";
    // earth globe asia-australia
    if (":u1f30f:" == name || ":earth_asia:" == name) return "1f30f";
    // volcano
    if (":u1f30b:" == name || ":volcano:" == name) return "1f30b";
    // milky way
    if (":u1f30c:" == name || ":milky_way:" == name) return "1f30c";
    // shooting star
    if (":u1f320:" == name || ":stars:" == name) return "1f320";
    // white medium star
    if (":u2b50:" == name || ":star:" == name) return "2b50";
    // black sun with rays
    if (":u2600:" == name || ":sunny:" == name) return "2600";
    // sun behind cloud
    if (":u26c5:" == name || ":partly_sunny:" == name) return "26c5";
    // cloud
    if (":u2601:" == name || ":cloud:" == name) return "2601";
    // high voltage sign
    if (":u26a1:" == name || ":zap:" == name) return "26a1";
    // umbrella with rain drops
    if (":u2614:" == name || ":umbrella:" == name) return "2614";
    // snowflake
    if (":u2744:" == name || ":snowflake:" == name) return "2744";
    // snowman without snow
    if (":u26c4:" == name || ":snowman:" == name) return "26c4";
    // cyclone
    if (":u1f300:" == name || ":cyclone:" == name) return "1f300";
    // foggy
    if (":u1f301:" == name || ":foggy:" == name) return "1f301";
    // rainbow
    if (":u1f308:" == name || ":rainbow:" == name) return "1f308";
    // water wave
    if (":u1f30a:" == name || ":ocean:" == name) return "1f30a";
    // pine decoration
    if (":u1f38d:" == name || ":bamboo:" == name) return "1f38d";
    // heart with ribbon
    if (":u1f49d:" == name || ":gift_heart:" == name) return "1f49d";
    // japanese dolls
    if (":u1f38e:" == name || ":dolls:" == name) return "1f38e";
    // school satchel
    if (":u1f392:" == name || ":school_satchel:" == name) return "1f392";
    // graduation cap
    if (":u1f393:" == name || ":mortar_board:" == name) return "1f393";
    // carp streamer
    if (":u1f38f:" == name || ":flags:" == name) return "1f38f";
    // fireworks
    if (":u1f386:" == name || ":fireworks:" == name) return "1f386";
    // firework sparkler
    if (":u1f387:" == name || ":sparkler:" == name) return "1f387";
    // wind chime
    if (":u1f390:" == name || ":wind_chime:" == name) return "1f390";
    // moon viewing ceremony
    if (":u1f391:" == name || ":rice_scene:" == name) return "1f391";
    // jack-o-lantern
    if (":u1f383:" == name || ":jack_o_lantern:" == name) return "1f383";
    // ghost
    if (":u1f47b:" == name || ":ghost:" == name) return "1f47b";
    // father christmas
    if (":u1f385:" == name || ":santa:" == name) return "1f385";
    // christmas tree
    if (":u1f384:" == name || ":christmas_tree:" == name) return "1f384";
    // wrapped present
    if (":u1f381:" == name || ":gift:" == name) return "1f381";
    // tanabata tree
    if (":u1f38b:" == name || ":tanabata_tree:" == name) return "1f38b";
    // party popper
    if (":u1f389:" == name || ":tada:" == name) return "1f389";
    // confetti ball
    if (":u1f38a:" == name || ":confetti_ball:" == name) return "1f38a";
    // balloon
    if (":u1f388:" == name || ":balloon:" == name) return "1f388";
    // crossed flags
    if (":u1f38c:" == name || ":crossed_flags:" == name) return "1f38c";
    // crystal ball
    if (":u1f52e:" == name || ":crystal_ball:" == name) return "1f52e";
    // movie camera
    if (":u1f3a5:" == name || ":movie_camera:" == name) return "1f3a5";
    // camera
    if (":u1f4f7:" == name || ":camera:" == name) return "1f4f7";
    // video camera
    if (":u1f4f9:" == name || ":video_camera:" == name) return "1f4f9";
    // videocassette
    if (":u1f4fc:" == name || ":vhs:" == name) return "1f4fc";
    // optical disc
    if (":u1f4bf:" == name || ":cd:" == name) return "1f4bf";
    // dvd
    if (":u1f4c0:" == name || ":dvd:" == name) return "1f4c0";
    // minidisc
    if (":u1f4bd:" == name || ":minidisc:" == name) return "1f4bd";
    // floppy disk
    if (":u1f4be:" == name || ":floppy_disk:" == name) return "1f4be";
    // personal computer
    if (":u1f4bb:" == name || ":computer:" == name) return "1f4bb";
    // mobile phone
    if (":u1f4f1:" == name || ":iphone:" == name) return "1f4f1";
    // black telephone
    if (":u260e:" == name || ":phone:" == name || ":telephone:" == name)
      return "260e";
    // telephone receiver
    if (":u1f4de:" == name || ":telephone_receiver:" == name) return "1f4de";
    // pager
    if (":u1f4df:" == name || ":pager:" == name) return "1f4df";
    // fax machine
    if (":u1f4e0:" == name || ":fax:" == name) return "1f4e0";
    // satellite antenna
    if (":u1f4e1:" == name || ":satellite:" == name) return "1f4e1";
    // television
    if (":u1f4fa:" == name || ":tv:" == name) return "1f4fa";
    // radio
    if (":u1f4fb:" == name || ":radio:" == name) return "1f4fb";
    // speaker with three sound waves
    if (":u1f50a:" == name || ":loud_sound:" == name) return "1f50a";
    // speaker with one sound wave
    if (":u1f509:" == name || ":sound:" == name) return "1f509";
    // speaker
    if (":u1f508:" == name || ":speaker:" == name) return "1f508";
    // speaker with cancellation stroke
    if (":u1f507:" == name || ":mute:" == name) return "1f507";
    // bell
    if (":u1f514:" == name || ":bell:" == name) return "1f514";
    // bell with cancellation stroke
    if (":u1f515:" == name || ":no_bell:" == name) return "1f515";
    // public address loudspeaker
    if (":u1f4e2:" == name || ":loudspeaker:" == name) return "1f4e2";
    // cheering megaphone
    if (":u1f4e3:" == name || ":mega:" == name) return "1f4e3";
    // hourglass with flowing sand
    if (":u23f3:" == name || ":hourglass_flowing_sand:" == name) return "23f3";
    // hourglass
    if (":u231b:" == name || ":hourglass:" == name) return "231b";
    // alarm clock
    if (":u23f0:" == name || ":alarm_clock:" == name) return "23f0";
    // watch
    if (":u231a:" == name || ":watch:" == name) return "231a";
    // open lock
    if (":u1f513:" == name || ":unlock:" == name) return "1f513";
    // lock
    if (":u1f512:" == name || ":lock:" == name) return "1f512";
    // lock with ink pen
    if (":u1f50f:" == name || ":lock_with_ink_pen:" == name) return "1f50f";
    // closed lock with key
    if (":u1f510:" == name || ":closed_lock_with_key:" == name) return "1f510";
    // key
    if (":u1f511:" == name || ":key:" == name) return "1f511";
    // right-pointing magnifying glass
    if (":u1f50e:" == name || ":mag_right:" == name) return "1f50e";
    // electric light bulb
    if (":u1f4a1:" == name || ":bulb:" == name) return "1f4a1";
    // electric torch
    if (":u1f526:" == name || ":flashlight:" == name) return "1f526";
    // high brightness symbol
    if (":u1f506:" == name || ":high_brightness:" == name) return "1f506";
    // low brightness symbol
    if (":u1f505:" == name || ":low_brightness:" == name) return "1f505";
    // electric plug
    if (":u1f50c:" == name || ":electric_plug:" == name) return "1f50c";
    // battery
    if (":u1f50b:" == name || ":battery:" == name) return "1f50b";
    // left-pointing magnifying glass
    if (":u1f50d:" == name || ":mag:" == name) return "1f50d";
    // bathtub
    if (":u1f6c1:" == name || ":bathtub:" == name) return "1f6c1";
    // bath
    if (":u1f6c0:" == name || ":bath:" == name) return "1f6c0";
    // shower
    if (":u1f6bf:" == name || ":shower:" == name) return "1f6bf";
    // toilet
    if (":u1f6bd:" == name || ":toilet:" == name) return "1f6bd";
    // wrench
    if (":u1f527:" == name || ":wrench:" == name) return "1f527";
    // nut and bolt
    if (":u1f529:" == name || ":nut_and_bolt:" == name) return "1f529";
    // hammer
    if (":u1f528:" == name || ":hammer:" == name) return "1f528";
    // door
    if (":u1f6aa:" == name || ":door:" == name) return "1f6aa";
    // smoking symbol
    if (":u1f6ac:" == name || ":smoking:" == name) return "1f6ac";
    // bomb
    if (":u1f4a3:" == name || ":bomb:" == name) return "1f4a3";
    // pistol
    if (":u1f52b:" == name || ":gun:" == name) return "1f52b";
    // hocho
    if (":u1f52a:" == name || ":hocho:" == name || ":knife:" == name)
      return "1f52a";
    // pill
    if (":u1f48a:" == name || ":pill:" == name) return "1f48a";
    // syringe
    if (":u1f489:" == name || ":syringe:" == name) return "1f489";
    // money bag
    if (":u1f4b0:" == name || ":moneybag:" == name) return "1f4b0";
    // banknote with yen sign
    if (":u1f4b4:" == name || ":yen:" == name) return "1f4b4";
    // banknote with dollar sign
    if (":u1f4b5:" == name || ":dollar:" == name) return "1f4b5";
    // banknote with pound sign
    if (":u1f4b7:" == name || ":pound:" == name) return "1f4b7";
    // banknote with euro sign
    if (":u1f4b6:" == name || ":euro:" == name) return "1f4b6";
    // credit card
    if (":u1f4b3:" == name || ":credit_card:" == name) return "1f4b3";
    // money with wings
    if (":u1f4b8:" == name || ":money_with_wings:" == name) return "1f4b8";
    // mobile phone with rightwards arrow at left
    if (":u1f4f2:" == name || ":calling:" == name) return "1f4f2";
    // e-mail symbol
    if (":u1f4e7:" == name || ":e-mail:" == name) return "1f4e7";
    // inbox tray
    if (":u1f4e5:" == name || ":inbox_tray:" == name) return "1f4e5";
    // outbox tray
    if (":u1f4e4:" == name || ":outbox_tray:" == name) return "1f4e4";
    // envelope
    if (":u2709:" == name || ":email:" == name || ":envelope:" == name)
      return "2709";
    // envelope with downwards arrow above
    if (":u1f4e9:" == name || ":envelope_with_arrow:" == name) return "1f4e9";
    // incoming envelope
    if (":u1f4e8:" == name || ":incoming_envelope:" == name) return "1f4e8";
    // postal horn
    if (":u1f4ef:" == name || ":postal_horn:" == name) return "1f4ef";
    // closed mailbox with raised flag
    if (":u1f4eb:" == name || ":mailbox:" == name) return "1f4eb";
    // closed mailbox with lowered flag
    if (":u1f4ea:" == name || ":mailbox_closed:" == name) return "1f4ea";
    // open mailbox with raised flag
    if (":u1f4ec:" == name || ":mailbox_with_mail:" == name) return "1f4ec";
    // open mailbox with lowered flag
    if (":u1f4ed:" == name || ":mailbox_with_no_mail:" == name) return "1f4ed";
    // postbox
    if (":u1f4ee:" == name || ":postbox:" == name) return "1f4ee";
    // package
    if (":u1f4e6:" == name || ":package:" == name) return "1f4e6";
    // memo
    if (":u1f4dd:" == name || ":memo:" == name || ":pencil:" == name)
      return "1f4dd";
    // page facing up
    if (":u1f4c4:" == name || ":page_facing_up:" == name) return "1f4c4";
    // page with curl
    if (":u1f4c3:" == name || ":page_with_curl:" == name) return "1f4c3";
    // bookmark tabs
    if (":u1f4d1:" == name || ":bookmark_tabs:" == name) return "1f4d1";
    // bar chart
    if (":u1f4ca:" == name || ":bar_chart:" == name) return "1f4ca";
    // chart with upwards trend
    if (":u1f4c8:" == name || ":chart_with_upwards_trend:" == name)
      return "1f4c8";
    // chart with downwards trend
    if (":u1f4c9:" == name || ":chart_with_downwards_trend:" == name)
      return "1f4c9";
    // scroll
    if (":u1f4dc:" == name || ":scroll:" == name) return "1f4dc";
    // clipboard
    if (":u1f4cb:" == name || ":clipboard:" == name) return "1f4cb";
    // calendar
    if (":u1f4c5:" == name || ":date:" == name) return "1f4c5";
    // tear-off calendar
    if (":u1f4c6:" == name || ":calendar:" == name) return "1f4c6";
    // card index
    if (":u1f4c7:" == name || ":card_index:" == name) return "1f4c7";
    // file folder
    if (":u1f4c1:" == name || ":file_folder:" == name) return "1f4c1";
    // open file folder
    if (":u1f4c2:" == name || ":open_file_folder:" == name) return "1f4c2";
    // black scissors
    if (":u2702:" == name || ":scissors:" == name) return "2702";
    // pushpin
    if (":u1f4cc:" == name || ":pushpin:" == name) return "1f4cc";
    // paperclip
    if (":u1f4ce:" == name || ":paperclip:" == name) return "1f4ce";
    // black nib
    if (":u2712:" == name || ":black_nib:" == name) return "2712";
    // pencil
    if (":u270f:" == name || ":pencil2:" == name) return "270f";
    // straight ruler
    if (":u1f4cf:" == name || ":straight_ruler:" == name) return "1f4cf";
    // triangular ruler
    if (":u1f4d0:" == name || ":triangular_ruler:" == name) return "1f4d0";
    // closed book
    if (":u1f4d5:" == name || ":closed_book:" == name) return "1f4d5";
    // green book
    if (":u1f4d7:" == name || ":green_book:" == name) return "1f4d7";
    // blue book
    if (":u1f4d8:" == name || ":blue_book:" == name) return "1f4d8";
    // orange book
    if (":u1f4d9:" == name || ":orange_book:" == name) return "1f4d9";
    // notebook
    if (":u1f4d3:" == name || ":notebook:" == name) return "1f4d3";
    // notebook with decorative cover
    if (":u1f4d4:" == name || ":notebook_with_decorative_cover:" == name)
      return "1f4d4";
    // ledger
    if (":u1f4d2:" == name || ":ledger:" == name) return "1f4d2";
    // books
    if (":u1f4da:" == name || ":books:" == name) return "1f4da";
    // open book
    if (":u1f4d6:" == name || ":book:" == name || ":open_book:" == name)
      return "1f4d6";
    // bookmark
    if (":u1f516:" == name || ":bookmark:" == name) return "1f516";
    // name badge
    if (":u1f4db:" == name || ":name_badge:" == name) return "1f4db";
    // microscope
    if (":u1f52c:" == name || ":microscope:" == name) return "1f52c";
    // telescope
    if (":u1f52d:" == name || ":telescope:" == name) return "1f52d";
    // newspaper
    if (":u1f4f0:" == name || ":newspaper:" == name) return "1f4f0";
    // artist palette
    if (":u1f3a8:" == name || ":art:" == name) return "1f3a8";
    // clapper board
    if (":u1f3ac:" == name || ":clapper:" == name) return "1f3ac";
    // microphone
    if (":u1f3a4:" == name || ":microphone:" == name) return "1f3a4";
    // headphone
    if (":u1f3a7:" == name || ":headphones:" == name) return "1f3a7";
    // musical score
    if (":u1f3bc:" == name || ":musical_score:" == name) return "1f3bc";
    // musical note
    if (":u1f3b5:" == name || ":musical_note:" == name) return "1f3b5";
    // multiple musical notes
    if (":u1f3b6:" == name || ":notes:" == name) return "1f3b6";
    // musical keyboard
    if (":u1f3b9:" == name || ":musical_keyboard:" == name) return "1f3b9";
    // violin
    if (":u1f3bb:" == name || ":violin:" == name) return "1f3bb";
    // trumpet
    if (":u1f3ba:" == name || ":trumpet:" == name) return "1f3ba";
    // saxophone
    if (":u1f3b7:" == name || ":saxophone:" == name) return "1f3b7";
    // guitar
    if (":u1f3b8:" == name || ":guitar:" == name) return "1f3b8";
    // alien monster
    if (":u1f47e:" == name || ":space_invader:" == name) return "1f47e";
    // video game
    if (":u1f3ae:" == name || ":video_game:" == name) return "1f3ae";
    // playing card black joker
    if (":u1f0cf:" == name || ":black_joker:" == name) return "1f0cf";
    // flower playing cards
    if (":u1f3b4:" == name || ":flower_playing_cards:" == name) return "1f3b4";
    // mahjong tile red dragon
    if (":u1f004:" == name || ":mahjong:" == name) return "1f004";
    // game die
    if (":u1f3b2:" == name || ":game_die:" == name) return "1f3b2";
    // direct hit
    if (":u1f3af:" == name || ":dart:" == name) return "1f3af";
    // american football
    if (":u1f3c8:" == name || ":football:" == name) return "1f3c8";
    // basketball and hoop
    if (":u1f3c0:" == name || ":basketball:" == name) return "1f3c0";
    // soccer ball
    if (":u26bd:" == name || ":soccer:" == name) return "26bd";
    // baseball
    if (":u26be:" == name || ":baseball:" == name) return "26be";
    // tennis racquet and ball
    if (":u1f3be:" == name || ":tennis:" == name) return "1f3be";
    // billiards
    if (":u1f3b1:" == name || ":8ball:" == name) return "1f3b1";
    // rugby football
    if (":u1f3c9:" == name || ":rugby_football:" == name) return "1f3c9";
    // bowling
    if (":u1f3b3:" == name || ":bowling:" == name) return "1f3b3";
    // flag in hole
    if (":u26f3:" == name || ":golf:" == name) return "26f3";
    // mountain bicyclist
    if (":u1f6b5:" == name || ":mountain_bicyclist:" == name) return "1f6b5";
    // bicyclist
    if (":u1f6b4:" == name || ":bicyclist:" == name) return "1f6b4";
    // chequered flag
    if (":u1f3c1:" == name || ":checkered_flag:" == name) return "1f3c1";
    // horse racing
    if (":u1f3c7:" == name || ":horse_racing:" == name) return "1f3c7";
    // trophy
    if (":u1f3c6:" == name || ":trophy:" == name) return "1f3c6";
    // ski and ski boot
    if (":u1f3bf:" == name || ":ski:" == name) return "1f3bf";
    // snowboarder
    if (":u1f3c2:" == name || ":snowboarder:" == name) return "1f3c2";
    // swimmer
    if (":u1f3ca:" == name || ":swimmer:" == name) return "1f3ca";
    // surfer
    if (":u1f3c4:" == name || ":surfer:" == name) return "1f3c4";
    // fishing pole and fish
    if (":u1f3a3:" == name || ":fishing_pole_and_fish:" == name) return "1f3a3";
    // hot beverage
    if (":u2615:" == name || ":coffee:" == name) return "2615";
    // teacup without handle
    if (":u1f375:" == name || ":tea:" == name) return "1f375";
    // sake bottle and cup
    if (":u1f376:" == name || ":sake:" == name) return "1f376";
    // baby bottle
    if (":u1f37c:" == name || ":baby_bottle:" == name) return "1f37c";
    // beer mug
    if (":u1f37a:" == name || ":beer:" == name) return "1f37a";
    // clinking beer mugs
    if (":u1f37b:" == name || ":beers:" == name) return "1f37b";
    // cocktail glass
    if (":u1f378:" == name || ":cocktail:" == name) return "1f378";
    // tropical drink
    if (":u1f379:" == name || ":tropical_drink:" == name) return "1f379";
    // wine glass
    if (":u1f377:" == name || ":wine_glass:" == name) return "1f377";
    // fork and knife
    if (":u1f374:" == name || ":fork_and_knife:" == name) return "1f374";
    // slice of pizza
    if (":u1f355:" == name || ":pizza:" == name) return "1f355";
    // hamburger
    if (":u1f354:" == name || ":hamburger:" == name) return "1f354";
    // french fries
    if (":u1f35f:" == name || ":fries:" == name) return "1f35f";
    // poultry leg
    if (":u1f357:" == name || ":poultry_leg:" == name) return "1f357";
    // meat on bone
    if (":u1f356:" == name || ":meat_on_bone:" == name) return "1f356";
    // spaghetti
    if (":u1f35d:" == name || ":spaghetti:" == name) return "1f35d";
    // curry and rice
    if (":u1f35b:" == name || ":curry:" == name) return "1f35b";
    // fried shrimp
    if (":u1f364:" == name || ":fried_shrimp:" == name) return "1f364";
    // bento box
    if (":u1f371:" == name || ":bento:" == name) return "1f371";
    // sushi
    if (":u1f363:" == name || ":sushi:" == name) return "1f363";
    // fish cake with swirl design
    if (":u1f365:" == name || ":fish_cake:" == name) return "1f365";
    // rice ball
    if (":u1f359:" == name || ":rice_ball:" == name) return "1f359";
    // rice cracker
    if (":u1f358:" == name || ":rice_cracker:" == name) return "1f358";
    // cooked rice
    if (":u1f35a:" == name || ":rice:" == name) return "1f35a";
    // steaming bowl
    if (":u1f35c:" == name || ":ramen:" == name) return "1f35c";
    // pot of food
    if (":u1f372:" == name || ":stew:" == name) return "1f372";
    // oden
    if (":u1f362:" == name || ":oden:" == name) return "1f362";
    // dango
    if (":u1f361:" == name || ":dango:" == name) return "1f361";
    // cooking
    if (":u1f373:" == name || ":egg:" == name) return "1f373";
    // bread
    if (":u1f35e:" == name || ":bread:" == name) return "1f35e";
    // doughnut
    if (":u1f369:" == name || ":doughnut:" == name) return "1f369";
    // custard
    if (":u1f36e:" == name || ":custard:" == name) return "1f36e";
    // soft ice cream
    if (":u1f366:" == name || ":icecream:" == name) return "1f366";
    // ice cream
    if (":u1f368:" == name || ":ice_cream:" == name) return "1f368";
    // shaved ice
    if (":u1f367:" == name || ":shaved_ice:" == name) return "1f367";
    // birthday cake
    if (":u1f382:" == name || ":birthday:" == name) return "1f382";
    // shortcake
    if (":u1f370:" == name || ":cake:" == name) return "1f370";
    // cookie
    if (":u1f36a:" == name || ":cookie:" == name) return "1f36a";
    // chocolate bar
    if (":u1f36b:" == name || ":chocolate_bar:" == name) return "1f36b";
    // candy
    if (":u1f36c:" == name || ":candy:" == name) return "1f36c";
    // lollipop
    if (":u1f36d:" == name || ":lollipop:" == name) return "1f36d";
    // honey pot
    if (":u1f36f:" == name || ":honey_pot:" == name) return "1f36f";
    // red apple
    if (":u1f34e:" == name || ":apple:" == name) return "1f34e";
    // green apple
    if (":u1f34f:" == name || ":green_apple:" == name) return "1f34f";
    // tangerine
    if (":u1f34a:" == name || ":tangerine:" == name) return "1f34a";
    // lemon
    if (":u1f34b:" == name || ":lemon:" == name) return "1f34b";
    // cherries
    if (":u1f352:" == name || ":cherries:" == name) return "1f352";
    // grapes
    if (":u1f347:" == name || ":grapes:" == name) return "1f347";
    // watermelon
    if (":u1f349:" == name || ":watermelon:" == name) return "1f349";
    // strawberry
    if (":u1f353:" == name || ":strawberry:" == name) return "1f353";
    // peach
    if (":u1f351:" == name || ":peach:" == name) return "1f351";
    // melon
    if (":u1f348:" == name || ":melon:" == name) return "1f348";
    // banana
    if (":u1f34c:" == name || ":banana:" == name) return "1f34c";
    // pear
    if (":u1f350:" == name || ":pear:" == name) return "1f350";
    // pineapple
    if (":u1f34d:" == name || ":pineapple:" == name) return "1f34d";
    // roasted sweet potato
    if (":u1f360:" == name || ":sweet_potato:" == name) return "1f360";
    // aubergine
    if (":u1f346:" == name || ":eggplant:" == name) return "1f346";
    // tomato
    if (":u1f345:" == name || ":tomato:" == name) return "1f345";
    // ear of maize
    if (":u1f33d:" == name || ":corn:" == name) return "1f33d";
    // house building
    if (":u1f3e0:" == name || ":house:" == name) return "1f3e0";
    // house with garden
    if (":u1f3e1:" == name || ":house_with_garden:" == name) return "1f3e1";
    // school
    if (":u1f3eb:" == name || ":school:" == name) return "1f3eb";
    // office building
    if (":u1f3e2:" == name || ":office:" == name) return "1f3e2";
    // japanese post office
    if (":u1f3e3:" == name || ":post_office:" == name) return "1f3e3";
    // hospital
    if (":u1f3e5:" == name || ":hospital:" == name) return "1f3e5";
    // bank
    if (":u1f3e6:" == name || ":bank:" == name) return "1f3e6";
    // convenience store
    if (":u1f3ea:" == name || ":convenience_store:" == name) return "1f3ea";
    // love hotel
    if (":u1f3e9:" == name || ":love_hotel:" == name) return "1f3e9";
    // hotel
    if (":u1f3e8:" == name || ":hotel:" == name) return "1f3e8";
    // wedding
    if (":u1f492:" == name || ":wedding:" == name) return "1f492";
    // church
    if (":u26ea:" == name || ":church:" == name) return "26ea";
    // department store
    if (":u1f3ec:" == name || ":department_store:" == name) return "1f3ec";
    // european post office
    if (":u1f3e4:" == name || ":european_post_office:" == name) return "1f3e4";
    // sunset over buildings
    if (":u1f307:" == name || ":city_sunrise:" == name) return "1f307";
    // cityscape at dusk
    if (":u1f306:" == name || ":city_sunset:" == name) return "1f306";
    // japanese castle
    if (":u1f3ef:" == name || ":japanese_castle:" == name) return "1f3ef";
    // european castle
    if (":u1f3f0:" == name || ":european_castle:" == name) return "1f3f0";
    // tent
    if (":u26fa:" == name || ":tent:" == name) return "26fa";
    // factory
    if (":u1f3ed:" == name || ":factory:" == name) return "1f3ed";
    // tokyo tower
    if (":u1f5fc:" == name || ":tokyo_tower:" == name) return "1f5fc";
    // silhouette of japan
    if (":u1f5fe:" == name || ":japan:" == name) return "1f5fe";
    // mount fuji
    if (":u1f5fb:" == name || ":mount_fuji:" == name) return "1f5fb";
    // sunrise over mountains
    if (":u1f304:" == name || ":sunrise_over_mountains:" == name)
      return "1f304";
    // sunrise
    if (":u1f305:" == name || ":sunrise:" == name) return "1f305";
    // night with stars
    if (":u1f303:" == name || ":night_with_stars:" == name) return "1f303";
    // statue of liberty
    if (":u1f5fd:" == name || ":statue_of_liberty:" == name) return "1f5fd";
    // bridge at night
    if (":u1f309:" == name || ":bridge_at_night:" == name) return "1f309";
    // carousel horse
    if (":u1f3a0:" == name || ":carousel_horse:" == name) return "1f3a0";
    // ferris wheel
    if (":u1f3a1:" == name || ":ferris_wheel:" == name) return "1f3a1";
    // fountain
    if (":u26f2:" == name || ":fountain:" == name) return "26f2";
    // roller coaster
    if (":u1f3a2:" == name || ":roller_coaster:" == name) return "1f3a2";
    // ship
    if (":u1f6a2:" == name || ":ship:" == name) return "1f6a2";
    // sailboat
    if (":u26f5:" == name || ":boat:" == name || ":sailboat:" == name)
      return "26f5";
    // speedboat
    if (":u1f6a4:" == name || ":speedboat:" == name) return "1f6a4";
    // rowboat
    if (":u1f6a3:" == name || ":rowboat:" == name) return "1f6a3";
    // anchor
    if (":u2693:" == name || ":anchor:" == name) return "2693";
    // rocket
    if (":u1f680:" == name || ":rocket:" == name) return "1f680";
    // airplane
    if (":u2708:" == name || ":airplane:" == name) return "2708";
    // seat
    if (":u1f4ba:" == name || ":seat:" == name) return "1f4ba";
    // helicopter
    if (":u1f681:" == name || ":helicopter:" == name) return "1f681";
    // steam locomotive
    if (":u1f682:" == name || ":steam_locomotive:" == name) return "1f682";
    // tram
    if (":u1f68a:" == name || ":tram:" == name) return "1f68a";
    // station
    if (":u1f689:" == name || ":station:" == name) return "1f689";
    // mountain railway
    if (":u1f69e:" == name || ":mountain_railway:" == name) return "1f69e";
    // train
    if (":u1f686:" == name || ":train2:" == name) return "1f686";
    // high-speed train
    if (":u1f684:" == name || ":bullettrain_side:" == name) return "1f684";
    // high-speed train with bullet nose
    if (":u1f685:" == name || ":bullettrain_front:" == name) return "1f685";
    // light rail
    if (":u1f688:" == name || ":light_rail:" == name) return "1f688";
    // metro
    if (":u1f687:" == name || ":metro:" == name) return "1f687";
    // monorail
    if (":u1f69d:" == name || ":monorail:" == name) return "1f69d";
    // tram car
    if (":u1f68b:" == name || ":train:" == name) return "1f68b";
    // railway car
    if (":u1f683:" == name || ":railway_car:" == name) return "1f683";
    // trolleybus
    if (":u1f68e:" == name || ":trolleybus:" == name) return "1f68e";
    // bus
    if (":u1f68c:" == name || ":bus:" == name) return "1f68c";
    // oncoming bus
    if (":u1f68d:" == name || ":oncoming_bus:" == name) return "1f68d";
    // recreational vehicle
    if (":u1f699:" == name || ":blue_car:" == name) return "1f699";
    // oncoming automobile
    if (":u1f698:" == name || ":oncoming_automobile:" == name) return "1f698";
    // automobile
    if (":u1f697:" == name || ":car:" == name || ":red_car:" == name)
      return "1f697";
    // taxi
    if (":u1f695:" == name || ":taxi:" == name) return "1f695";
    // oncoming taxi
    if (":u1f696:" == name || ":oncoming_taxi:" == name) return "1f696";
    // articulated lorry
    if (":u1f69b:" == name || ":articulated_lorry:" == name) return "1f69b";
    // delivery truck
    if (":u1f69a:" == name || ":truck:" == name) return "1f69a";
    // police cars revolving light
    if (":u1f6a8:" == name || ":rotating_light:" == name) return "1f6a8";
    // police car
    if (":u1f693:" == name || ":police_car:" == name) return "1f693";
    // oncoming police car
    if (":u1f694:" == name || ":oncoming_police_car:" == name) return "1f694";
    // fire engine
    if (":u1f692:" == name || ":fire_engine:" == name) return "1f692";
    // ambulance
    if (":u1f691:" == name || ":ambulance:" == name) return "1f691";
    // minibus
    if (":u1f690:" == name || ":minibus:" == name) return "1f690";
    // bicycle
    if (":u1f6b2:" == name || ":bike:" == name) return "1f6b2";
    // aerial tramway
    if (":u1f6a1:" == name || ":aerial_tramway:" == name) return "1f6a1";
    // suspension railway
    if (":u1f69f:" == name || ":suspension_railway:" == name) return "1f69f";
    // mountain cableway
    if (":u1f6a0:" == name || ":mountain_cableway:" == name) return "1f6a0";
    // tractor
    if (":u1f69c:" == name || ":tractor:" == name) return "1f69c";
    // barber pole
    if (":u1f488:" == name || ":barber:" == name) return "1f488";
    // bus stop
    if (":u1f68f:" == name || ":busstop:" == name) return "1f68f";
    // ticket
    if (":u1f3ab:" == name || ":ticket:" == name) return "1f3ab";
    // vertical traffic light
    if (":u1f6a6:" == name || ":vertical_traffic_light:" == name)
      return "1f6a6";
    // horizontal traffic light
    if (":u1f6a5:" == name || ":traffic_light:" == name) return "1f6a5";
    // warning sign
    if (":u26a0:" == name || ":warning:" == name) return "26a0";
    // construction sign
    if (":u1f6a7:" == name || ":construction:" == name) return "1f6a7";
    // japanese symbol for beginner
    if (":u1f530:" == name || ":beginner:" == name) return "1f530";
    // fuel pump
    if (":u26fd:" == name || ":fuelpump:" == name) return "26fd";
    // izakaya lantern
    if (":u1f3ee:" == name ||
        ":izakaya_lantern:" == name ||
        ":lantern:" == name) return "1f3ee";
    // slot machine
    if (":u1f3b0:" == name || ":slot_machine:" == name) return "1f3b0";
    // hot springs
    if (":u2668:" == name || ":hotsprings:" == name) return "2668";
    // moyai
    if (":u1f5ff:" == name || ":moyai:" == name) return "1f5ff";
    // circus tent
    if (":u1f3aa:" == name || ":circus_tent:" == name) return "1f3aa";
    // performing arts
    if (":u1f3ad:" == name || ":performing_arts:" == name) return "1f3ad";
    // round pushpin
    if (":u1f4cd:" == name || ":round_pushpin:" == name) return "1f4cd";
    // triangular flag on post
    if (":u1f6a9:" == name || ":triangular_flag_on_post:" == name)
      return "1f6a9";
    // regional indicator symbol letter j + regional indicator symbol letter p
    if (":u1f1ef_1f1f5:" == name || ":jp:" == name) return "1f1ef_1f1f5";
    // regional indicator symbol letter k + regional indicator symbol letter r
    if (":u1f1f0_1f1f7:" == name || ":kr:" == name) return "1f1f0_1f1f7";
    // regional indicator symbol letter d + regional indicator symbol letter e
    if (":u1f1e9_1f1ea:" == name || ":de:" == name) return "1f1e9_1f1ea";
    // regional indicator symbol letter c + regional indicator symbol letter n
    if (":u1f1e8_1f1f3:" == name || ":cn:" == name) return "1f1e8_1f1f3";
    // regional indicator symbol letter u + regional indicator symbol letter s
    if (":u1f1fa_1f1f8:" == name || ":us:" == name) return "1f1fa_1f1f8";
    // regional indicator symbol letter f + regional indicator symbol letter r
    if (":u1f1eb_1f1f7:" == name || ":fr:" == name) return "1f1eb_1f1f7";
    // regional indicator symbol letter e + regional indicator symbol letter s
    if (":u1f1ea_1f1f8:" == name || ":es:" == name) return "1f1ea_1f1f8";
    // regional indicator symbol letter i + regional indicator symbol letter t
    if (":u1f1ee_1f1f9:" == name || ":it:" == name) return "1f1ee_1f1f9";
    // regional indicator symbol letter r + regional indicator symbol letter u
    if (":u1f1f7_1f1fa:" == name || ":ru:" == name) return "1f1f7_1f1fa";
    // regional indicator symbol letter g + regional indicator symbol letter b
    if (":u1f1ec_1f1e7:" == name || ":gb:" == name || ":uk:" == name)
      return "1f1ec_1f1e7";
    // digit one + combining enclosing keycap
    if (":u0031_20e3:" == name || ":one:" == name) return "0031_20e3";
    // digit two + combining enclosing keycap
    if (":u0032_20e3:" == name || ":two:" == name) return "0032_20e3";
    // digit three + combining enclosing keycap
    if (":u0033_20e3:" == name || ":three:" == name) return "0033_20e3";
    // digit four + combining enclosing keycap
    if (":u0034_20e3:" == name || ":four:" == name) return "0034_20e3";
    // digit five + combining enclosing keycap
    if (":u0035_20e3:" == name || ":five:" == name) return "0035_20e3";
    // digit six + combining enclosing keycap
    if (":u0036_20e3:" == name || ":six:" == name) return "003620e3";
    // digit seven + combining enclosing keycap
    if (":u0036_20e3:" == name || ":seven:" == name) return "003720e3";
    // digit eight + combining enclosing keycap
    if (":u0038_20e3:" == name || ":eight:" == name) return "0038_20e3";
    // digit nine + combining enclosing keycap
    if (":u0039_20e3:" == name || ":nine:" == name) return "0039_20e3";
    // digit zero + combining enclosing keycap
    if (":u0030_20e3:" == name || ":zero:" == name) return "0030_20e3";
    // keycap ten
    if (":u1f51f:" == name || ":keycap_ten:" == name) return "1f51f";
    // input symbol for numbers
    if (":u1f522:" == name || ":1234:" == name) return "1f522";
    // number sign + combining enclosing keycap
    if (":u0023_20e3:" == name || ":hash:" == name) return "0023_20e3";
    // input symbol for symbols
    if (":u1f523:" == name || ":symbols:" == name) return "1f523";
    // upwards black arrow
    if (":u2b06:" == name || ":arrow_up:" == name) return "2b06";
    // downwards black arrow
    if (":u2b07:" == name || ":arrow_down:" == name) return "2b07";
    // leftwards black arrow
    if (":u2b05:" == name || ":arrow_left:" == name) return "2b05";
    // black rightwards arrow
    if (":u27a1:" == name || ":arrow_right:" == name) return "27a1";
    // input symbol for latin capital letters
    if (":u1f520:" == name || ":capital_abcd:" == name) return "1f520";
    // input symbol for latin small letters
    if (":u1f521:" == name || ":abcd:" == name) return "1f521";
    // input symbol for latin letters
    if (":u1f524:" == name || ":abc:" == name) return "1f524";
    // north east arrow
    if (":u2197:" == name || ":arrow_upper_right:" == name) return "2197";
    // north west arrow
    if (":u2196:" == name || ":arrow_upper_left:" == name) return "2196";
    // south east arrow
    if (":u2198:" == name || ":arrow_lower_right:" == name) return "2198";
    // south west arrow
    if (":u2199:" == name || ":arrow_lower_left:" == name) return "2199";
    // left right arrow
    if (":u2194:" == name || ":left_right_arrow:" == name) return "2194";
    // up down arrow
    if (":u2195:" == name || ":arrow_up_down:" == name) return "2195";
    // anticlockwise downwards and upwards open circle arrows
    if (":u1f504:" == name || ":arrows_counterclockwise:" == name)
      return "1f504";
    // black left-pointing triangle
    if (":u25c0:" == name || ":arrow_backward:" == name) return "25c0";
    // black right-pointing triangle
    if (":u25b6:" == name || ":arrow_forward:" == name) return "25b6";
    // up-pointing small red triangle
    if (":u1f53c:" == name || ":arrow_up_small:" == name) return "1f53c";
    // down-pointing small red triangle
    if (":u1f53d:" == name || ":arrow_down_small:" == name) return "1f53d";
    // leftwards arrow with hook
    if (":u21a9:" == name || ":leftwards_arrow_with_hook:" == name)
      return "21a9";
    // rightwards arrow with hook
    if (":u21aa:" == name || ":arrow_right_hook:" == name) return "21aa";
    // information source
    if (":u2139:" == name || ":information_source:" == name) return "2139";
    // black left-pointing double triangle
    if (":u23ea:" == name || ":rewind:" == name) return "23ea";
    // black right-pointing double triangle
    if (":u23e9:" == name || ":fast_forward:" == name) return "23e9";
    // black up-pointing double triangle
    if (":u23eb:" == name || ":arrow_double_up:" == name) return "23eb";
    // black down-pointing double triangle
    if (":u23ec:" == name || ":arrow_double_down:" == name) return "23ec";
    // arrow pointing rightwards then curving downwards
    if (":u2935:" == name || ":arrow_heading_down:" == name) return "2935";
    // arrow pointing rightwards then curving upwards
    if (":u2934:" == name || ":arrow_heading_up:" == name) return "2934";
    // squared ok
    if (":u1f197:" == name || ":ok:" == name) return "1f197";
    // twisted rightwards arrows
    if (":u1f500:" == name || ":twisted_rightwards_arrows:" == name)
      return "1f500";
    // clockwise rightwards and leftwards open circle arrows
    if (":u1f501:" == name || ":repeat:" == name) return "1f501";
    // clockwise rightwards and leftwards open circle arrows with circled one overlay
    if (":u1f502:" == name || ":repeat_one:" == name) return "1f502";
    // squared new
    if (":u1f195:" == name || ":new:" == name) return "1f195";
    // squared up with exclamation mark
    if (":u1f199:" == name || ":up:" == name) return "1f199";
    // squared cool
    if (":u1f192:" == name || ":cool:" == name) return "1f192";
    // squared free
    if (":u1f193:" == name || ":free:" == name) return "1f193";
    // squared ng
    if (":u1f196:" == name || ":ng:" == name) return "1f196";
    // antenna with bars
    if (":u1f4f6:" == name || ":signal_strength:" == name) return "1f4f6";
    // cinema
    if (":u1f3a6:" == name || ":cinema:" == name) return "1f3a6";
    // squared katakana koko
    if (":u1f201:" == name || ":koko:" == name) return "1f201";
    // squared cjk unified ideograph-6307
    if (":u1f22f:" == name || ":u6307:" == name) return "1f22f";
    // squared cjk unified ideograph-7a7a
    if (":u1f233:" == name || ":u7a7a:" == name) return "1f233";
    // squared cjk unified ideograph-6e80
    if (":u1f235:" == name || ":u6e80:" == name) return "1f235";
    // squared cjk unified ideograph-5408
    if (":u1f234:" == name || ":u5408:" == name) return "1f234";
    // squared cjk unified ideograph-7981
    if (":u1f232:" == name || ":u7981:" == name) return "1f232";
    // circled ideograph advantage
    if (":u1f250:" == name || ":ideograph_advantage:" == name) return "1f250";
    // squared cjk unified ideograph-5272
    if (":u1f239:" == name || ":u5272:" == name) return "1f239";
    // squared cjk unified ideograph-55b6
    if (":u1f23a:" == name || ":u55b6:" == name) return "1f23a";
    // squared cjk unified ideograph-6709
    if (":u1f236:" == name || ":u6709:" == name) return "1f236";
    // squared cjk unified ideograph-7121
    if (":u1f21a:" == name || ":u7121:" == name) return "1f21a";
    // restroom
    if (":u1f6bb:" == name || ":restroom:" == name) return "1f6bb";
    // mens symbol
    if (":u1f6b9:" == name || ":mens:" == name) return "1f6b9";
    // womens symbol
    if (":u1f6ba:" == name || ":womens:" == name) return "1f6ba";
    // baby symbol
    if (":u1f6bc:" == name || ":baby_symbol:" == name) return "1f6bc";
    // water closet
    if (":u1f6be:" == name || ":wc:" == name) return "1f6be";
    // potable water symbol
    if (":u1f6b0:" == name || ":potable_water:" == name) return "1f6b0";
    // put litter in its place symbol
    if (":u1f6ae:" == name || ":put_litter_in_its_place:" == name)
      return "1f6ae";
    // negative squared latin capital letter p
    if (":u1f17f:" == name || ":parking:" == name) return "1f17f";
    // wheelchair symbol
    if (":u267f:" == name || ":wheelchair:" == name) return "267f";
    // no smoking symbol
    if (":u1f6ad:" == name || ":no_smoking:" == name) return "1f6ad";
    // squared cjk unified ideograph-6708
    if (":u1f237:" == name || ":u6708:" == name) return "1f237";
    // squared cjk unified ideograph-7533
    if (":u1f238:" == name || ":u7533:" == name) return "1f238";
    // squared katakana sa
    if (":u1f202:" == name || ":sa:" == name) return "1f202";
    // circled latin capital letter m
    if (":u24c2:" == name || ":m:" == name) return "24c2";
    // passport control
    if (":u1f6c2:" == name || ":passport_control:" == name) return "1f6c2";
    // baggage claim
    if (":u1f6c4:" == name || ":baggage_claim:" == name) return "1f6c4";
    // left luggage
    if (":u1f6c5:" == name || ":left_luggage:" == name) return "1f6c5";
    // customs
    if (":u1f6c3:" == name || ":customs:" == name) return "1f6c3";
    // circled ideograph accept
    if (":u1f251:" == name || ":accept:" == name) return "1f251";
    // circled ideograph secret
    if (":u3299:" == name || ":secret:" == name) return "3299";
    // circled ideograph congratulation
    if (":u3297:" == name || ":congratulations:" == name) return "3297";
    // squared cl
    if (":u1f191:" == name || ":cl:" == name) return "1f191";
    // squared sos
    if (":u1f198:" == name || ":sos:" == name) return "1f198";
    // squared id
    if (":u1f194:" == name || ":id:" == name) return "1f194";
    // no entry sign
    if (":u1f6ab:" == name || ":no_entry_sign:" == name) return "1f6ab";
    // no one under eighteen symbol
    if (":u1f51e:" == name || ":underage:" == name) return "1f51e";
    // no mobile phones
    if (":u1f4f5:" == name || ":no_mobile_phones:" == name) return "1f4f5";
    // do not litter symbol
    if (":u1f6af:" == name || ":do_not_litter:" == name) return "1f6af";
    // non-potable water symbol
    if (":u1f6b1:" == name || ":non-potable_water:" == name) return "1f6b1";
    // no bicycles
    if (":u1f6b3:" == name || ":no_bicycles:" == name) return "1f6b3";
    // no pedestrians
    if (":u1f6b7:" == name || ":no_pedestrians:" == name) return "1f6b7";
    // children crossing
    if (":u1f6b8:" == name || ":children_crossing:" == name) return "1f6b8";
    // no entry
    if (":u26d4:" == name || ":no_entry:" == name) return "26d4";
    // eight spoked asterisk
    if (":u2733:" == name || ":eight_spoked_asterisk:" == name) return "2733";
    // sparkle
    if (":u2747:" == name || ":sparkle:" == name) return "2747";
    // negative squared cross mark
    if (":u274e:" == name || ":negative_squared_cross_mark:" == name)
      return "274e";
    // white heavy check mark
    if (":u2705:" == name || ":white_check_mark:" == name) return "2705";
    // eight pointed black star
    if (":u2734:" == name || ":eight_pointed_black_star:" == name)
      return "2734";
    // heart decoration
    if (":u1f49f:" == name || ":heart_decoration:" == name) return "1f49f";
    // squared vs
    if (":u1f19a:" == name || ":vs:" == name) return "1f19a";
    // vibration mode
    if (":u1f4f3:" == name || ":vibration_mode:" == name) return "1f4f3";
    // mobile phone off
    if (":u1f4f4:" == name || ":mobile_phone_off:" == name) return "1f4f4";
    // negative squared latin capital letter a
    if (":u1f170:" == name || ":a:" == name) return "1f170";
    // negative squared latin capital letter b
    if (":u1f171:" == name || ":b:" == name) return "1f171";
    // negative squared ab
    if (":u1f18e:" == name || ":ab:" == name) return "1f18e";
    // negative squared latin capital letter o
    if (":u1f17e:" == name || ":o2:" == name) return "1f17e";
    // diamond shape with a dot inside
    if (":u1f4a0:" == name || ":diamond_shape_with_a_dot_inside:" == name)
      return "1f4a0";
    // double curly loop
    if (":u27bf:" == name || ":loop:" == name) return "27bf";
    // black universal recycling symbol
    if (":u267b:" == name || ":recycle:" == name) return "267b";
    // aries
    if (":u2648:" == name || ":aries:" == name) return "2648";
    // taurus
    if (":u2649:" == name || ":taurus:" == name) return "2649";
    // gemini
    if (":u264a:" == name || ":gemini:" == name) return "264a";
    // cancer
    if (":u264b:" == name || ":cancer:" == name) return "264b";
    // leo
    if (":u264c:" == name || ":leo:" == name) return "264c";
    // virgo
    if (":u264d:" == name || ":virgo:" == name) return "264d";
    // libra
    if (":u264e:" == name || ":libra:" == name) return "264e";
    // scorpius
    if (":u264f:" == name || ":scorpius:" == name) return "264f";
    // sagittarius
    if (":u2650:" == name || ":sagittarius:" == name) return "2650";
    // capricorn
    if (":u2651:" == name || ":capricorn:" == name) return "2651";
    // aquarius
    if (":u2652:" == name || ":aquarius:" == name) return "2652";
    // pisces
    if (":u2653:" == name || ":pisces:" == name) return "2653";
    // ophiuchus
    if (":u26ce:" == name || ":ophiuchus:" == name) return "26ce";
    // six pointed star with middle dot
    if (":u1f52f:" == name || ":six_pointed_star:" == name) return "1f52f";
    // automated teller machine
    if (":u1f3e7:" == name || ":atm:" == name) return "1f3e7";
    // chart with upwards trend and yen sign
    if (":u1f4b9:" == name || ":chart:" == name) return "1f4b9";
    // heavy dollar sign
    if (":u1f4b2:" == name || ":heavy_dollar_sign:" == name) return "1f4b2";
    // currency exchange
    if (":u1f4b1:" == name || ":currency_exchange:" == name) return "1f4b1";
    // copyright sign
    if (":u00a9:" == name || ":copyright:" == name) return "00a9";
    // registered sign
    if (":u00ae:" == name || ":registered:" == name) return "00ae";
    // trade mark sign
    if (":u2122:" == name || ":tm:" == name) return "2122";
    // cross mark
    if (":u274c:" == name || ":x:" == name) return "274c";
    // double exclamation mark
    if (":u203c:" == name || ":bangbang:" == name) return "203c";
    // exclamation question mark
    if (":u2049:" == name || ":interrobang:" == name) return "2049";
    // heavy exclamation mark symbol
    if (":u2757:" == name ||
        ":exclamation:" == name ||
        ":heavy_exclamation_mark:" == name) return "2757";
    // black question mark ornament
    if (":u2753:" == name || ":question:" == name) return "2753";
    // white exclamation mark ornament
    if (":u2755:" == name || ":grey_exclamation:" == name) return "2755";
    // white question mark ornament
    if (":u2754:" == name || ":grey_question:" == name) return "2754";
    // heavy large circle
    if (":u2b55:" == name || ":o:" == name) return "2b55";
    // top with upwards arrow above
    if (":u1f51d:" == name || ":top:" == name) return "1f51d";
    // end with leftwards arrow above
    if (":u1f51a:" == name || ":end:" == name) return "1f51a";
    // back with leftwards arrow above
    if (":u1f519:" == name || ":back:" == name) return "1f519";
    // on with exclamation mark with left right arrow above
    if (":u1f51b:" == name || ":on:" == name) return "1f51b";
    // soon with rightwards arrow above
    if (":u1f51c:" == name || ":soon:" == name) return "1f51c";
    // clockwise downwards and upwards open circle arrows
    if (":u1f503:" == name || ":arrows_clockwise:" == name) return "1f503";
    // clock face twelve oclock
    if (":u1f55b:" == name || ":clock12:" == name) return "1f55b";
    // clock face twelve-thirty
    if (":u1f567:" == name || ":clock1230:" == name) return "1f567";
    // clock face one oclock
    if (":u1f550:" == name || ":clock1:" == name) return "1f550";
    // clock face one-thirty
    if (":u1f55c:" == name || ":clock130:" == name) return "1f55c";
    // clock face two oclock
    if (":u1f551:" == name || ":clock2:" == name) return "1f551";
    // clock face two-thirty
    if (":u1f55d:" == name || ":clock230:" == name) return "1f55d";
    // clock face three oclock
    if (":u1f552:" == name || ":clock3:" == name) return "1f552";
    // clock face three-thirty
    if (":u1f55e:" == name || ":clock330:" == name) return "1f55e";
    // clock face four oclock
    if (":u1f553:" == name || ":clock4:" == name) return "1f553";
    // clock face four-thirty
    if (":u1f55f:" == name || ":clock430:" == name) return "1f55f";
    // clock face five oclock
    if (":u1f554:" == name || ":clock5:" == name) return "1f554";
    // clock face five-thirty
    if (":u1f560:" == name || ":clock530:" == name) return "1f560";
    // clock face six oclock
    if (":u1f555:" == name || ":clock6:" == name) return "1f555";
    // clock face seven oclock
    if (":u1f556:" == name || ":clock7:" == name) return "1f556";
    // clock face eight oclock
    if (":u1f557:" == name || ":clock8:" == name) return "1f557";
    // clock face nine oclock
    if (":u1f558:" == name || ":clock9:" == name) return "1f558";
    // clock face ten oclock
    if (":u1f559:" == name || ":clock10:" == name) return "1f559";
    // clock face eleven oclock
    if (":u1f55a:" == name || ":clock11:" == name) return "1f55a";
    // clock face six-thirty
    if (":u1f561:" == name || ":clock630:" == name) return "1f561";
    // clock face seven-thirty
    if (":u1f562:" == name || ":clock730:" == name) return "1f562";
    // clock face eight-thirty
    if (":u1f563:" == name || ":clock830:" == name) return "1f563";
    // clock face nine-thirty
    if (":u1f564:" == name || ":clock930:" == name) return "1f564";
    // clock face ten-thirty
    if (":u1f565:" == name || ":clock1030:" == name) return "1f565";
    // clock face eleven-thirty
    if (":u1f566:" == name || ":clock1130:" == name) return "1f566";
    // heavy multiplication x
    if (":u2716:" == name || ":heavy_multiplication_x:" == name) return "2716";
    // heavy plus sign
    if (":u2795:" == name || ":heavy_plus_sign:" == name) return "2795";
    // heavy minus sign
    if (":u2796:" == name || ":heavy_minus_sign:" == name) return "2796";
    // heavy division sign
    if (":u2797:" == name || ":heavy_division_sign:" == name) return "2797";
    // black spade suit
    if (":u2660:" == name || ":spades:" == name) return "2660";
    // black heart suit
    if (":u2665:" == name || ":hearts:" == name) return "2665";
    // black club suit
    if (":u2663:" == name || ":clubs:" == name) return "2663";
    // black diamond suit
    if (":u2666:" == name || ":diamonds:" == name) return "2666";
    // white flower
    if (":u1f4ae:" == name || ":white_flower:" == name) return "1f4ae";
    // hundred points symbol
    if (":u1f4af:" == name || ":100:" == name) return "1f4af";
    // heavy check mark
    if (":u2714:" == name || ":heavy_check_mark:" == name) return "2714";
    // ballot box with check
    if (":u2611:" == name || ":ballot_box_with_check:" == name) return "2611";
    // radio button
    if (":u1f518:" == name || ":radio_button:" == name) return "1f518";
    // link symbol
    if (":u1f517:" == name || ":link:" == name) return "1f517";
    // curly loop
    if (":u27b0:" == name || ":curly_loop:" == name) return "27b0";
    // wavy dash
    if (":u3030:" == name || ":wavy_dash:" == name) return "3030";
    // part alternation mark
    if (":u303d:" == name || ":part_alternation_mark:" == name) return "303d";
    // trident emblem
    if (":u1f531:" == name || ":trident:" == name) return "1f531";
    // black medium square
    if (":u25fc:" == name || ":black_medium_square:" == name) return "25fc";
    // white medium square
    if (":u25fb:" == name || ":white_medium_square:" == name) return "25fb";
    // black medium small square
    if (":u25fe:" == name || ":black_medium_small_square:" == name)
      return "25fe";
    // white medium small square
    if (":u25fd:" == name || ":white_medium_small_square:" == name)
      return "25fd";
    // black small square
    if (":u25aa:" == name || ":black_small_square:" == name) return "25aa";
    // white small square
    if (":u25ab:" == name || ":white_small_square:" == name) return "25ab";
    // up-pointing red triangle
    if (":u1f53a:" == name || ":small_red_triangle:" == name) return "1f53a";
    // black square button
    if (":u1f532:" == name || ":black_square_button:" == name) return "1f532";
    // white square button
    if (":u1f533:" == name || ":white_square_button:" == name) return "1f533";
    // medium black circle
    if (":u26ab:" == name || ":black_circle:" == name) return "26ab";
    // medium white circle
    if (":u26aa:" == name || ":white_circle:" == name) return "26aa";
    // large red circle
    if (":u1f534:" == name || ":red_circle:" == name) return "1f534";
    // large blue circle
    if (":u1f535:" == name || ":large_blue_circle:" == name) return "1f535";
    // down-pointing red triangle
    if (":u1f53b:" == name || ":small_red_triangle_down:" == name)
      return "1f53b";
    // white large square
    if (":u2b1c:" == name || ":white_large_square:" == name) return "2b1c";
    // black large square
    if (":u2b1b:" == name || ":black_large_square:" == name) return "2b1b";
    // large orange diamond
    if (":u1f536:" == name || ":large_orange_diamond:" == name) return "1f536";
    // large blue diamond
    if (":u1f537:" == name || ":large_blue_diamond:" == name) return "1f537";
    // small orange diamond
    if (":u1f538:" == name || ":small_orange_diamond:" == name) return "1f538";
    // small blue diamond
    if (":u1f539:" == name || ":small_blue_diamond:" == name) return "1f539";
    return null;
  }
}
