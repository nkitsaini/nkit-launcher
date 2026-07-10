import 'package:flutter/cupertino.dart';
import '../icon_choice.dart';

const String iconFont = 'CupertinoIcons';
const String iconFontPackage = 'cupertino_icons';

const Map<String, IconChoice> cupertinoIcons = {
  'left_chevron': IconChoice(
      name: 'left_chevron',
      data: CupertinoIcons.left_chevron,
      pack: 'cupertino'),
  'right_chevron': IconChoice(
      name: 'right_chevron',
      data: CupertinoIcons.right_chevron,
      pack: 'cupertino'),
  'share': IconChoice(
      name: 'share', data: CupertinoIcons.share, pack: 'cupertino'),
  'share_solid': IconChoice(
      name: 'share_solid', data: CupertinoIcons.share_solid, pack: 'cupertino'),
  'book': IconChoice(
      name: 'book', data: CupertinoIcons.book, pack: 'cupertino'),
  'book_solid': IconChoice(
      name: 'book_solid', data: CupertinoIcons.book_solid, pack: 'cupertino'),
  'bookmark': IconChoice(
      name: 'bookmark', data: CupertinoIcons.bookmark, pack: 'cupertino'),
  'bookmark_solid': IconChoice(
      name: 'bookmark_solid',
      data: CupertinoIcons.bookmark_solid,
      pack: 'cupertino'),
  'info': IconChoice(
      name: 'info', data: CupertinoIcons.info, pack: 'cupertino'),
  'reply': IconChoice(
      name: 'reply', data: CupertinoIcons.reply, pack: 'cupertino'),
  'conversation_bubble': IconChoice(
      name: 'conversation_bubble',
      data: CupertinoIcons.conversation_bubble,
      pack: 'cupertino'),
  'profile_circled': IconChoice(
      name: 'profile_circled',
      data: CupertinoIcons.profile_circled,
      pack: 'cupertino'),
  'plus_circled': IconChoice(
      name: 'plus_circled',
      data: CupertinoIcons.plus_circled,
      pack: 'cupertino'),
  'minus_circled': IconChoice(
      name: 'minus_circled',
      data: CupertinoIcons.minus_circled,
      pack: 'cupertino'),
  'flag': IconChoice(
      name: 'flag', data: CupertinoIcons.flag, pack: 'cupertino'),
  'search': IconChoice(
      name: 'search', data: CupertinoIcons.search, pack: 'cupertino'),
  'check_mark': IconChoice(
      name: 'check_mark', data: CupertinoIcons.check_mark, pack: 'cupertino'),
  'check_mark_circled': IconChoice(
      name: 'check_mark_circled',
      data: CupertinoIcons.check_mark_circled,
      pack: 'cupertino'),
  'check_mark_circled_solid': IconChoice(
      name: 'check_mark_circled_solid',
      data: CupertinoIcons.check_mark_circled_solid,
      pack: 'cupertino'),
  'circle': IconChoice(
      name: 'circle', data: CupertinoIcons.circle, pack: 'cupertino'),
  'circle_filled': IconChoice(
      name: 'circle_filled',
      data: CupertinoIcons.circle_filled,
      pack: 'cupertino'),
  'back': IconChoice(
      name: 'back', data: CupertinoIcons.back, pack: 'cupertino'),
  'forward': IconChoice(
      name: 'forward', data: CupertinoIcons.forward, pack: 'cupertino'),
  'home': IconChoice(
      name: 'home', data: CupertinoIcons.home, pack: 'cupertino'),
  'shopping_cart': IconChoice(
      name: 'shopping_cart',
      data: CupertinoIcons.shopping_cart,
      pack: 'cupertino'),
  'ellipsis': IconChoice(
      name: 'ellipsis', data: CupertinoIcons.ellipsis, pack: 'cupertino'),
  'phone': IconChoice(
      name: 'phone', data: CupertinoIcons.phone, pack: 'cupertino'),
  'phone_solid': IconChoice(
      name: 'phone_solid', data: CupertinoIcons.phone_solid, pack: 'cupertino'),
  'down_arrow': IconChoice(
      name: 'down_arrow', data: CupertinoIcons.down_arrow, pack: 'cupertino'),
  'up_arrow': IconChoice(
      name: 'up_arrow', data: CupertinoIcons.up_arrow, pack: 'cupertino'),
  'battery_charging': IconChoice(
      name: 'battery_charging',
      data: CupertinoIcons.battery_charging,
      pack: 'cupertino'),
  'battery_empty': IconChoice(
      name: 'battery_empty',
      data: CupertinoIcons.battery_empty,
      pack: 'cupertino'),
  'battery_full': IconChoice(
      name: 'battery_full',
      data: CupertinoIcons.battery_full,
      pack: 'cupertino'),
  'battery_75_percent': IconChoice(
      name: 'battery_75_percent',
      data: CupertinoIcons.battery_75_percent,
      pack: 'cupertino'),
  'battery_25_percent': IconChoice(
      name: 'battery_25_percent',
      data: CupertinoIcons.battery_25_percent,
      pack: 'cupertino'),
  'bluetooth': IconChoice(
      name: 'bluetooth', data: CupertinoIcons.bluetooth, pack: 'cupertino'),
  'restart': IconChoice(
      name: 'restart', data: CupertinoIcons.restart, pack: 'cupertino'),
  'reply_all': IconChoice(
      name: 'reply_all', data: CupertinoIcons.reply_all, pack: 'cupertino'),
  'reply_thick_solid': IconChoice(
      name: 'reply_thick_solid',
      data: CupertinoIcons.reply_thick_solid,
      pack: 'cupertino'),
  'share_up': IconChoice(
      name: 'share_up', data: CupertinoIcons.share_up, pack: 'cupertino'),
  'shuffle': IconChoice(
      name: 'shuffle', data: CupertinoIcons.shuffle, pack: 'cupertino'),
  'shuffle_medium': IconChoice(
      name: 'shuffle_medium',
      data: CupertinoIcons.shuffle_medium,
      pack: 'cupertino'),
  'shuffle_thick': IconChoice(
      name: 'shuffle_thick',
      data: CupertinoIcons.shuffle_thick,
      pack: 'cupertino'),
  'photo_camera': IconChoice(
      name: 'photo_camera',
      data: CupertinoIcons.photo_camera,
      pack: 'cupertino'),
  'photo_camera_solid': IconChoice(
      name: 'photo_camera_solid',
      data: CupertinoIcons.photo_camera_solid,
      pack: 'cupertino'),
  'video_camera': IconChoice(
      name: 'video_camera',
      data: CupertinoIcons.video_camera,
      pack: 'cupertino'),
  'video_camera_solid': IconChoice(
      name: 'video_camera_solid',
      data: CupertinoIcons.video_camera_solid,
      pack: 'cupertino'),
  'switch_camera': IconChoice(
      name: 'switch_camera',
      data: CupertinoIcons.switch_camera,
      pack: 'cupertino'),
  'switch_camera_solid': IconChoice(
      name: 'switch_camera_solid',
      data: CupertinoIcons.switch_camera_solid,
      pack: 'cupertino'),
  'collections': IconChoice(
      name: 'collections', data: CupertinoIcons.collections, pack: 'cupertino'),
  'collections_solid': IconChoice(
      name: 'collections_solid',
      data: CupertinoIcons.collections_solid,
      pack: 'cupertino'),
  'folder': IconChoice(
      name: 'folder', data: CupertinoIcons.folder, pack: 'cupertino'),
  'folder_solid': IconChoice(
      name: 'folder_solid',
      data: CupertinoIcons.folder_solid,
      pack: 'cupertino'),
  'folder_open': IconChoice(
      name: 'folder_open', data: CupertinoIcons.folder_open, pack: 'cupertino'),
  'delete': IconChoice(
      name: 'delete', data: CupertinoIcons.delete, pack: 'cupertino'),
  'delete_solid': IconChoice(
      name: 'delete_solid',
      data: CupertinoIcons.delete_solid,
      pack: 'cupertino'),
  'delete_simple': IconChoice(
      name: 'delete_simple',
      data: CupertinoIcons.delete_simple,
      pack: 'cupertino'),
  'pen':
      IconChoice(name: 'pen', data: CupertinoIcons.pen, pack: 'cupertino'),
  'pencil': IconChoice(
      name: 'pencil', data: CupertinoIcons.pencil, pack: 'cupertino'),
  'create': IconChoice(
      name: 'create', data: CupertinoIcons.create, pack: 'cupertino'),
  'create_solid': IconChoice(
      name: 'create_solid',
      data: CupertinoIcons.create_solid,
      pack: 'cupertino'),
  'refresh': IconChoice(
      name: 'refresh', data: CupertinoIcons.refresh, pack: 'cupertino'),
  'refresh_circled': IconChoice(
      name: 'refresh_circled',
      data: CupertinoIcons.refresh_circled,
      pack: 'cupertino'),
  'refresh_circled_solid': IconChoice(
      name: 'refresh_circled_solid',
      data: CupertinoIcons.refresh_circled_solid,
      pack: 'cupertino'),
  'refresh_thin': IconChoice(
      name: 'refresh_thin',
      data: CupertinoIcons.refresh_thin,
      pack: 'cupertino'),
  'refresh_thick': IconChoice(
      name: 'refresh_thick',
      data: CupertinoIcons.refresh_thick,
      pack: 'cupertino'),
  'refresh_bold': IconChoice(
      name: 'refresh_bold',
      data: CupertinoIcons.refresh_bold,
      pack: 'cupertino'),
  'clear_thick': IconChoice(
      name: 'clear_thick', data: CupertinoIcons.clear_thick, pack: 'cupertino'),
  'clear_thick_circled': IconChoice(
      name: 'clear_thick_circled',
      data: CupertinoIcons.clear_thick_circled,
      pack: 'cupertino'),
  'clear': IconChoice(
      name: 'clear', data: CupertinoIcons.clear, pack: 'cupertino'),
  'clear_circled': IconChoice(
      name: 'clear_circled',
      data: CupertinoIcons.clear_circled,
      pack: 'cupertino'),
  'clear_circled_solid': IconChoice(
      name: 'clear_circled_solid',
      data: CupertinoIcons.clear_circled_solid,
      pack: 'cupertino'),
  'add':
      IconChoice(name: 'add', data: CupertinoIcons.add, pack: 'cupertino'),
  'add_circled': IconChoice(
      name: 'add_circled', data: CupertinoIcons.add_circled, pack: 'cupertino'),
  'add_circled_solid': IconChoice(
      name: 'add_circled_solid',
      data: CupertinoIcons.add_circled_solid,
      pack: 'cupertino'),
  'gear': IconChoice(
      name: 'gear', data: CupertinoIcons.gear, pack: 'cupertino'),
  'gear_solid': IconChoice(
      name: 'gear_solid', data: CupertinoIcons.gear_solid, pack: 'cupertino'),
  'gear_big': IconChoice(
      name: 'gear_big', data: CupertinoIcons.gear_big, pack: 'cupertino'),
  'settings': IconChoice(
      name: 'settings', data: CupertinoIcons.settings, pack: 'cupertino'),
  'settings_solid': IconChoice(
      name: 'settings_solid',
      data: CupertinoIcons.settings_solid,
      pack: 'cupertino'),
  'music_note': IconChoice(
      name: 'music_note', data: CupertinoIcons.music_note, pack: 'cupertino'),
  'double_music_note': IconChoice(
      name: 'double_music_note',
      data: CupertinoIcons.double_music_note,
      pack: 'cupertino'),
  'play_arrow': IconChoice(
      name: 'play_arrow', data: CupertinoIcons.play_arrow, pack: 'cupertino'),
  'play_arrow_solid': IconChoice(
      name: 'play_arrow_solid',
      data: CupertinoIcons.play_arrow_solid,
      pack: 'cupertino'),
  'pause': IconChoice(
      name: 'pause', data: CupertinoIcons.pause, pack: 'cupertino'),
  'pause_solid': IconChoice(
      name: 'pause_solid', data: CupertinoIcons.pause_solid, pack: 'cupertino'),
  'loop': IconChoice(
      name: 'loop', data: CupertinoIcons.loop, pack: 'cupertino'),
  'loop_thick': IconChoice(
      name: 'loop_thick', data: CupertinoIcons.loop_thick, pack: 'cupertino'),
  'volume_down': IconChoice(
      name: 'volume_down', data: CupertinoIcons.volume_down, pack: 'cupertino'),
  'volume_mute': IconChoice(
      name: 'volume_mute', data: CupertinoIcons.volume_mute, pack: 'cupertino'),
  'volume_off': IconChoice(
      name: 'volume_off', data: CupertinoIcons.volume_off, pack: 'cupertino'),
  'volume_up': IconChoice(
      name: 'volume_up', data: CupertinoIcons.volume_up, pack: 'cupertino'),
  'fullscreen': IconChoice(
      name: 'fullscreen', data: CupertinoIcons.fullscreen, pack: 'cupertino'),
  'fullscreen_exit': IconChoice(
      name: 'fullscreen_exit',
      data: CupertinoIcons.fullscreen_exit,
      pack: 'cupertino'),
  'mic_off': IconChoice(
      name: 'mic_off', data: CupertinoIcons.mic_off, pack: 'cupertino'),
  'mic':
      IconChoice(name: 'mic', data: CupertinoIcons.mic, pack: 'cupertino'),
  'mic_solid': IconChoice(
      name: 'mic_solid', data: CupertinoIcons.mic_solid, pack: 'cupertino'),
  'clock': IconChoice(
      name: 'clock', data: CupertinoIcons.clock, pack: 'cupertino'),
  'clock_solid': IconChoice(
      name: 'clock_solid', data: CupertinoIcons.clock_solid, pack: 'cupertino'),
  'time': IconChoice(
      name: 'time', data: CupertinoIcons.time, pack: 'cupertino'),
  'time_solid': IconChoice(
      name: 'time_solid', data: CupertinoIcons.time_solid, pack: 'cupertino'),
  'padlock': IconChoice(
      name: 'padlock', data: CupertinoIcons.padlock, pack: 'cupertino'),
  'padlock_solid': IconChoice(
      name: 'padlock_solid',
      data: CupertinoIcons.padlock_solid,
      pack: 'cupertino'),
  'eye':
      IconChoice(name: 'eye', data: CupertinoIcons.eye, pack: 'cupertino'),
  'eye_solid': IconChoice(
      name: 'eye_solid', data: CupertinoIcons.eye_solid, pack: 'cupertino'),
  'person': IconChoice(
      name: 'person', data: CupertinoIcons.person, pack: 'cupertino'),
  'person_solid': IconChoice(
      name: 'person_solid',
      data: CupertinoIcons.person_solid,
      pack: 'cupertino'),
  'person_add': IconChoice(
      name: 'person_add', data: CupertinoIcons.person_add, pack: 'cupertino'),
  'person_add_solid': IconChoice(
      name: 'person_add_solid',
      data: CupertinoIcons.person_add_solid,
      pack: 'cupertino'),
  'group': IconChoice(
      name: 'group', data: CupertinoIcons.group, pack: 'cupertino'),
  'group_solid': IconChoice(
      name: 'group_solid', data: CupertinoIcons.group_solid, pack: 'cupertino'),
  'mail': IconChoice(
      name: 'mail', data: CupertinoIcons.mail, pack: 'cupertino'),
  'mail_solid': IconChoice(
      name: 'mail_solid', data: CupertinoIcons.mail_solid, pack: 'cupertino'),
  'location': IconChoice(
      name: 'location', data: CupertinoIcons.location, pack: 'cupertino'),
  'location_solid': IconChoice(
      name: 'location_solid',
      data: CupertinoIcons.location_solid,
      pack: 'cupertino'),
  'tag':
      IconChoice(name: 'tag', data: CupertinoIcons.tag, pack: 'cupertino'),
  'tag_solid': IconChoice(
      name: 'tag_solid', data: CupertinoIcons.tag_solid, pack: 'cupertino'),
  'tags': IconChoice(
      name: 'tags', data: CupertinoIcons.tags, pack: 'cupertino'),
  'tags_solid': IconChoice(
      name: 'tags_solid', data: CupertinoIcons.tags_solid, pack: 'cupertino'),
  'bus':
      IconChoice(name: 'bus', data: CupertinoIcons.bus, pack: 'cupertino'),
  'car':
      IconChoice(name: 'car', data: CupertinoIcons.car, pack: 'cupertino'),
  'car_detailed': IconChoice(
      name: 'car_detailed',
      data: CupertinoIcons.car_detailed,
      pack: 'cupertino'),
  'train_style_one': IconChoice(
      name: 'train_style_one',
      data: CupertinoIcons.train_style_one,
      pack: 'cupertino'),
  'train_style_two': IconChoice(
      name: 'train_style_two',
      data: CupertinoIcons.train_style_two,
      pack: 'cupertino'),
  'paw':
      IconChoice(name: 'paw', data: CupertinoIcons.paw, pack: 'cupertino'),
  'paw_solid': IconChoice(
      name: 'paw_solid', data: CupertinoIcons.paw_solid, pack: 'cupertino'),
  'game_controller': IconChoice(
      name: 'game_controller',
      data: CupertinoIcons.game_controller,
      pack: 'cupertino'),
  'game_controller_solid': IconChoice(
      name: 'game_controller_solid',
      data: CupertinoIcons.game_controller_solid,
      pack: 'cupertino'),
  'lab_flask': IconChoice(
      name: 'lab_flask', data: CupertinoIcons.lab_flask, pack: 'cupertino'),
  'lab_flask_solid': IconChoice(
      name: 'lab_flask_solid',
      data: CupertinoIcons.lab_flask_solid,
      pack: 'cupertino'),
  'heart': IconChoice(
      name: 'heart', data: CupertinoIcons.heart, pack: 'cupertino'),
  'heart_solid': IconChoice(
      name: 'heart_solid', data: CupertinoIcons.heart_solid, pack: 'cupertino'),
  'bell': IconChoice(
      name: 'bell', data: CupertinoIcons.bell, pack: 'cupertino'),
  'bell_solid': IconChoice(
      name: 'bell_solid', data: CupertinoIcons.bell_solid, pack: 'cupertino'),
  'news': IconChoice(
      name: 'news', data: CupertinoIcons.news, pack: 'cupertino'),
  'news_solid': IconChoice(
      name: 'news_solid', data: CupertinoIcons.news_solid, pack: 'cupertino'),
  'brightness': IconChoice(
      name: 'brightness', data: CupertinoIcons.brightness, pack: 'cupertino'),
  'brightness_solid': IconChoice(
      name: 'brightness_solid',
      data: CupertinoIcons.brightness_solid,
      pack: 'cupertino'),
  'airplane': IconChoice(
      name: 'airplane', data: CupertinoIcons.airplane, pack: 'cupertino'),
  'alarm': IconChoice(
      name: 'alarm', data: CupertinoIcons.alarm, pack: 'cupertino'),
  'alarm_fill': IconChoice(
      name: 'alarm_fill', data: CupertinoIcons.alarm_fill, pack: 'cupertino'),
  'alt':
      IconChoice(name: 'alt', data: CupertinoIcons.alt, pack: 'cupertino'),
  'ant':
      IconChoice(name: 'ant', data: CupertinoIcons.ant, pack: 'cupertino'),
  'ant_circle': IconChoice(
      name: 'ant_circle', data: CupertinoIcons.ant_circle, pack: 'cupertino'),
  'ant_circle_fill': IconChoice(
      name: 'ant_circle_fill',
      data: CupertinoIcons.ant_circle_fill,
      pack: 'cupertino'),
  'ant_fill': IconChoice(
      name: 'ant_fill', data: CupertinoIcons.ant_fill, pack: 'cupertino'),
  'antenna_radiowaves_left_right': IconChoice(
      name: 'antenna_radiowaves_left_right',
      data: CupertinoIcons.antenna_radiowaves_left_right,
      pack: 'cupertino'),
  'app':
      IconChoice(name: 'app', data: CupertinoIcons.app, pack: 'cupertino'),
  'app_badge': IconChoice(
      name: 'app_badge', data: CupertinoIcons.app_badge, pack: 'cupertino'),
  'app_badge_fill': IconChoice(
      name: 'app_badge_fill',
      data: CupertinoIcons.app_badge_fill,
      pack: 'cupertino'),
  'app_fill': IconChoice(
      name: 'app_fill', data: CupertinoIcons.app_fill, pack: 'cupertino'),
  'archivebox': IconChoice(
      name: 'archivebox', data: CupertinoIcons.archivebox, pack: 'cupertino'),
  'archivebox_fill': IconChoice(
      name: 'archivebox_fill',
      data: CupertinoIcons.archivebox_fill,
      pack: 'cupertino'),
  'arrow_2_circlepath': IconChoice(
      name: 'arrow_2_circlepath',
      data: CupertinoIcons.arrow_2_circlepath,
      pack: 'cupertino'),
  'arrow_2_circlepath_circle': IconChoice(
      name: 'arrow_2_circlepath_circle',
      data: CupertinoIcons.arrow_2_circlepath_circle,
      pack: 'cupertino'),
  'arrow_2_circlepath_circle_fill': IconChoice(
      name: 'arrow_2_circlepath_circle_fill',
      data: CupertinoIcons.arrow_2_circlepath_circle_fill,
      pack: 'cupertino'),
  'arrow_2_squarepath': IconChoice(
      name: 'arrow_2_squarepath',
      data: CupertinoIcons.arrow_2_squarepath,
      pack: 'cupertino'),
  'arrow_3_trianglepath': IconChoice(
      name: 'arrow_3_trianglepath',
      data: CupertinoIcons.arrow_3_trianglepath,
      pack: 'cupertino'),
  'arrow_branch': IconChoice(
      name: 'arrow_branch',
      data: CupertinoIcons.arrow_branch,
      pack: 'cupertino'),
  'arrow_clockwise': IconChoice(
      name: 'arrow_clockwise',
      data: CupertinoIcons.arrow_clockwise,
      pack: 'cupertino'),
  'arrow_clockwise_circle': IconChoice(
      name: 'arrow_clockwise_circle',
      data: CupertinoIcons.arrow_clockwise_circle,
      pack: 'cupertino'),
  'arrow_clockwise_circle_fill': IconChoice(
      name: 'arrow_clockwise_circle_fill',
      data: CupertinoIcons.arrow_clockwise_circle_fill,
      pack: 'cupertino'),
  'arrow_counterclockwise': IconChoice(
      name: 'arrow_counterclockwise',
      data: CupertinoIcons.arrow_counterclockwise,
      pack: 'cupertino'),
  'arrow_counterclockwise_circle': IconChoice(
      name: 'arrow_counterclockwise_circle',
      data: CupertinoIcons.arrow_counterclockwise_circle,
      pack: 'cupertino'),
  'arrow_counterclockwise_circle_fill': IconChoice(
      name: 'arrow_counterclockwise_circle_fill',
      data: CupertinoIcons.arrow_counterclockwise_circle_fill,
      pack: 'cupertino'),
  'arrow_down': IconChoice(
      name: 'arrow_down', data: CupertinoIcons.arrow_down, pack: 'cupertino'),
  'arrow_down_circle': IconChoice(
      name: 'arrow_down_circle',
      data: CupertinoIcons.arrow_down_circle,
      pack: 'cupertino'),
  'arrow_down_circle_fill': IconChoice(
      name: 'arrow_down_circle_fill',
      data: CupertinoIcons.arrow_down_circle_fill,
      pack: 'cupertino'),
  'arrow_down_doc': IconChoice(
      name: 'arrow_down_doc',
      data: CupertinoIcons.arrow_down_doc,
      pack: 'cupertino'),
  'arrow_down_doc_fill': IconChoice(
      name: 'arrow_down_doc_fill',
      data: CupertinoIcons.arrow_down_doc_fill,
      pack: 'cupertino'),
  'arrow_down_left': IconChoice(
      name: 'arrow_down_left',
      data: CupertinoIcons.arrow_down_left,
      pack: 'cupertino'),
  'arrow_down_left_circle': IconChoice(
      name: 'arrow_down_left_circle',
      data: CupertinoIcons.arrow_down_left_circle,
      pack: 'cupertino'),
  'arrow_down_left_circle_fill': IconChoice(
      name: 'arrow_down_left_circle_fill',
      data: CupertinoIcons.arrow_down_left_circle_fill,
      pack: 'cupertino'),
  'arrow_down_left_square': IconChoice(
      name: 'arrow_down_left_square',
      data: CupertinoIcons.arrow_down_left_square,
      pack: 'cupertino'),
  'arrow_down_left_square_fill': IconChoice(
      name: 'arrow_down_left_square_fill',
      data: CupertinoIcons.arrow_down_left_square_fill,
      pack: 'cupertino'),
  'arrow_down_right': IconChoice(
      name: 'arrow_down_right',
      data: CupertinoIcons.arrow_down_right,
      pack: 'cupertino'),
  'arrow_down_right_arrow_up_left': IconChoice(
      name: 'arrow_down_right_arrow_up_left',
      data: CupertinoIcons.arrow_down_right_arrow_up_left,
      pack: 'cupertino'),
  'arrow_down_right_circle': IconChoice(
      name: 'arrow_down_right_circle',
      data: CupertinoIcons.arrow_down_right_circle,
      pack: 'cupertino'),
  'arrow_down_right_circle_fill': IconChoice(
      name: 'arrow_down_right_circle_fill',
      data: CupertinoIcons.arrow_down_right_circle_fill,
      pack: 'cupertino'),
  'arrow_down_right_square': IconChoice(
      name: 'arrow_down_right_square',
      data: CupertinoIcons.arrow_down_right_square,
      pack: 'cupertino'),
  'arrow_down_right_square_fill': IconChoice(
      name: 'arrow_down_right_square_fill',
      data: CupertinoIcons.arrow_down_right_square_fill,
      pack: 'cupertino'),
  'arrow_down_square': IconChoice(
      name: 'arrow_down_square',
      data: CupertinoIcons.arrow_down_square,
      pack: 'cupertino'),
  'arrow_down_square_fill': IconChoice(
      name: 'arrow_down_square_fill',
      data: CupertinoIcons.arrow_down_square_fill,
      pack: 'cupertino'),
  'arrow_down_to_line': IconChoice(
      name: 'arrow_down_to_line',
      data: CupertinoIcons.arrow_down_to_line,
      pack: 'cupertino'),
  'arrow_down_to_line_alt': IconChoice(
      name: 'arrow_down_to_line_alt',
      data: CupertinoIcons.arrow_down_to_line_alt,
      pack: 'cupertino'),
  'arrow_left': IconChoice(
      name: 'arrow_left', data: CupertinoIcons.arrow_left, pack: 'cupertino'),
  'arrow_left_circle': IconChoice(
      name: 'arrow_left_circle',
      data: CupertinoIcons.arrow_left_circle,
      pack: 'cupertino'),
  'arrow_left_circle_fill': IconChoice(
      name: 'arrow_left_circle_fill',
      data: CupertinoIcons.arrow_left_circle_fill,
      pack: 'cupertino'),
  'arrow_left_right': IconChoice(
      name: 'arrow_left_right',
      data: CupertinoIcons.arrow_left_right,
      pack: 'cupertino'),
  'arrow_left_right_circle': IconChoice(
      name: 'arrow_left_right_circle',
      data: CupertinoIcons.arrow_left_right_circle,
      pack: 'cupertino'),
  'arrow_left_right_circle_fill': IconChoice(
      name: 'arrow_left_right_circle_fill',
      data: CupertinoIcons.arrow_left_right_circle_fill,
      pack: 'cupertino'),
  'arrow_left_right_square': IconChoice(
      name: 'arrow_left_right_square',
      data: CupertinoIcons.arrow_left_right_square,
      pack: 'cupertino'),
  'arrow_left_right_square_fill': IconChoice(
      name: 'arrow_left_right_square_fill',
      data: CupertinoIcons.arrow_left_right_square_fill,
      pack: 'cupertino'),
  'arrow_left_square': IconChoice(
      name: 'arrow_left_square',
      data: CupertinoIcons.arrow_left_square,
      pack: 'cupertino'),
  'arrow_left_square_fill': IconChoice(
      name: 'arrow_left_square_fill',
      data: CupertinoIcons.arrow_left_square_fill,
      pack: 'cupertino'),
  'arrow_left_to_line': IconChoice(
      name: 'arrow_left_to_line',
      data: CupertinoIcons.arrow_left_to_line,
      pack: 'cupertino'),
  'arrow_left_to_line_alt': IconChoice(
      name: 'arrow_left_to_line_alt',
      data: CupertinoIcons.arrow_left_to_line_alt,
      pack: 'cupertino'),
  'arrow_merge': IconChoice(
      name: 'arrow_merge', data: CupertinoIcons.arrow_merge, pack: 'cupertino'),
  'arrow_right': IconChoice(
      name: 'arrow_right', data: CupertinoIcons.arrow_right, pack: 'cupertino'),
  'arrow_right_arrow_left': IconChoice(
      name: 'arrow_right_arrow_left',
      data: CupertinoIcons.arrow_right_arrow_left,
      pack: 'cupertino'),
  'arrow_right_arrow_left_circle': IconChoice(
      name: 'arrow_right_arrow_left_circle',
      data: CupertinoIcons.arrow_right_arrow_left_circle,
      pack: 'cupertino'),
  'arrow_right_arrow_left_circle_fill': IconChoice(
      name: 'arrow_right_arrow_left_circle_fill',
      data: CupertinoIcons.arrow_right_arrow_left_circle_fill,
      pack: 'cupertino'),
  'arrow_right_arrow_left_square': IconChoice(
      name: 'arrow_right_arrow_left_square',
      data: CupertinoIcons.arrow_right_arrow_left_square,
      pack: 'cupertino'),
  'arrow_right_arrow_left_square_fill': IconChoice(
      name: 'arrow_right_arrow_left_square_fill',
      data: CupertinoIcons.arrow_right_arrow_left_square_fill,
      pack: 'cupertino'),
  'arrow_right_circle': IconChoice(
      name: 'arrow_right_circle',
      data: CupertinoIcons.arrow_right_circle,
      pack: 'cupertino'),
  'arrow_right_circle_fill': IconChoice(
      name: 'arrow_right_circle_fill',
      data: CupertinoIcons.arrow_right_circle_fill,
      pack: 'cupertino'),
  'arrow_right_square': IconChoice(
      name: 'arrow_right_square',
      data: CupertinoIcons.arrow_right_square,
      pack: 'cupertino'),
  'arrow_right_square_fill': IconChoice(
      name: 'arrow_right_square_fill',
      data: CupertinoIcons.arrow_right_square_fill,
      pack: 'cupertino'),
  'arrow_right_to_line': IconChoice(
      name: 'arrow_right_to_line',
      data: CupertinoIcons.arrow_right_to_line,
      pack: 'cupertino'),
  'arrow_right_to_line_alt': IconChoice(
      name: 'arrow_right_to_line_alt',
      data: CupertinoIcons.arrow_right_to_line_alt,
      pack: 'cupertino'),
  'arrow_swap': IconChoice(
      name: 'arrow_swap', data: CupertinoIcons.arrow_swap, pack: 'cupertino'),
  'arrow_turn_down_left': IconChoice(
      name: 'arrow_turn_down_left',
      data: CupertinoIcons.arrow_turn_down_left,
      pack: 'cupertino'),
  'arrow_turn_down_right': IconChoice(
      name: 'arrow_turn_down_right',
      data: CupertinoIcons.arrow_turn_down_right,
      pack: 'cupertino'),
  'arrow_turn_left_down': IconChoice(
      name: 'arrow_turn_left_down',
      data: CupertinoIcons.arrow_turn_left_down,
      pack: 'cupertino'),
  'arrow_turn_left_up': IconChoice(
      name: 'arrow_turn_left_up',
      data: CupertinoIcons.arrow_turn_left_up,
      pack: 'cupertino'),
  'arrow_turn_right_down': IconChoice(
      name: 'arrow_turn_right_down',
      data: CupertinoIcons.arrow_turn_right_down,
      pack: 'cupertino'),
  'arrow_turn_right_up': IconChoice(
      name: 'arrow_turn_right_up',
      data: CupertinoIcons.arrow_turn_right_up,
      pack: 'cupertino'),
  'arrow_turn_up_left': IconChoice(
      name: 'arrow_turn_up_left',
      data: CupertinoIcons.arrow_turn_up_left,
      pack: 'cupertino'),
  'arrow_turn_up_right': IconChoice(
      name: 'arrow_turn_up_right',
      data: CupertinoIcons.arrow_turn_up_right,
      pack: 'cupertino'),
  'arrow_up': IconChoice(
      name: 'arrow_up', data: CupertinoIcons.arrow_up, pack: 'cupertino'),
  'arrow_up_arrow_down': IconChoice(
      name: 'arrow_up_arrow_down',
      data: CupertinoIcons.arrow_up_arrow_down,
      pack: 'cupertino'),
  'arrow_up_arrow_down_circle': IconChoice(
      name: 'arrow_up_arrow_down_circle',
      data: CupertinoIcons.arrow_up_arrow_down_circle,
      pack: 'cupertino'),
  'arrow_up_arrow_down_circle_fill': IconChoice(
      name: 'arrow_up_arrow_down_circle_fill',
      data: CupertinoIcons.arrow_up_arrow_down_circle_fill,
      pack: 'cupertino'),
  'arrow_up_arrow_down_square': IconChoice(
      name: 'arrow_up_arrow_down_square',
      data: CupertinoIcons.arrow_up_arrow_down_square,
      pack: 'cupertino'),
  'arrow_up_arrow_down_square_fill': IconChoice(
      name: 'arrow_up_arrow_down_square_fill',
      data: CupertinoIcons.arrow_up_arrow_down_square_fill,
      pack: 'cupertino'),
  'arrow_up_bin': IconChoice(
      name: 'arrow_up_bin',
      data: CupertinoIcons.arrow_up_bin,
      pack: 'cupertino'),
  'arrow_up_bin_fill': IconChoice(
      name: 'arrow_up_bin_fill',
      data: CupertinoIcons.arrow_up_bin_fill,
      pack: 'cupertino'),
  'arrow_up_circle': IconChoice(
      name: 'arrow_up_circle',
      data: CupertinoIcons.arrow_up_circle,
      pack: 'cupertino'),
  'arrow_up_circle_fill': IconChoice(
      name: 'arrow_up_circle_fill',
      data: CupertinoIcons.arrow_up_circle_fill,
      pack: 'cupertino'),
  'arrow_up_doc': IconChoice(
      name: 'arrow_up_doc',
      data: CupertinoIcons.arrow_up_doc,
      pack: 'cupertino'),
  'arrow_up_doc_fill': IconChoice(
      name: 'arrow_up_doc_fill',
      data: CupertinoIcons.arrow_up_doc_fill,
      pack: 'cupertino'),
  'arrow_up_down': IconChoice(
      name: 'arrow_up_down',
      data: CupertinoIcons.arrow_up_down,
      pack: 'cupertino'),
  'arrow_up_down_circle': IconChoice(
      name: 'arrow_up_down_circle',
      data: CupertinoIcons.arrow_up_down_circle,
      pack: 'cupertino'),
  'arrow_up_down_circle_fill': IconChoice(
      name: 'arrow_up_down_circle_fill',
      data: CupertinoIcons.arrow_up_down_circle_fill,
      pack: 'cupertino'),
  'arrow_up_down_square': IconChoice(
      name: 'arrow_up_down_square',
      data: CupertinoIcons.arrow_up_down_square,
      pack: 'cupertino'),
  'arrow_up_down_square_fill': IconChoice(
      name: 'arrow_up_down_square_fill',
      data: CupertinoIcons.arrow_up_down_square_fill,
      pack: 'cupertino'),
  'arrow_up_left': IconChoice(
      name: 'arrow_up_left',
      data: CupertinoIcons.arrow_up_left,
      pack: 'cupertino'),
  'arrow_up_left_arrow_down_right': IconChoice(
      name: 'arrow_up_left_arrow_down_right',
      data: CupertinoIcons.arrow_up_left_arrow_down_right,
      pack: 'cupertino'),
  'arrow_up_left_circle': IconChoice(
      name: 'arrow_up_left_circle',
      data: CupertinoIcons.arrow_up_left_circle,
      pack: 'cupertino'),
  'arrow_up_left_circle_fill': IconChoice(
      name: 'arrow_up_left_circle_fill',
      data: CupertinoIcons.arrow_up_left_circle_fill,
      pack: 'cupertino'),
  'arrow_up_left_square': IconChoice(
      name: 'arrow_up_left_square',
      data: CupertinoIcons.arrow_up_left_square,
      pack: 'cupertino'),
  'arrow_up_left_square_fill': IconChoice(
      name: 'arrow_up_left_square_fill',
      data: CupertinoIcons.arrow_up_left_square_fill,
      pack: 'cupertino'),
  'arrow_up_right': IconChoice(
      name: 'arrow_up_right',
      data: CupertinoIcons.arrow_up_right,
      pack: 'cupertino'),
  'arrow_up_right_circle': IconChoice(
      name: 'arrow_up_right_circle',
      data: CupertinoIcons.arrow_up_right_circle,
      pack: 'cupertino'),
  'arrow_up_right_circle_fill': IconChoice(
      name: 'arrow_up_right_circle_fill',
      data: CupertinoIcons.arrow_up_right_circle_fill,
      pack: 'cupertino'),
  'arrow_up_right_diamond': IconChoice(
      name: 'arrow_up_right_diamond',
      data: CupertinoIcons.arrow_up_right_diamond,
      pack: 'cupertino'),
  'arrow_up_right_diamond_fill': IconChoice(
      name: 'arrow_up_right_diamond_fill',
      data: CupertinoIcons.arrow_up_right_diamond_fill,
      pack: 'cupertino'),
  'arrow_up_right_square': IconChoice(
      name: 'arrow_up_right_square',
      data: CupertinoIcons.arrow_up_right_square,
      pack: 'cupertino'),
  'arrow_up_right_square_fill': IconChoice(
      name: 'arrow_up_right_square_fill',
      data: CupertinoIcons.arrow_up_right_square_fill,
      pack: 'cupertino'),
  'arrow_up_square': IconChoice(
      name: 'arrow_up_square',
      data: CupertinoIcons.arrow_up_square,
      pack: 'cupertino'),
  'arrow_up_square_fill': IconChoice(
      name: 'arrow_up_square_fill',
      data: CupertinoIcons.arrow_up_square_fill,
      pack: 'cupertino'),
  'arrow_up_to_line': IconChoice(
      name: 'arrow_up_to_line',
      data: CupertinoIcons.arrow_up_to_line,
      pack: 'cupertino'),
  'arrow_up_to_line_alt': IconChoice(
      name: 'arrow_up_to_line_alt',
      data: CupertinoIcons.arrow_up_to_line_alt,
      pack: 'cupertino'),
  'arrow_uturn_down': IconChoice(
      name: 'arrow_uturn_down',
      data: CupertinoIcons.arrow_uturn_down,
      pack: 'cupertino'),
  'arrow_uturn_down_circle': IconChoice(
      name: 'arrow_uturn_down_circle',
      data: CupertinoIcons.arrow_uturn_down_circle,
      pack: 'cupertino'),
  'arrow_uturn_down_circle_fill': IconChoice(
      name: 'arrow_uturn_down_circle_fill',
      data: CupertinoIcons.arrow_uturn_down_circle_fill,
      pack: 'cupertino'),
  'arrow_uturn_down_square': IconChoice(
      name: 'arrow_uturn_down_square',
      data: CupertinoIcons.arrow_uturn_down_square,
      pack: 'cupertino'),
  'arrow_uturn_down_square_fill': IconChoice(
      name: 'arrow_uturn_down_square_fill',
      data: CupertinoIcons.arrow_uturn_down_square_fill,
      pack: 'cupertino'),
  'arrow_uturn_left': IconChoice(
      name: 'arrow_uturn_left',
      data: CupertinoIcons.arrow_uturn_left,
      pack: 'cupertino'),
  'arrow_uturn_left_circle': IconChoice(
      name: 'arrow_uturn_left_circle',
      data: CupertinoIcons.arrow_uturn_left_circle,
      pack: 'cupertino'),
  'arrow_uturn_left_circle_fill': IconChoice(
      name: 'arrow_uturn_left_circle_fill',
      data: CupertinoIcons.arrow_uturn_left_circle_fill,
      pack: 'cupertino'),
  'arrow_uturn_left_square': IconChoice(
      name: 'arrow_uturn_left_square',
      data: CupertinoIcons.arrow_uturn_left_square,
      pack: 'cupertino'),
  'arrow_uturn_left_square_fill': IconChoice(
      name: 'arrow_uturn_left_square_fill',
      data: CupertinoIcons.arrow_uturn_left_square_fill,
      pack: 'cupertino'),
  'arrow_uturn_right': IconChoice(
      name: 'arrow_uturn_right',
      data: CupertinoIcons.arrow_uturn_right,
      pack: 'cupertino'),
  'arrow_uturn_right_circle': IconChoice(
      name: 'arrow_uturn_right_circle',
      data: CupertinoIcons.arrow_uturn_right_circle,
      pack: 'cupertino'),
  'arrow_uturn_right_circle_fill': IconChoice(
      name: 'arrow_uturn_right_circle_fill',
      data: CupertinoIcons.arrow_uturn_right_circle_fill,
      pack: 'cupertino'),
  'arrow_uturn_right_square': IconChoice(
      name: 'arrow_uturn_right_square',
      data: CupertinoIcons.arrow_uturn_right_square,
      pack: 'cupertino'),
  'arrow_uturn_right_square_fill': IconChoice(
      name: 'arrow_uturn_right_square_fill',
      data: CupertinoIcons.arrow_uturn_right_square_fill,
      pack: 'cupertino'),
  'arrow_uturn_up': IconChoice(
      name: 'arrow_uturn_up',
      data: CupertinoIcons.arrow_uturn_up,
      pack: 'cupertino'),
  'arrow_uturn_up_circle': IconChoice(
      name: 'arrow_uturn_up_circle',
      data: CupertinoIcons.arrow_uturn_up_circle,
      pack: 'cupertino'),
  'arrow_uturn_up_circle_fill': IconChoice(
      name: 'arrow_uturn_up_circle_fill',
      data: CupertinoIcons.arrow_uturn_up_circle_fill,
      pack: 'cupertino'),
  'arrow_uturn_up_square': IconChoice(
      name: 'arrow_uturn_up_square',
      data: CupertinoIcons.arrow_uturn_up_square,
      pack: 'cupertino'),
  'arrow_uturn_up_square_fill': IconChoice(
      name: 'arrow_uturn_up_square_fill',
      data: CupertinoIcons.arrow_uturn_up_square_fill,
      pack: 'cupertino'),
  'arrowshape_turn_up_left': IconChoice(
      name: 'arrowshape_turn_up_left',
      data: CupertinoIcons.arrowshape_turn_up_left,
      pack: 'cupertino'),
  'arrowshape_turn_up_left_2': IconChoice(
      name: 'arrowshape_turn_up_left_2',
      data: CupertinoIcons.arrowshape_turn_up_left_2,
      pack: 'cupertino'),
  'arrowshape_turn_up_left_2_fill': IconChoice(
      name: 'arrowshape_turn_up_left_2_fill',
      data: CupertinoIcons.arrowshape_turn_up_left_2_fill,
      pack: 'cupertino'),
  'arrowshape_turn_up_left_circle': IconChoice(
      name: 'arrowshape_turn_up_left_circle',
      data: CupertinoIcons.arrowshape_turn_up_left_circle,
      pack: 'cupertino'),
  'arrowshape_turn_up_left_circle_fill': IconChoice(
      name: 'arrowshape_turn_up_left_circle_fill',
      data: CupertinoIcons.arrowshape_turn_up_left_circle_fill,
      pack: 'cupertino'),
  'arrowshape_turn_up_left_fill': IconChoice(
      name: 'arrowshape_turn_up_left_fill',
      data: CupertinoIcons.arrowshape_turn_up_left_fill,
      pack: 'cupertino'),
  'arrowshape_turn_up_right': IconChoice(
      name: 'arrowshape_turn_up_right',
      data: CupertinoIcons.arrowshape_turn_up_right,
      pack: 'cupertino'),
  'arrowshape_turn_up_right_circle': IconChoice(
      name: 'arrowshape_turn_up_right_circle',
      data: CupertinoIcons.arrowshape_turn_up_right_circle,
      pack: 'cupertino'),
  'arrowshape_turn_up_right_circle_fill': IconChoice(
      name: 'arrowshape_turn_up_right_circle_fill',
      data: CupertinoIcons.arrowshape_turn_up_right_circle_fill,
      pack: 'cupertino'),
  'arrowshape_turn_up_right_fill': IconChoice(
      name: 'arrowshape_turn_up_right_fill',
      data: CupertinoIcons.arrowshape_turn_up_right_fill,
      pack: 'cupertino'),
  'arrowtriangle_down': IconChoice(
      name: 'arrowtriangle_down',
      data: CupertinoIcons.arrowtriangle_down,
      pack: 'cupertino'),
  'arrowtriangle_down_circle': IconChoice(
      name: 'arrowtriangle_down_circle',
      data: CupertinoIcons.arrowtriangle_down_circle,
      pack: 'cupertino'),
  'arrowtriangle_down_circle_fill': IconChoice(
      name: 'arrowtriangle_down_circle_fill',
      data: CupertinoIcons.arrowtriangle_down_circle_fill,
      pack: 'cupertino'),
  'arrowtriangle_down_fill': IconChoice(
      name: 'arrowtriangle_down_fill',
      data: CupertinoIcons.arrowtriangle_down_fill,
      pack: 'cupertino'),
  'arrowtriangle_down_square': IconChoice(
      name: 'arrowtriangle_down_square',
      data: CupertinoIcons.arrowtriangle_down_square,
      pack: 'cupertino'),
  'arrowtriangle_down_square_fill': IconChoice(
      name: 'arrowtriangle_down_square_fill',
      data: CupertinoIcons.arrowtriangle_down_square_fill,
      pack: 'cupertino'),
  'arrowtriangle_left': IconChoice(
      name: 'arrowtriangle_left',
      data: CupertinoIcons.arrowtriangle_left,
      pack: 'cupertino'),
  'arrowtriangle_left_circle': IconChoice(
      name: 'arrowtriangle_left_circle',
      data: CupertinoIcons.arrowtriangle_left_circle,
      pack: 'cupertino'),
  'arrowtriangle_left_circle_fill': IconChoice(
      name: 'arrowtriangle_left_circle_fill',
      data: CupertinoIcons.arrowtriangle_left_circle_fill,
      pack: 'cupertino'),
  'arrowtriangle_left_fill': IconChoice(
      name: 'arrowtriangle_left_fill',
      data: CupertinoIcons.arrowtriangle_left_fill,
      pack: 'cupertino'),
  'arrowtriangle_left_square': IconChoice(
      name: 'arrowtriangle_left_square',
      data: CupertinoIcons.arrowtriangle_left_square,
      pack: 'cupertino'),
  'arrowtriangle_left_square_fill': IconChoice(
      name: 'arrowtriangle_left_square_fill',
      data: CupertinoIcons.arrowtriangle_left_square_fill,
      pack: 'cupertino'),
  'arrowtriangle_right': IconChoice(
      name: 'arrowtriangle_right',
      data: CupertinoIcons.arrowtriangle_right,
      pack: 'cupertino'),
  'arrowtriangle_right_circle': IconChoice(
      name: 'arrowtriangle_right_circle',
      data: CupertinoIcons.arrowtriangle_right_circle,
      pack: 'cupertino'),
  'arrowtriangle_right_circle_fill': IconChoice(
      name: 'arrowtriangle_right_circle_fill',
      data: CupertinoIcons.arrowtriangle_right_circle_fill,
      pack: 'cupertino'),
  'arrowtriangle_right_fill': IconChoice(
      name: 'arrowtriangle_right_fill',
      data: CupertinoIcons.arrowtriangle_right_fill,
      pack: 'cupertino'),
  'arrowtriangle_right_square': IconChoice(
      name: 'arrowtriangle_right_square',
      data: CupertinoIcons.arrowtriangle_right_square,
      pack: 'cupertino'),
  'arrowtriangle_right_square_fill': IconChoice(
      name: 'arrowtriangle_right_square_fill',
      data: CupertinoIcons.arrowtriangle_right_square_fill,
      pack: 'cupertino'),
  'arrowtriangle_up': IconChoice(
      name: 'arrowtriangle_up',
      data: CupertinoIcons.arrowtriangle_up,
      pack: 'cupertino'),
  'arrowtriangle_up_circle': IconChoice(
      name: 'arrowtriangle_up_circle',
      data: CupertinoIcons.arrowtriangle_up_circle,
      pack: 'cupertino'),
  'arrowtriangle_up_circle_fill': IconChoice(
      name: 'arrowtriangle_up_circle_fill',
      data: CupertinoIcons.arrowtriangle_up_circle_fill,
      pack: 'cupertino'),
  'arrowtriangle_up_fill': IconChoice(
      name: 'arrowtriangle_up_fill',
      data: CupertinoIcons.arrowtriangle_up_fill,
      pack: 'cupertino'),
  'arrowtriangle_up_square': IconChoice(
      name: 'arrowtriangle_up_square',
      data: CupertinoIcons.arrowtriangle_up_square,
      pack: 'cupertino'),
  'arrowtriangle_up_square_fill': IconChoice(
      name: 'arrowtriangle_up_square_fill',
      data: CupertinoIcons.arrowtriangle_up_square_fill,
      pack: 'cupertino'),
  'asterisk_circle': IconChoice(
      name: 'asterisk_circle',
      data: CupertinoIcons.asterisk_circle,
      pack: 'cupertino'),
  'asterisk_circle_fill': IconChoice(
      name: 'asterisk_circle_fill',
      data: CupertinoIcons.asterisk_circle_fill,
      pack: 'cupertino'),
  'at': IconChoice(name: 'at', data: CupertinoIcons.at, pack: 'cupertino'),
  'at_badge_minus': IconChoice(
      name: 'at_badge_minus',
      data: CupertinoIcons.at_badge_minus,
      pack: 'cupertino'),
  'at_badge_plus': IconChoice(
      name: 'at_badge_plus',
      data: CupertinoIcons.at_badge_plus,
      pack: 'cupertino'),
  'at_circle': IconChoice(
      name: 'at_circle', data: CupertinoIcons.at_circle, pack: 'cupertino'),
  'at_circle_fill': IconChoice(
      name: 'at_circle_fill',
      data: CupertinoIcons.at_circle_fill,
      pack: 'cupertino'),
  'backward': IconChoice(
      name: 'backward', data: CupertinoIcons.backward, pack: 'cupertino'),
  'backward_end': IconChoice(
      name: 'backward_end',
      data: CupertinoIcons.backward_end,
      pack: 'cupertino'),
  'backward_end_alt': IconChoice(
      name: 'backward_end_alt',
      data: CupertinoIcons.backward_end_alt,
      pack: 'cupertino'),
  'backward_end_alt_fill': IconChoice(
      name: 'backward_end_alt_fill',
      data: CupertinoIcons.backward_end_alt_fill,
      pack: 'cupertino'),
  'backward_end_fill': IconChoice(
      name: 'backward_end_fill',
      data: CupertinoIcons.backward_end_fill,
      pack: 'cupertino'),
  'backward_fill': IconChoice(
      name: 'backward_fill',
      data: CupertinoIcons.backward_fill,
      pack: 'cupertino'),
  'badge_plus_radiowaves_right': IconChoice(
      name: 'badge_plus_radiowaves_right',
      data: CupertinoIcons.badge_plus_radiowaves_right,
      pack: 'cupertino'),
  'bag':
      IconChoice(name: 'bag', data: CupertinoIcons.bag, pack: 'cupertino'),
  'bag_badge_minus': IconChoice(
      name: 'bag_badge_minus',
      data: CupertinoIcons.bag_badge_minus,
      pack: 'cupertino'),
  'bag_badge_plus': IconChoice(
      name: 'bag_badge_plus',
      data: CupertinoIcons.bag_badge_plus,
      pack: 'cupertino'),
  'bag_fill': IconChoice(
      name: 'bag_fill', data: CupertinoIcons.bag_fill, pack: 'cupertino'),
  'bag_fill_badge_minus': IconChoice(
      name: 'bag_fill_badge_minus',
      data: CupertinoIcons.bag_fill_badge_minus,
      pack: 'cupertino'),
  'bag_fill_badge_plus': IconChoice(
      name: 'bag_fill_badge_plus',
      data: CupertinoIcons.bag_fill_badge_plus,
      pack: 'cupertino'),
  'bandage': IconChoice(
      name: 'bandage', data: CupertinoIcons.bandage, pack: 'cupertino'),
  'bandage_fill': IconChoice(
      name: 'bandage_fill',
      data: CupertinoIcons.bandage_fill,
      pack: 'cupertino'),
  'barcode': IconChoice(
      name: 'barcode', data: CupertinoIcons.barcode, pack: 'cupertino'),
  'barcode_viewfinder': IconChoice(
      name: 'barcode_viewfinder',
      data: CupertinoIcons.barcode_viewfinder,
      pack: 'cupertino'),
  'bars': IconChoice(
      name: 'bars', data: CupertinoIcons.bars, pack: 'cupertino'),
  'battery_0': IconChoice(
      name: 'battery_0', data: CupertinoIcons.battery_0, pack: 'cupertino'),
  'battery_100': IconChoice(
      name: 'battery_100', data: CupertinoIcons.battery_100, pack: 'cupertino'),
  'battery_25': IconChoice(
      name: 'battery_25', data: CupertinoIcons.battery_25, pack: 'cupertino'),
  'bed_double': IconChoice(
      name: 'bed_double', data: CupertinoIcons.bed_double, pack: 'cupertino'),
  'bed_double_fill': IconChoice(
      name: 'bed_double_fill',
      data: CupertinoIcons.bed_double_fill,
      pack: 'cupertino'),
  'bell_circle': IconChoice(
      name: 'bell_circle', data: CupertinoIcons.bell_circle, pack: 'cupertino'),
  'bell_circle_fill': IconChoice(
      name: 'bell_circle_fill',
      data: CupertinoIcons.bell_circle_fill,
      pack: 'cupertino'),
  'bell_fill': IconChoice(
      name: 'bell_fill', data: CupertinoIcons.bell_fill, pack: 'cupertino'),
  'bell_slash': IconChoice(
      name: 'bell_slash', data: CupertinoIcons.bell_slash, pack: 'cupertino'),
  'bell_slash_fill': IconChoice(
      name: 'bell_slash_fill',
      data: CupertinoIcons.bell_slash_fill,
      pack: 'cupertino'),
  'bin_xmark': IconChoice(
      name: 'bin_xmark', data: CupertinoIcons.bin_xmark, pack: 'cupertino'),
  'bin_xmark_fill': IconChoice(
      name: 'bin_xmark_fill',
      data: CupertinoIcons.bin_xmark_fill,
      pack: 'cupertino'),
  'bitcoin': IconChoice(
      name: 'bitcoin', data: CupertinoIcons.bitcoin, pack: 'cupertino'),
  'bitcoin_circle': IconChoice(
      name: 'bitcoin_circle',
      data: CupertinoIcons.bitcoin_circle,
      pack: 'cupertino'),
  'bitcoin_circle_fill': IconChoice(
      name: 'bitcoin_circle_fill',
      data: CupertinoIcons.bitcoin_circle_fill,
      pack: 'cupertino'),
  'bold': IconChoice(
      name: 'bold', data: CupertinoIcons.bold, pack: 'cupertino'),
  'bold_italic_underline': IconChoice(
      name: 'bold_italic_underline',
      data: CupertinoIcons.bold_italic_underline,
      pack: 'cupertino'),
  'bold_underline': IconChoice(
      name: 'bold_underline',
      data: CupertinoIcons.bold_underline,
      pack: 'cupertino'),
  'bolt': IconChoice(
      name: 'bolt', data: CupertinoIcons.bolt, pack: 'cupertino'),
  'bolt_badge_a': IconChoice(
      name: 'bolt_badge_a',
      data: CupertinoIcons.bolt_badge_a,
      pack: 'cupertino'),
  'bolt_badge_a_fill': IconChoice(
      name: 'bolt_badge_a_fill',
      data: CupertinoIcons.bolt_badge_a_fill,
      pack: 'cupertino'),
  'bolt_circle': IconChoice(
      name: 'bolt_circle', data: CupertinoIcons.bolt_circle, pack: 'cupertino'),
  'bolt_circle_fill': IconChoice(
      name: 'bolt_circle_fill',
      data: CupertinoIcons.bolt_circle_fill,
      pack: 'cupertino'),
  'bolt_fill': IconChoice(
      name: 'bolt_fill', data: CupertinoIcons.bolt_fill, pack: 'cupertino'),
  'bolt_horizontal': IconChoice(
      name: 'bolt_horizontal',
      data: CupertinoIcons.bolt_horizontal,
      pack: 'cupertino'),
  'bolt_horizontal_circle': IconChoice(
      name: 'bolt_horizontal_circle',
      data: CupertinoIcons.bolt_horizontal_circle,
      pack: 'cupertino'),
  'bolt_horizontal_circle_fill': IconChoice(
      name: 'bolt_horizontal_circle_fill',
      data: CupertinoIcons.bolt_horizontal_circle_fill,
      pack: 'cupertino'),
  'bolt_horizontal_fill': IconChoice(
      name: 'bolt_horizontal_fill',
      data: CupertinoIcons.bolt_horizontal_fill,
      pack: 'cupertino'),
  'bolt_slash': IconChoice(
      name: 'bolt_slash', data: CupertinoIcons.bolt_slash, pack: 'cupertino'),
  'bolt_slash_fill': IconChoice(
      name: 'bolt_slash_fill',
      data: CupertinoIcons.bolt_slash_fill,
      pack: 'cupertino'),
  'book_circle': IconChoice(
      name: 'book_circle', data: CupertinoIcons.book_circle, pack: 'cupertino'),
  'book_circle_fill': IconChoice(
      name: 'book_circle_fill',
      data: CupertinoIcons.book_circle_fill,
      pack: 'cupertino'),
  'book_fill': IconChoice(
      name: 'book_fill', data: CupertinoIcons.book_fill, pack: 'cupertino'),
  'bookmark_fill': IconChoice(
      name: 'bookmark_fill',
      data: CupertinoIcons.bookmark_fill,
      pack: 'cupertino'),
  'briefcase': IconChoice(
      name: 'briefcase', data: CupertinoIcons.briefcase, pack: 'cupertino'),
  'briefcase_fill': IconChoice(
      name: 'briefcase_fill',
      data: CupertinoIcons.briefcase_fill,
      pack: 'cupertino'),
  'bubble_left': IconChoice(
      name: 'bubble_left', data: CupertinoIcons.bubble_left, pack: 'cupertino'),
  'bubble_left_bubble_right': IconChoice(
      name: 'bubble_left_bubble_right',
      data: CupertinoIcons.bubble_left_bubble_right,
      pack: 'cupertino'),
  'bubble_left_bubble_right_fill': IconChoice(
      name: 'bubble_left_bubble_right_fill',
      data: CupertinoIcons.bubble_left_bubble_right_fill,
      pack: 'cupertino'),
  'bubble_left_fill': IconChoice(
      name: 'bubble_left_fill',
      data: CupertinoIcons.bubble_left_fill,
      pack: 'cupertino'),
  'bubble_middle_bottom': IconChoice(
      name: 'bubble_middle_bottom',
      data: CupertinoIcons.bubble_middle_bottom,
      pack: 'cupertino'),
  'bubble_middle_bottom_fill': IconChoice(
      name: 'bubble_middle_bottom_fill',
      data: CupertinoIcons.bubble_middle_bottom_fill,
      pack: 'cupertino'),
  'bubble_middle_top': IconChoice(
      name: 'bubble_middle_top',
      data: CupertinoIcons.bubble_middle_top,
      pack: 'cupertino'),
  'bubble_middle_top_fill': IconChoice(
      name: 'bubble_middle_top_fill',
      data: CupertinoIcons.bubble_middle_top_fill,
      pack: 'cupertino'),
  'bubble_right': IconChoice(
      name: 'bubble_right',
      data: CupertinoIcons.bubble_right,
      pack: 'cupertino'),
  'bubble_right_fill': IconChoice(
      name: 'bubble_right_fill',
      data: CupertinoIcons.bubble_right_fill,
      pack: 'cupertino'),
  'building_2_fill': IconChoice(
      name: 'building_2_fill',
      data: CupertinoIcons.building_2_fill,
      pack: 'cupertino'),
  'burn': IconChoice(
      name: 'burn', data: CupertinoIcons.burn, pack: 'cupertino'),
  'burst': IconChoice(
      name: 'burst', data: CupertinoIcons.burst, pack: 'cupertino'),
  'burst_fill': IconChoice(
      name: 'burst_fill', data: CupertinoIcons.burst_fill, pack: 'cupertino'),
  'calendar': IconChoice(
      name: 'calendar', data: CupertinoIcons.calendar, pack: 'cupertino'),
  'calendar_badge_minus': IconChoice(
      name: 'calendar_badge_minus',
      data: CupertinoIcons.calendar_badge_minus,
      pack: 'cupertino'),
  'calendar_badge_plus': IconChoice(
      name: 'calendar_badge_plus',
      data: CupertinoIcons.calendar_badge_plus,
      pack: 'cupertino'),
  'calendar_circle': IconChoice(
      name: 'calendar_circle',
      data: CupertinoIcons.calendar_circle,
      pack: 'cupertino'),
  'calendar_circle_fill': IconChoice(
      name: 'calendar_circle_fill',
      data: CupertinoIcons.calendar_circle_fill,
      pack: 'cupertino'),
  'calendar_today': IconChoice(
      name: 'calendar_today',
      data: CupertinoIcons.calendar_today,
      pack: 'cupertino'),
  'camera': IconChoice(
      name: 'camera', data: CupertinoIcons.camera, pack: 'cupertino'),
  'camera_circle': IconChoice(
      name: 'camera_circle',
      data: CupertinoIcons.camera_circle,
      pack: 'cupertino'),
  'camera_circle_fill': IconChoice(
      name: 'camera_circle_fill',
      data: CupertinoIcons.camera_circle_fill,
      pack: 'cupertino'),
  'camera_fill': IconChoice(
      name: 'camera_fill', data: CupertinoIcons.camera_fill, pack: 'cupertino'),
  'camera_on_rectangle': IconChoice(
      name: 'camera_on_rectangle',
      data: CupertinoIcons.camera_on_rectangle,
      pack: 'cupertino'),
  'camera_on_rectangle_fill': IconChoice(
      name: 'camera_on_rectangle_fill',
      data: CupertinoIcons.camera_on_rectangle_fill,
      pack: 'cupertino'),
  'camera_rotate': IconChoice(
      name: 'camera_rotate',
      data: CupertinoIcons.camera_rotate,
      pack: 'cupertino'),
  'camera_rotate_fill': IconChoice(
      name: 'camera_rotate_fill',
      data: CupertinoIcons.camera_rotate_fill,
      pack: 'cupertino'),
  'camera_viewfinder': IconChoice(
      name: 'camera_viewfinder',
      data: CupertinoIcons.camera_viewfinder,
      pack: 'cupertino'),
  'capslock': IconChoice(
      name: 'capslock', data: CupertinoIcons.capslock, pack: 'cupertino'),
  'capslock_fill': IconChoice(
      name: 'capslock_fill',
      data: CupertinoIcons.capslock_fill,
      pack: 'cupertino'),
  'capsule': IconChoice(
      name: 'capsule', data: CupertinoIcons.capsule, pack: 'cupertino'),
  'capsule_fill': IconChoice(
      name: 'capsule_fill',
      data: CupertinoIcons.capsule_fill,
      pack: 'cupertino'),
  'captions_bubble': IconChoice(
      name: 'captions_bubble',
      data: CupertinoIcons.captions_bubble,
      pack: 'cupertino'),
  'captions_bubble_fill': IconChoice(
      name: 'captions_bubble_fill',
      data: CupertinoIcons.captions_bubble_fill,
      pack: 'cupertino'),
  'car_fill': IconChoice(
      name: 'car_fill', data: CupertinoIcons.car_fill, pack: 'cupertino'),
  'cart': IconChoice(
      name: 'cart', data: CupertinoIcons.cart, pack: 'cupertino'),
  'cart_badge_minus': IconChoice(
      name: 'cart_badge_minus',
      data: CupertinoIcons.cart_badge_minus,
      pack: 'cupertino'),
  'cart_badge_plus': IconChoice(
      name: 'cart_badge_plus',
      data: CupertinoIcons.cart_badge_plus,
      pack: 'cupertino'),
  'cart_fill': IconChoice(
      name: 'cart_fill', data: CupertinoIcons.cart_fill, pack: 'cupertino'),
  'cart_fill_badge_minus': IconChoice(
      name: 'cart_fill_badge_minus',
      data: CupertinoIcons.cart_fill_badge_minus,
      pack: 'cupertino'),
  'cart_fill_badge_plus': IconChoice(
      name: 'cart_fill_badge_plus',
      data: CupertinoIcons.cart_fill_badge_plus,
      pack: 'cupertino'),
  'chart_bar': IconChoice(
      name: 'chart_bar', data: CupertinoIcons.chart_bar, pack: 'cupertino'),
  'chart_bar_alt_fill': IconChoice(
      name: 'chart_bar_alt_fill',
      data: CupertinoIcons.chart_bar_alt_fill,
      pack: 'cupertino'),
  'chart_bar_circle': IconChoice(
      name: 'chart_bar_circle',
      data: CupertinoIcons.chart_bar_circle,
      pack: 'cupertino'),
  'chart_bar_circle_fill': IconChoice(
      name: 'chart_bar_circle_fill',
      data: CupertinoIcons.chart_bar_circle_fill,
      pack: 'cupertino'),
  'chart_bar_fill': IconChoice(
      name: 'chart_bar_fill',
      data: CupertinoIcons.chart_bar_fill,
      pack: 'cupertino'),
  'chart_bar_square': IconChoice(
      name: 'chart_bar_square',
      data: CupertinoIcons.chart_bar_square,
      pack: 'cupertino'),
  'chart_bar_square_fill': IconChoice(
      name: 'chart_bar_square_fill',
      data: CupertinoIcons.chart_bar_square_fill,
      pack: 'cupertino'),
  'chart_pie': IconChoice(
      name: 'chart_pie', data: CupertinoIcons.chart_pie, pack: 'cupertino'),
  'chart_pie_fill': IconChoice(
      name: 'chart_pie_fill',
      data: CupertinoIcons.chart_pie_fill,
      pack: 'cupertino'),
  'chat_bubble': IconChoice(
      name: 'chat_bubble', data: CupertinoIcons.chat_bubble, pack: 'cupertino'),
  'chat_bubble_2': IconChoice(
      name: 'chat_bubble_2',
      data: CupertinoIcons.chat_bubble_2,
      pack: 'cupertino'),
  'chat_bubble_2_fill': IconChoice(
      name: 'chat_bubble_2_fill',
      data: CupertinoIcons.chat_bubble_2_fill,
      pack: 'cupertino'),
  'chat_bubble_fill': IconChoice(
      name: 'chat_bubble_fill',
      data: CupertinoIcons.chat_bubble_fill,
      pack: 'cupertino'),
  'chat_bubble_text': IconChoice(
      name: 'chat_bubble_text',
      data: CupertinoIcons.chat_bubble_text,
      pack: 'cupertino'),
  'chat_bubble_text_fill': IconChoice(
      name: 'chat_bubble_text_fill',
      data: CupertinoIcons.chat_bubble_text_fill,
      pack: 'cupertino'),
  'checkmark': IconChoice(
      name: 'checkmark', data: CupertinoIcons.checkmark, pack: 'cupertino'),
  'checkmark_alt': IconChoice(
      name: 'checkmark_alt',
      data: CupertinoIcons.checkmark_alt,
      pack: 'cupertino'),
  'checkmark_alt_circle': IconChoice(
      name: 'checkmark_alt_circle',
      data: CupertinoIcons.checkmark_alt_circle,
      pack: 'cupertino'),
  'checkmark_alt_circle_fill': IconChoice(
      name: 'checkmark_alt_circle_fill',
      data: CupertinoIcons.checkmark_alt_circle_fill,
      pack: 'cupertino'),
  'checkmark_circle': IconChoice(
      name: 'checkmark_circle',
      data: CupertinoIcons.checkmark_circle,
      pack: 'cupertino'),
  'checkmark_circle_fill': IconChoice(
      name: 'checkmark_circle_fill',
      data: CupertinoIcons.checkmark_circle_fill,
      pack: 'cupertino'),
  'checkmark_rectangle': IconChoice(
      name: 'checkmark_rectangle',
      data: CupertinoIcons.checkmark_rectangle,
      pack: 'cupertino'),
  'checkmark_rectangle_fill': IconChoice(
      name: 'checkmark_rectangle_fill',
      data: CupertinoIcons.checkmark_rectangle_fill,
      pack: 'cupertino'),
  'checkmark_seal': IconChoice(
      name: 'checkmark_seal',
      data: CupertinoIcons.checkmark_seal,
      pack: 'cupertino'),
  'checkmark_seal_fill': IconChoice(
      name: 'checkmark_seal_fill',
      data: CupertinoIcons.checkmark_seal_fill,
      pack: 'cupertino'),
  'checkmark_shield': IconChoice(
      name: 'checkmark_shield',
      data: CupertinoIcons.checkmark_shield,
      pack: 'cupertino'),
  'checkmark_shield_fill': IconChoice(
      name: 'checkmark_shield_fill',
      data: CupertinoIcons.checkmark_shield_fill,
      pack: 'cupertino'),
  'checkmark_square': IconChoice(
      name: 'checkmark_square',
      data: CupertinoIcons.checkmark_square,
      pack: 'cupertino'),
  'checkmark_square_fill': IconChoice(
      name: 'checkmark_square_fill',
      data: CupertinoIcons.checkmark_square_fill,
      pack: 'cupertino'),
  'chevron_back': IconChoice(
      name: 'chevron_back',
      data: CupertinoIcons.chevron_back,
      pack: 'cupertino'),
  'chevron_compact_down': IconChoice(
      name: 'chevron_compact_down',
      data: CupertinoIcons.chevron_compact_down,
      pack: 'cupertino'),
  'chevron_compact_left': IconChoice(
      name: 'chevron_compact_left',
      data: CupertinoIcons.chevron_compact_left,
      pack: 'cupertino'),
  'chevron_compact_right': IconChoice(
      name: 'chevron_compact_right',
      data: CupertinoIcons.chevron_compact_right,
      pack: 'cupertino'),
  'chevron_compact_up': IconChoice(
      name: 'chevron_compact_up',
      data: CupertinoIcons.chevron_compact_up,
      pack: 'cupertino'),
  'chevron_down': IconChoice(
      name: 'chevron_down',
      data: CupertinoIcons.chevron_down,
      pack: 'cupertino'),
  'chevron_down_circle': IconChoice(
      name: 'chevron_down_circle',
      data: CupertinoIcons.chevron_down_circle,
      pack: 'cupertino'),
  'chevron_down_circle_fill': IconChoice(
      name: 'chevron_down_circle_fill',
      data: CupertinoIcons.chevron_down_circle_fill,
      pack: 'cupertino'),
  'chevron_down_square': IconChoice(
      name: 'chevron_down_square',
      data: CupertinoIcons.chevron_down_square,
      pack: 'cupertino'),
  'chevron_down_square_fill': IconChoice(
      name: 'chevron_down_square_fill',
      data: CupertinoIcons.chevron_down_square_fill,
      pack: 'cupertino'),
  'chevron_forward': IconChoice(
      name: 'chevron_forward',
      data: CupertinoIcons.chevron_forward,
      pack: 'cupertino'),
  'chevron_left': IconChoice(
      name: 'chevron_left',
      data: CupertinoIcons.chevron_left,
      pack: 'cupertino'),
  'chevron_left_2': IconChoice(
      name: 'chevron_left_2',
      data: CupertinoIcons.chevron_left_2,
      pack: 'cupertino'),
  'chevron_left_circle': IconChoice(
      name: 'chevron_left_circle',
      data: CupertinoIcons.chevron_left_circle,
      pack: 'cupertino'),
  'chevron_left_circle_fill': IconChoice(
      name: 'chevron_left_circle_fill',
      data: CupertinoIcons.chevron_left_circle_fill,
      pack: 'cupertino'),
  'chevron_left_slash_chevron_right': IconChoice(
      name: 'chevron_left_slash_chevron_right',
      data: CupertinoIcons.chevron_left_slash_chevron_right,
      pack: 'cupertino'),
  'chevron_left_square': IconChoice(
      name: 'chevron_left_square',
      data: CupertinoIcons.chevron_left_square,
      pack: 'cupertino'),
  'chevron_left_square_fill': IconChoice(
      name: 'chevron_left_square_fill',
      data: CupertinoIcons.chevron_left_square_fill,
      pack: 'cupertino'),
  'chevron_right': IconChoice(
      name: 'chevron_right',
      data: CupertinoIcons.chevron_right,
      pack: 'cupertino'),
  'chevron_right_2': IconChoice(
      name: 'chevron_right_2',
      data: CupertinoIcons.chevron_right_2,
      pack: 'cupertino'),
  'chevron_right_circle': IconChoice(
      name: 'chevron_right_circle',
      data: CupertinoIcons.chevron_right_circle,
      pack: 'cupertino'),
  'chevron_right_circle_fill': IconChoice(
      name: 'chevron_right_circle_fill',
      data: CupertinoIcons.chevron_right_circle_fill,
      pack: 'cupertino'),
  'chevron_right_square': IconChoice(
      name: 'chevron_right_square',
      data: CupertinoIcons.chevron_right_square,
      pack: 'cupertino'),
  'chevron_right_square_fill': IconChoice(
      name: 'chevron_right_square_fill',
      data: CupertinoIcons.chevron_right_square_fill,
      pack: 'cupertino'),
  'chevron_up': IconChoice(
      name: 'chevron_up', data: CupertinoIcons.chevron_up, pack: 'cupertino'),
  'chevron_up_chevron_down': IconChoice(
      name: 'chevron_up_chevron_down',
      data: CupertinoIcons.chevron_up_chevron_down,
      pack: 'cupertino'),
  'chevron_up_circle': IconChoice(
      name: 'chevron_up_circle',
      data: CupertinoIcons.chevron_up_circle,
      pack: 'cupertino'),
  'chevron_up_circle_fill': IconChoice(
      name: 'chevron_up_circle_fill',
      data: CupertinoIcons.chevron_up_circle_fill,
      pack: 'cupertino'),
  'chevron_up_square': IconChoice(
      name: 'chevron_up_square',
      data: CupertinoIcons.chevron_up_square,
      pack: 'cupertino'),
  'chevron_up_square_fill': IconChoice(
      name: 'chevron_up_square_fill',
      data: CupertinoIcons.chevron_up_square_fill,
      pack: 'cupertino'),
  'circle_bottomthird_split': IconChoice(
      name: 'circle_bottomthird_split',
      data: CupertinoIcons.circle_bottomthird_split,
      pack: 'cupertino'),
  'circle_fill': IconChoice(
      name: 'circle_fill', data: CupertinoIcons.circle_fill, pack: 'cupertino'),
  'circle_grid_3x3': IconChoice(
      name: 'circle_grid_3x3',
      data: CupertinoIcons.circle_grid_3x3,
      pack: 'cupertino'),
  'circle_grid_3x3_fill': IconChoice(
      name: 'circle_grid_3x3_fill',
      data: CupertinoIcons.circle_grid_3x3_fill,
      pack: 'cupertino'),
  'circle_grid_hex': IconChoice(
      name: 'circle_grid_hex',
      data: CupertinoIcons.circle_grid_hex,
      pack: 'cupertino'),
  'circle_grid_hex_fill': IconChoice(
      name: 'circle_grid_hex_fill',
      data: CupertinoIcons.circle_grid_hex_fill,
      pack: 'cupertino'),
  'circle_lefthalf_fill': IconChoice(
      name: 'circle_lefthalf_fill',
      data: CupertinoIcons.circle_lefthalf_fill,
      pack: 'cupertino'),
  'circle_righthalf_fill': IconChoice(
      name: 'circle_righthalf_fill',
      data: CupertinoIcons.circle_righthalf_fill,
      pack: 'cupertino'),
  'clear_fill': IconChoice(
      name: 'clear_fill', data: CupertinoIcons.clear_fill, pack: 'cupertino'),
  'clock_fill': IconChoice(
      name: 'clock_fill', data: CupertinoIcons.clock_fill, pack: 'cupertino'),
  'cloud': IconChoice(
      name: 'cloud', data: CupertinoIcons.cloud, pack: 'cupertino'),
  'cloud_bolt': IconChoice(
      name: 'cloud_bolt', data: CupertinoIcons.cloud_bolt, pack: 'cupertino'),
  'cloud_bolt_fill': IconChoice(
      name: 'cloud_bolt_fill',
      data: CupertinoIcons.cloud_bolt_fill,
      pack: 'cupertino'),
  'cloud_bolt_rain': IconChoice(
      name: 'cloud_bolt_rain',
      data: CupertinoIcons.cloud_bolt_rain,
      pack: 'cupertino'),
  'cloud_bolt_rain_fill': IconChoice(
      name: 'cloud_bolt_rain_fill',
      data: CupertinoIcons.cloud_bolt_rain_fill,
      pack: 'cupertino'),
  'cloud_download': IconChoice(
      name: 'cloud_download',
      data: CupertinoIcons.cloud_download,
      pack: 'cupertino'),
  'cloud_download_fill': IconChoice(
      name: 'cloud_download_fill',
      data: CupertinoIcons.cloud_download_fill,
      pack: 'cupertino'),
  'cloud_drizzle': IconChoice(
      name: 'cloud_drizzle',
      data: CupertinoIcons.cloud_drizzle,
      pack: 'cupertino'),
  'cloud_drizzle_fill': IconChoice(
      name: 'cloud_drizzle_fill',
      data: CupertinoIcons.cloud_drizzle_fill,
      pack: 'cupertino'),
  'cloud_fill': IconChoice(
      name: 'cloud_fill', data: CupertinoIcons.cloud_fill, pack: 'cupertino'),
  'cloud_fog': IconChoice(
      name: 'cloud_fog', data: CupertinoIcons.cloud_fog, pack: 'cupertino'),
  'cloud_fog_fill': IconChoice(
      name: 'cloud_fog_fill',
      data: CupertinoIcons.cloud_fog_fill,
      pack: 'cupertino'),
  'cloud_hail': IconChoice(
      name: 'cloud_hail', data: CupertinoIcons.cloud_hail, pack: 'cupertino'),
  'cloud_hail_fill': IconChoice(
      name: 'cloud_hail_fill',
      data: CupertinoIcons.cloud_hail_fill,
      pack: 'cupertino'),
  'cloud_heavyrain': IconChoice(
      name: 'cloud_heavyrain',
      data: CupertinoIcons.cloud_heavyrain,
      pack: 'cupertino'),
  'cloud_heavyrain_fill': IconChoice(
      name: 'cloud_heavyrain_fill',
      data: CupertinoIcons.cloud_heavyrain_fill,
      pack: 'cupertino'),
  'cloud_moon': IconChoice(
      name: 'cloud_moon', data: CupertinoIcons.cloud_moon, pack: 'cupertino'),
  'cloud_moon_bolt': IconChoice(
      name: 'cloud_moon_bolt',
      data: CupertinoIcons.cloud_moon_bolt,
      pack: 'cupertino'),
  'cloud_moon_bolt_fill': IconChoice(
      name: 'cloud_moon_bolt_fill',
      data: CupertinoIcons.cloud_moon_bolt_fill,
      pack: 'cupertino'),
  'cloud_moon_fill': IconChoice(
      name: 'cloud_moon_fill',
      data: CupertinoIcons.cloud_moon_fill,
      pack: 'cupertino'),
  'cloud_moon_rain': IconChoice(
      name: 'cloud_moon_rain',
      data: CupertinoIcons.cloud_moon_rain,
      pack: 'cupertino'),
  'cloud_moon_rain_fill': IconChoice(
      name: 'cloud_moon_rain_fill',
      data: CupertinoIcons.cloud_moon_rain_fill,
      pack: 'cupertino'),
  'cloud_rain': IconChoice(
      name: 'cloud_rain', data: CupertinoIcons.cloud_rain, pack: 'cupertino'),
  'cloud_rain_fill': IconChoice(
      name: 'cloud_rain_fill',
      data: CupertinoIcons.cloud_rain_fill,
      pack: 'cupertino'),
  'cloud_sleet': IconChoice(
      name: 'cloud_sleet', data: CupertinoIcons.cloud_sleet, pack: 'cupertino'),
  'cloud_sleet_fill': IconChoice(
      name: 'cloud_sleet_fill',
      data: CupertinoIcons.cloud_sleet_fill,
      pack: 'cupertino'),
  'cloud_snow': IconChoice(
      name: 'cloud_snow', data: CupertinoIcons.cloud_snow, pack: 'cupertino'),
  'cloud_snow_fill': IconChoice(
      name: 'cloud_snow_fill',
      data: CupertinoIcons.cloud_snow_fill,
      pack: 'cupertino'),
  'cloud_sun': IconChoice(
      name: 'cloud_sun', data: CupertinoIcons.cloud_sun, pack: 'cupertino'),
  'cloud_sun_bolt': IconChoice(
      name: 'cloud_sun_bolt',
      data: CupertinoIcons.cloud_sun_bolt,
      pack: 'cupertino'),
  'cloud_sun_bolt_fill': IconChoice(
      name: 'cloud_sun_bolt_fill',
      data: CupertinoIcons.cloud_sun_bolt_fill,
      pack: 'cupertino'),
  'cloud_sun_fill': IconChoice(
      name: 'cloud_sun_fill',
      data: CupertinoIcons.cloud_sun_fill,
      pack: 'cupertino'),
  'cloud_sun_rain': IconChoice(
      name: 'cloud_sun_rain',
      data: CupertinoIcons.cloud_sun_rain,
      pack: 'cupertino'),
  'cloud_sun_rain_fill': IconChoice(
      name: 'cloud_sun_rain_fill',
      data: CupertinoIcons.cloud_sun_rain_fill,
      pack: 'cupertino'),
  'cloud_upload': IconChoice(
      name: 'cloud_upload',
      data: CupertinoIcons.cloud_upload,
      pack: 'cupertino'),
  'cloud_upload_fill': IconChoice(
      name: 'cloud_upload_fill',
      data: CupertinoIcons.cloud_upload_fill,
      pack: 'cupertino'),
  'color_filter': IconChoice(
      name: 'color_filter',
      data: CupertinoIcons.color_filter,
      pack: 'cupertino'),
  'color_filter_fill': IconChoice(
      name: 'color_filter_fill',
      data: CupertinoIcons.color_filter_fill,
      pack: 'cupertino'),
  'command': IconChoice(
      name: 'command', data: CupertinoIcons.command, pack: 'cupertino'),
  'compass': IconChoice(
      name: 'compass', data: CupertinoIcons.compass, pack: 'cupertino'),
  'compass_fill': IconChoice(
      name: 'compass_fill',
      data: CupertinoIcons.compass_fill,
      pack: 'cupertino'),
  'control': IconChoice(
      name: 'control', data: CupertinoIcons.control, pack: 'cupertino'),
  'creditcard': IconChoice(
      name: 'creditcard', data: CupertinoIcons.creditcard, pack: 'cupertino'),
  'creditcard_fill': IconChoice(
      name: 'creditcard_fill',
      data: CupertinoIcons.creditcard_fill,
      pack: 'cupertino'),
  'crop': IconChoice(
      name: 'crop', data: CupertinoIcons.crop, pack: 'cupertino'),
  'crop_rotate': IconChoice(
      name: 'crop_rotate', data: CupertinoIcons.crop_rotate, pack: 'cupertino'),
  'cube': IconChoice(
      name: 'cube', data: CupertinoIcons.cube, pack: 'cupertino'),
  'cube_box': IconChoice(
      name: 'cube_box', data: CupertinoIcons.cube_box, pack: 'cupertino'),
  'cube_box_fill': IconChoice(
      name: 'cube_box_fill',
      data: CupertinoIcons.cube_box_fill,
      pack: 'cupertino'),
  'cube_fill': IconChoice(
      name: 'cube_fill', data: CupertinoIcons.cube_fill, pack: 'cupertino'),
  'cursor_rays': IconChoice(
      name: 'cursor_rays', data: CupertinoIcons.cursor_rays, pack: 'cupertino'),
  'decrease_indent': IconChoice(
      name: 'decrease_indent',
      data: CupertinoIcons.decrease_indent,
      pack: 'cupertino'),
  'decrease_quotelevel': IconChoice(
      name: 'decrease_quotelevel',
      data: CupertinoIcons.decrease_quotelevel,
      pack: 'cupertino'),
  'delete_left': IconChoice(
      name: 'delete_left', data: CupertinoIcons.delete_left, pack: 'cupertino'),
  'delete_left_fill': IconChoice(
      name: 'delete_left_fill',
      data: CupertinoIcons.delete_left_fill,
      pack: 'cupertino'),
  'delete_right': IconChoice(
      name: 'delete_right',
      data: CupertinoIcons.delete_right,
      pack: 'cupertino'),
  'delete_right_fill': IconChoice(
      name: 'delete_right_fill',
      data: CupertinoIcons.delete_right_fill,
      pack: 'cupertino'),
  'desktopcomputer': IconChoice(
      name: 'desktopcomputer',
      data: CupertinoIcons.desktopcomputer,
      pack: 'cupertino'),
  'device_desktop': IconChoice(
      name: 'device_desktop',
      data: CupertinoIcons.device_desktop,
      pack: 'cupertino'),
  'device_laptop': IconChoice(
      name: 'device_laptop',
      data: CupertinoIcons.device_laptop,
      pack: 'cupertino'),
  'device_phone_landscape': IconChoice(
      name: 'device_phone_landscape',
      data: CupertinoIcons.device_phone_landscape,
      pack: 'cupertino'),
  'device_phone_portrait': IconChoice(
      name: 'device_phone_portrait',
      data: CupertinoIcons.device_phone_portrait,
      pack: 'cupertino'),
  'dial': IconChoice(
      name: 'dial', data: CupertinoIcons.dial, pack: 'cupertino'),
  'dial_fill': IconChoice(
      name: 'dial_fill', data: CupertinoIcons.dial_fill, pack: 'cupertino'),
  'divide': IconChoice(
      name: 'divide', data: CupertinoIcons.divide, pack: 'cupertino'),
  'divide_circle': IconChoice(
      name: 'divide_circle',
      data: CupertinoIcons.divide_circle,
      pack: 'cupertino'),
  'divide_circle_fill': IconChoice(
      name: 'divide_circle_fill',
      data: CupertinoIcons.divide_circle_fill,
      pack: 'cupertino'),
  'divide_square': IconChoice(
      name: 'divide_square',
      data: CupertinoIcons.divide_square,
      pack: 'cupertino'),
  'divide_square_fill': IconChoice(
      name: 'divide_square_fill',
      data: CupertinoIcons.divide_square_fill,
      pack: 'cupertino'),
  'doc':
      IconChoice(name: 'doc', data: CupertinoIcons.doc, pack: 'cupertino'),
  'doc_append': IconChoice(
      name: 'doc_append', data: CupertinoIcons.doc_append, pack: 'cupertino'),
  'doc_chart': IconChoice(
      name: 'doc_chart', data: CupertinoIcons.doc_chart, pack: 'cupertino'),
  'doc_chart_fill': IconChoice(
      name: 'doc_chart_fill',
      data: CupertinoIcons.doc_chart_fill,
      pack: 'cupertino'),
  'doc_checkmark': IconChoice(
      name: 'doc_checkmark',
      data: CupertinoIcons.doc_checkmark,
      pack: 'cupertino'),
  'doc_checkmark_fill': IconChoice(
      name: 'doc_checkmark_fill',
      data: CupertinoIcons.doc_checkmark_fill,
      pack: 'cupertino'),
  'doc_circle': IconChoice(
      name: 'doc_circle', data: CupertinoIcons.doc_circle, pack: 'cupertino'),
  'doc_circle_fill': IconChoice(
      name: 'doc_circle_fill',
      data: CupertinoIcons.doc_circle_fill,
      pack: 'cupertino'),
  'doc_fill': IconChoice(
      name: 'doc_fill', data: CupertinoIcons.doc_fill, pack: 'cupertino'),
  'doc_on_clipboard': IconChoice(
      name: 'doc_on_clipboard',
      data: CupertinoIcons.doc_on_clipboard,
      pack: 'cupertino'),
  'doc_on_clipboard_fill': IconChoice(
      name: 'doc_on_clipboard_fill',
      data: CupertinoIcons.doc_on_clipboard_fill,
      pack: 'cupertino'),
  'doc_on_doc': IconChoice(
      name: 'doc_on_doc', data: CupertinoIcons.doc_on_doc, pack: 'cupertino'),
  'doc_on_doc_fill': IconChoice(
      name: 'doc_on_doc_fill',
      data: CupertinoIcons.doc_on_doc_fill,
      pack: 'cupertino'),
  'doc_person': IconChoice(
      name: 'doc_person', data: CupertinoIcons.doc_person, pack: 'cupertino'),
  'doc_person_fill': IconChoice(
      name: 'doc_person_fill',
      data: CupertinoIcons.doc_person_fill,
      pack: 'cupertino'),
  'doc_plaintext': IconChoice(
      name: 'doc_plaintext',
      data: CupertinoIcons.doc_plaintext,
      pack: 'cupertino'),
  'doc_richtext': IconChoice(
      name: 'doc_richtext',
      data: CupertinoIcons.doc_richtext,
      pack: 'cupertino'),
  'doc_text': IconChoice(
      name: 'doc_text', data: CupertinoIcons.doc_text, pack: 'cupertino'),
  'doc_text_fill': IconChoice(
      name: 'doc_text_fill',
      data: CupertinoIcons.doc_text_fill,
      pack: 'cupertino'),
  'doc_text_search': IconChoice(
      name: 'doc_text_search',
      data: CupertinoIcons.doc_text_search,
      pack: 'cupertino'),
  'doc_text_viewfinder': IconChoice(
      name: 'doc_text_viewfinder',
      data: CupertinoIcons.doc_text_viewfinder,
      pack: 'cupertino'),
  'dot_radiowaves_left_right': IconChoice(
      name: 'dot_radiowaves_left_right',
      data: CupertinoIcons.dot_radiowaves_left_right,
      pack: 'cupertino'),
  'dot_radiowaves_right': IconChoice(
      name: 'dot_radiowaves_right',
      data: CupertinoIcons.dot_radiowaves_right,
      pack: 'cupertino'),
  'dot_square': IconChoice(
      name: 'dot_square', data: CupertinoIcons.dot_square, pack: 'cupertino'),
  'dot_square_fill': IconChoice(
      name: 'dot_square_fill',
      data: CupertinoIcons.dot_square_fill,
      pack: 'cupertino'),
  'download_circle': IconChoice(
      name: 'download_circle',
      data: CupertinoIcons.download_circle,
      pack: 'cupertino'),
  'download_circle_fill': IconChoice(
      name: 'download_circle_fill',
      data: CupertinoIcons.download_circle_fill,
      pack: 'cupertino'),
  'drop': IconChoice(
      name: 'drop', data: CupertinoIcons.drop, pack: 'cupertino'),
  'drop_fill': IconChoice(
      name: 'drop_fill', data: CupertinoIcons.drop_fill, pack: 'cupertino'),
  'drop_triangle': IconChoice(
      name: 'drop_triangle',
      data: CupertinoIcons.drop_triangle,
      pack: 'cupertino'),
  'drop_triangle_fill': IconChoice(
      name: 'drop_triangle_fill',
      data: CupertinoIcons.drop_triangle_fill,
      pack: 'cupertino'),
  'ear':
      IconChoice(name: 'ear', data: CupertinoIcons.ear, pack: 'cupertino'),
  'eject': IconChoice(
      name: 'eject', data: CupertinoIcons.eject, pack: 'cupertino'),
  'eject_fill': IconChoice(
      name: 'eject_fill', data: CupertinoIcons.eject_fill, pack: 'cupertino'),
  'ellipses_bubble': IconChoice(
      name: 'ellipses_bubble',
      data: CupertinoIcons.ellipses_bubble,
      pack: 'cupertino'),
  'ellipses_bubble_fill': IconChoice(
      name: 'ellipses_bubble_fill',
      data: CupertinoIcons.ellipses_bubble_fill,
      pack: 'cupertino'),
  'ellipsis_circle': IconChoice(
      name: 'ellipsis_circle',
      data: CupertinoIcons.ellipsis_circle,
      pack: 'cupertino'),
  'ellipsis_circle_fill': IconChoice(
      name: 'ellipsis_circle_fill',
      data: CupertinoIcons.ellipsis_circle_fill,
      pack: 'cupertino'),
  'ellipsis_vertical': IconChoice(
      name: 'ellipsis_vertical',
      data: CupertinoIcons.ellipsis_vertical,
      pack: 'cupertino'),
  'ellipsis_vertical_circle': IconChoice(
      name: 'ellipsis_vertical_circle',
      data: CupertinoIcons.ellipsis_vertical_circle,
      pack: 'cupertino'),
  'ellipsis_vertical_circle_fill': IconChoice(
      name: 'ellipsis_vertical_circle_fill',
      data: CupertinoIcons.ellipsis_vertical_circle_fill,
      pack: 'cupertino'),
  'envelope': IconChoice(
      name: 'envelope', data: CupertinoIcons.envelope, pack: 'cupertino'),
  'envelope_badge': IconChoice(
      name: 'envelope_badge',
      data: CupertinoIcons.envelope_badge,
      pack: 'cupertino'),
  'envelope_badge_fill': IconChoice(
      name: 'envelope_badge_fill',
      data: CupertinoIcons.envelope_badge_fill,
      pack: 'cupertino'),
  'envelope_circle': IconChoice(
      name: 'envelope_circle',
      data: CupertinoIcons.envelope_circle,
      pack: 'cupertino'),
  'envelope_circle_fill': IconChoice(
      name: 'envelope_circle_fill',
      data: CupertinoIcons.envelope_circle_fill,
      pack: 'cupertino'),
  'envelope_fill': IconChoice(
      name: 'envelope_fill',
      data: CupertinoIcons.envelope_fill,
      pack: 'cupertino'),
  'envelope_open': IconChoice(
      name: 'envelope_open',
      data: CupertinoIcons.envelope_open,
      pack: 'cupertino'),
  'envelope_open_fill': IconChoice(
      name: 'envelope_open_fill',
      data: CupertinoIcons.envelope_open_fill,
      pack: 'cupertino'),
  'equal': IconChoice(
      name: 'equal', data: CupertinoIcons.equal, pack: 'cupertino'),
  'equal_circle': IconChoice(
      name: 'equal_circle',
      data: CupertinoIcons.equal_circle,
      pack: 'cupertino'),
  'equal_circle_fill': IconChoice(
      name: 'equal_circle_fill',
      data: CupertinoIcons.equal_circle_fill,
      pack: 'cupertino'),
  'equal_square': IconChoice(
      name: 'equal_square',
      data: CupertinoIcons.equal_square,
      pack: 'cupertino'),
  'equal_square_fill': IconChoice(
      name: 'equal_square_fill',
      data: CupertinoIcons.equal_square_fill,
      pack: 'cupertino'),
  'escape': IconChoice(
      name: 'escape', data: CupertinoIcons.escape, pack: 'cupertino'),
  'exclamationmark': IconChoice(
      name: 'exclamationmark',
      data: CupertinoIcons.exclamationmark,
      pack: 'cupertino'),
  'exclamationmark_bubble': IconChoice(
      name: 'exclamationmark_bubble',
      data: CupertinoIcons.exclamationmark_bubble,
      pack: 'cupertino'),
  'exclamationmark_bubble_fill': IconChoice(
      name: 'exclamationmark_bubble_fill',
      data: CupertinoIcons.exclamationmark_bubble_fill,
      pack: 'cupertino'),
  'exclamationmark_circle': IconChoice(
      name: 'exclamationmark_circle',
      data: CupertinoIcons.exclamationmark_circle,
      pack: 'cupertino'),
  'exclamationmark_circle_fill': IconChoice(
      name: 'exclamationmark_circle_fill',
      data: CupertinoIcons.exclamationmark_circle_fill,
      pack: 'cupertino'),
  'exclamationmark_octagon': IconChoice(
      name: 'exclamationmark_octagon',
      data: CupertinoIcons.exclamationmark_octagon,
      pack: 'cupertino'),
  'exclamationmark_octagon_fill': IconChoice(
      name: 'exclamationmark_octagon_fill',
      data: CupertinoIcons.exclamationmark_octagon_fill,
      pack: 'cupertino'),
  'exclamationmark_shield': IconChoice(
      name: 'exclamationmark_shield',
      data: CupertinoIcons.exclamationmark_shield,
      pack: 'cupertino'),
  'exclamationmark_shield_fill': IconChoice(
      name: 'exclamationmark_shield_fill',
      data: CupertinoIcons.exclamationmark_shield_fill,
      pack: 'cupertino'),
  'exclamationmark_square': IconChoice(
      name: 'exclamationmark_square',
      data: CupertinoIcons.exclamationmark_square,
      pack: 'cupertino'),
  'exclamationmark_square_fill': IconChoice(
      name: 'exclamationmark_square_fill',
      data: CupertinoIcons.exclamationmark_square_fill,
      pack: 'cupertino'),
  'exclamationmark_triangle': IconChoice(
      name: 'exclamationmark_triangle',
      data: CupertinoIcons.exclamationmark_triangle,
      pack: 'cupertino'),
  'exclamationmark_triangle_fill': IconChoice(
      name: 'exclamationmark_triangle_fill',
      data: CupertinoIcons.exclamationmark_triangle_fill,
      pack: 'cupertino'),
  'eye_fill': IconChoice(
      name: 'eye_fill', data: CupertinoIcons.eye_fill, pack: 'cupertino'),
  'eye_slash': IconChoice(
      name: 'eye_slash', data: CupertinoIcons.eye_slash, pack: 'cupertino'),
  'eye_slash_fill': IconChoice(
      name: 'eye_slash_fill',
      data: CupertinoIcons.eye_slash_fill,
      pack: 'cupertino'),
  'eyedropper': IconChoice(
      name: 'eyedropper', data: CupertinoIcons.eyedropper, pack: 'cupertino'),
  'eyedropper_full': IconChoice(
      name: 'eyedropper_full',
      data: CupertinoIcons.eyedropper_full,
      pack: 'cupertino'),
  'eyedropper_halffull': IconChoice(
      name: 'eyedropper_halffull',
      data: CupertinoIcons.eyedropper_halffull,
      pack: 'cupertino'),
  'eyeglasses': IconChoice(
      name: 'eyeglasses', data: CupertinoIcons.eyeglasses, pack: 'cupertino'),
  'f_cursive': IconChoice(
      name: 'f_cursive', data: CupertinoIcons.f_cursive, pack: 'cupertino'),
  'f_cursive_circle': IconChoice(
      name: 'f_cursive_circle',
      data: CupertinoIcons.f_cursive_circle,
      pack: 'cupertino'),
  'f_cursive_circle_fill': IconChoice(
      name: 'f_cursive_circle_fill',
      data: CupertinoIcons.f_cursive_circle_fill,
      pack: 'cupertino'),
  'film': IconChoice(
      name: 'film', data: CupertinoIcons.film, pack: 'cupertino'),
  'film_fill': IconChoice(
      name: 'film_fill', data: CupertinoIcons.film_fill, pack: 'cupertino'),
  'flag_circle': IconChoice(
      name: 'flag_circle', data: CupertinoIcons.flag_circle, pack: 'cupertino'),
  'flag_circle_fill': IconChoice(
      name: 'flag_circle_fill',
      data: CupertinoIcons.flag_circle_fill,
      pack: 'cupertino'),
  'flag_fill': IconChoice(
      name: 'flag_fill', data: CupertinoIcons.flag_fill, pack: 'cupertino'),
  'flag_slash': IconChoice(
      name: 'flag_slash', data: CupertinoIcons.flag_slash, pack: 'cupertino'),
  'flag_slash_fill': IconChoice(
      name: 'flag_slash_fill',
      data: CupertinoIcons.flag_slash_fill,
      pack: 'cupertino'),
  'flame': IconChoice(
      name: 'flame', data: CupertinoIcons.flame, pack: 'cupertino'),
  'flame_fill': IconChoice(
      name: 'flame_fill', data: CupertinoIcons.flame_fill, pack: 'cupertino'),
  'floppy_disk': IconChoice(
      name: 'floppy_disk', data: CupertinoIcons.floppy_disk, pack: 'cupertino'),
  'flowchart': IconChoice(
      name: 'flowchart', data: CupertinoIcons.flowchart, pack: 'cupertino'),
  'flowchart_fill': IconChoice(
      name: 'flowchart_fill',
      data: CupertinoIcons.flowchart_fill,
      pack: 'cupertino'),
  'folder_badge_minus': IconChoice(
      name: 'folder_badge_minus',
      data: CupertinoIcons.folder_badge_minus,
      pack: 'cupertino'),
  'folder_badge_person_crop': IconChoice(
      name: 'folder_badge_person_crop',
      data: CupertinoIcons.folder_badge_person_crop,
      pack: 'cupertino'),
  'folder_badge_plus': IconChoice(
      name: 'folder_badge_plus',
      data: CupertinoIcons.folder_badge_plus,
      pack: 'cupertino'),
  'folder_circle': IconChoice(
      name: 'folder_circle',
      data: CupertinoIcons.folder_circle,
      pack: 'cupertino'),
  'folder_circle_fill': IconChoice(
      name: 'folder_circle_fill',
      data: CupertinoIcons.folder_circle_fill,
      pack: 'cupertino'),
  'folder_fill': IconChoice(
      name: 'folder_fill', data: CupertinoIcons.folder_fill, pack: 'cupertino'),
  'folder_fill_badge_minus': IconChoice(
      name: 'folder_fill_badge_minus',
      data: CupertinoIcons.folder_fill_badge_minus,
      pack: 'cupertino'),
  'folder_fill_badge_person_crop': IconChoice(
      name: 'folder_fill_badge_person_crop',
      data: CupertinoIcons.folder_fill_badge_person_crop,
      pack: 'cupertino'),
  'folder_fill_badge_plus': IconChoice(
      name: 'folder_fill_badge_plus',
      data: CupertinoIcons.folder_fill_badge_plus,
      pack: 'cupertino'),
  'forward_end': IconChoice(
      name: 'forward_end', data: CupertinoIcons.forward_end, pack: 'cupertino'),
  'forward_end_alt': IconChoice(
      name: 'forward_end_alt',
      data: CupertinoIcons.forward_end_alt,
      pack: 'cupertino'),
  'forward_end_alt_fill': IconChoice(
      name: 'forward_end_alt_fill',
      data: CupertinoIcons.forward_end_alt_fill,
      pack: 'cupertino'),
  'forward_end_fill': IconChoice(
      name: 'forward_end_fill',
      data: CupertinoIcons.forward_end_fill,
      pack: 'cupertino'),
  'forward_fill': IconChoice(
      name: 'forward_fill',
      data: CupertinoIcons.forward_fill,
      pack: 'cupertino'),
  'function': IconChoice(
      name: 'function', data: CupertinoIcons.function, pack: 'cupertino'),
  'fx': IconChoice(name: 'fx', data: CupertinoIcons.fx, pack: 'cupertino'),
  'gamecontroller': IconChoice(
      name: 'gamecontroller',
      data: CupertinoIcons.gamecontroller,
      pack: 'cupertino'),
  'gamecontroller_alt_fill': IconChoice(
      name: 'gamecontroller_alt_fill',
      data: CupertinoIcons.gamecontroller_alt_fill,
      pack: 'cupertino'),
  'gamecontroller_fill': IconChoice(
      name: 'gamecontroller_fill',
      data: CupertinoIcons.gamecontroller_fill,
      pack: 'cupertino'),
  'gauge': IconChoice(
      name: 'gauge', data: CupertinoIcons.gauge, pack: 'cupertino'),
  'gauge_badge_minus': IconChoice(
      name: 'gauge_badge_minus',
      data: CupertinoIcons.gauge_badge_minus,
      pack: 'cupertino'),
  'gauge_badge_plus': IconChoice(
      name: 'gauge_badge_plus',
      data: CupertinoIcons.gauge_badge_plus,
      pack: 'cupertino'),
  'gear_alt': IconChoice(
      name: 'gear_alt', data: CupertinoIcons.gear_alt, pack: 'cupertino'),
  'gear_alt_fill': IconChoice(
      name: 'gear_alt_fill',
      data: CupertinoIcons.gear_alt_fill,
      pack: 'cupertino'),
  'gift': IconChoice(
      name: 'gift', data: CupertinoIcons.gift, pack: 'cupertino'),
  'gift_alt': IconChoice(
      name: 'gift_alt', data: CupertinoIcons.gift_alt, pack: 'cupertino'),
  'gift_alt_fill': IconChoice(
      name: 'gift_alt_fill',
      data: CupertinoIcons.gift_alt_fill,
      pack: 'cupertino'),
  'gift_fill': IconChoice(
      name: 'gift_fill', data: CupertinoIcons.gift_fill, pack: 'cupertino'),
  'globe': IconChoice(
      name: 'globe', data: CupertinoIcons.globe, pack: 'cupertino'),
  'gobackward': IconChoice(
      name: 'gobackward', data: CupertinoIcons.gobackward, pack: 'cupertino'),
  'gobackward_10': IconChoice(
      name: 'gobackward_10',
      data: CupertinoIcons.gobackward_10,
      pack: 'cupertino'),
  'gobackward_15': IconChoice(
      name: 'gobackward_15',
      data: CupertinoIcons.gobackward_15,
      pack: 'cupertino'),
  'gobackward_30': IconChoice(
      name: 'gobackward_30',
      data: CupertinoIcons.gobackward_30,
      pack: 'cupertino'),
  'gobackward_45': IconChoice(
      name: 'gobackward_45',
      data: CupertinoIcons.gobackward_45,
      pack: 'cupertino'),
  'gobackward_60': IconChoice(
      name: 'gobackward_60',
      data: CupertinoIcons.gobackward_60,
      pack: 'cupertino'),
  'gobackward_75': IconChoice(
      name: 'gobackward_75',
      data: CupertinoIcons.gobackward_75,
      pack: 'cupertino'),
  'gobackward_90': IconChoice(
      name: 'gobackward_90',
      data: CupertinoIcons.gobackward_90,
      pack: 'cupertino'),
  'gobackward_minus': IconChoice(
      name: 'gobackward_minus',
      data: CupertinoIcons.gobackward_minus,
      pack: 'cupertino'),
  'goforward': IconChoice(
      name: 'goforward', data: CupertinoIcons.goforward, pack: 'cupertino'),
  'goforward_10': IconChoice(
      name: 'goforward_10',
      data: CupertinoIcons.goforward_10,
      pack: 'cupertino'),
  'goforward_15': IconChoice(
      name: 'goforward_15',
      data: CupertinoIcons.goforward_15,
      pack: 'cupertino'),
  'goforward_30': IconChoice(
      name: 'goforward_30',
      data: CupertinoIcons.goforward_30,
      pack: 'cupertino'),
  'goforward_45': IconChoice(
      name: 'goforward_45',
      data: CupertinoIcons.goforward_45,
      pack: 'cupertino'),
  'goforward_60': IconChoice(
      name: 'goforward_60',
      data: CupertinoIcons.goforward_60,
      pack: 'cupertino'),
  'goforward_75': IconChoice(
      name: 'goforward_75',
      data: CupertinoIcons.goforward_75,
      pack: 'cupertino'),
  'goforward_90': IconChoice(
      name: 'goforward_90',
      data: CupertinoIcons.goforward_90,
      pack: 'cupertino'),
  'goforward_plus': IconChoice(
      name: 'goforward_plus',
      data: CupertinoIcons.goforward_plus,
      pack: 'cupertino'),
  'graph_circle': IconChoice(
      name: 'graph_circle',
      data: CupertinoIcons.graph_circle,
      pack: 'cupertino'),
  'graph_circle_fill': IconChoice(
      name: 'graph_circle_fill',
      data: CupertinoIcons.graph_circle_fill,
      pack: 'cupertino'),
  'graph_square': IconChoice(
      name: 'graph_square',
      data: CupertinoIcons.graph_square,
      pack: 'cupertino'),
  'graph_square_fill': IconChoice(
      name: 'graph_square_fill',
      data: CupertinoIcons.graph_square_fill,
      pack: 'cupertino'),
  'greaterthan': IconChoice(
      name: 'greaterthan', data: CupertinoIcons.greaterthan, pack: 'cupertino'),
  'greaterthan_circle': IconChoice(
      name: 'greaterthan_circle',
      data: CupertinoIcons.greaterthan_circle,
      pack: 'cupertino'),
  'greaterthan_circle_fill': IconChoice(
      name: 'greaterthan_circle_fill',
      data: CupertinoIcons.greaterthan_circle_fill,
      pack: 'cupertino'),
  'greaterthan_square': IconChoice(
      name: 'greaterthan_square',
      data: CupertinoIcons.greaterthan_square,
      pack: 'cupertino'),
  'greaterthan_square_fill': IconChoice(
      name: 'greaterthan_square_fill',
      data: CupertinoIcons.greaterthan_square_fill,
      pack: 'cupertino'),
  'grid': IconChoice(
      name: 'grid', data: CupertinoIcons.grid, pack: 'cupertino'),
  'grid_circle': IconChoice(
      name: 'grid_circle', data: CupertinoIcons.grid_circle, pack: 'cupertino'),
  'grid_circle_fill': IconChoice(
      name: 'grid_circle_fill',
      data: CupertinoIcons.grid_circle_fill,
      pack: 'cupertino'),
  'guitars': IconChoice(
      name: 'guitars', data: CupertinoIcons.guitars, pack: 'cupertino'),
  'hammer': IconChoice(
      name: 'hammer', data: CupertinoIcons.hammer, pack: 'cupertino'),
  'hammer_fill': IconChoice(
      name: 'hammer_fill', data: CupertinoIcons.hammer_fill, pack: 'cupertino'),
  'hand_draw': IconChoice(
      name: 'hand_draw', data: CupertinoIcons.hand_draw, pack: 'cupertino'),
  'hand_draw_fill': IconChoice(
      name: 'hand_draw_fill',
      data: CupertinoIcons.hand_draw_fill,
      pack: 'cupertino'),
  'hand_point_left': IconChoice(
      name: 'hand_point_left',
      data: CupertinoIcons.hand_point_left,
      pack: 'cupertino'),
  'hand_point_left_fill': IconChoice(
      name: 'hand_point_left_fill',
      data: CupertinoIcons.hand_point_left_fill,
      pack: 'cupertino'),
  'hand_point_right': IconChoice(
      name: 'hand_point_right',
      data: CupertinoIcons.hand_point_right,
      pack: 'cupertino'),
  'hand_point_right_fill': IconChoice(
      name: 'hand_point_right_fill',
      data: CupertinoIcons.hand_point_right_fill,
      pack: 'cupertino'),
  'hand_raised': IconChoice(
      name: 'hand_raised', data: CupertinoIcons.hand_raised, pack: 'cupertino'),
  'hand_raised_fill': IconChoice(
      name: 'hand_raised_fill',
      data: CupertinoIcons.hand_raised_fill,
      pack: 'cupertino'),
  'hand_raised_slash': IconChoice(
      name: 'hand_raised_slash',
      data: CupertinoIcons.hand_raised_slash,
      pack: 'cupertino'),
  'hand_raised_slash_fill': IconChoice(
      name: 'hand_raised_slash_fill',
      data: CupertinoIcons.hand_raised_slash_fill,
      pack: 'cupertino'),
  'hand_thumbsdown': IconChoice(
      name: 'hand_thumbsdown',
      data: CupertinoIcons.hand_thumbsdown,
      pack: 'cupertino'),
  'hand_thumbsdown_fill': IconChoice(
      name: 'hand_thumbsdown_fill',
      data: CupertinoIcons.hand_thumbsdown_fill,
      pack: 'cupertino'),
  'hand_thumbsup': IconChoice(
      name: 'hand_thumbsup',
      data: CupertinoIcons.hand_thumbsup,
      pack: 'cupertino'),
  'hand_thumbsup_fill': IconChoice(
      name: 'hand_thumbsup_fill',
      data: CupertinoIcons.hand_thumbsup_fill,
      pack: 'cupertino'),
  'hare': IconChoice(
      name: 'hare', data: CupertinoIcons.hare, pack: 'cupertino'),
  'hare_fill': IconChoice(
      name: 'hare_fill', data: CupertinoIcons.hare_fill, pack: 'cupertino'),
  'headphones': IconChoice(
      name: 'headphones', data: CupertinoIcons.headphones, pack: 'cupertino'),
  'heart_circle': IconChoice(
      name: 'heart_circle',
      data: CupertinoIcons.heart_circle,
      pack: 'cupertino'),
  'heart_circle_fill': IconChoice(
      name: 'heart_circle_fill',
      data: CupertinoIcons.heart_circle_fill,
      pack: 'cupertino'),
  'heart_fill': IconChoice(
      name: 'heart_fill', data: CupertinoIcons.heart_fill, pack: 'cupertino'),
  'heart_slash': IconChoice(
      name: 'heart_slash', data: CupertinoIcons.heart_slash, pack: 'cupertino'),
  'heart_slash_circle': IconChoice(
      name: 'heart_slash_circle',
      data: CupertinoIcons.heart_slash_circle,
      pack: 'cupertino'),
  'heart_slash_circle_fill': IconChoice(
      name: 'heart_slash_circle_fill',
      data: CupertinoIcons.heart_slash_circle_fill,
      pack: 'cupertino'),
  'heart_slash_fill': IconChoice(
      name: 'heart_slash_fill',
      data: CupertinoIcons.heart_slash_fill,
      pack: 'cupertino'),
  'helm': IconChoice(
      name: 'helm', data: CupertinoIcons.helm, pack: 'cupertino'),
  'hexagon': IconChoice(
      name: 'hexagon', data: CupertinoIcons.hexagon, pack: 'cupertino'),
  'hexagon_fill': IconChoice(
      name: 'hexagon_fill',
      data: CupertinoIcons.hexagon_fill,
      pack: 'cupertino'),
  'hifispeaker': IconChoice(
      name: 'hifispeaker', data: CupertinoIcons.hifispeaker, pack: 'cupertino'),
  'hifispeaker_fill': IconChoice(
      name: 'hifispeaker_fill',
      data: CupertinoIcons.hifispeaker_fill,
      pack: 'cupertino'),
  'hourglass': IconChoice(
      name: 'hourglass', data: CupertinoIcons.hourglass, pack: 'cupertino'),
  'hourglass_bottomhalf_fill': IconChoice(
      name: 'hourglass_bottomhalf_fill',
      data: CupertinoIcons.hourglass_bottomhalf_fill,
      pack: 'cupertino'),
  'hourglass_tophalf_fill': IconChoice(
      name: 'hourglass_tophalf_fill',
      data: CupertinoIcons.hourglass_tophalf_fill,
      pack: 'cupertino'),
  'house': IconChoice(
      name: 'house', data: CupertinoIcons.house, pack: 'cupertino'),
  'house_alt': IconChoice(
      name: 'house_alt', data: CupertinoIcons.house_alt, pack: 'cupertino'),
  'house_alt_fill': IconChoice(
      name: 'house_alt_fill',
      data: CupertinoIcons.house_alt_fill,
      pack: 'cupertino'),
  'house_fill': IconChoice(
      name: 'house_fill', data: CupertinoIcons.house_fill, pack: 'cupertino'),
  'hurricane': IconChoice(
      name: 'hurricane', data: CupertinoIcons.hurricane, pack: 'cupertino'),
  'increase_indent': IconChoice(
      name: 'increase_indent',
      data: CupertinoIcons.increase_indent,
      pack: 'cupertino'),
  'increase_quotelevel': IconChoice(
      name: 'increase_quotelevel',
      data: CupertinoIcons.increase_quotelevel,
      pack: 'cupertino'),
  'infinite': IconChoice(
      name: 'infinite', data: CupertinoIcons.infinite, pack: 'cupertino'),
  'info_circle': IconChoice(
      name: 'info_circle', data: CupertinoIcons.info_circle, pack: 'cupertino'),
  'info_circle_fill': IconChoice(
      name: 'info_circle_fill',
      data: CupertinoIcons.info_circle_fill,
      pack: 'cupertino'),
  'italic': IconChoice(
      name: 'italic', data: CupertinoIcons.italic, pack: 'cupertino'),
  'keyboard': IconChoice(
      name: 'keyboard', data: CupertinoIcons.keyboard, pack: 'cupertino'),
  'keyboard_chevron_compact_down': IconChoice(
      name: 'keyboard_chevron_compact_down',
      data: CupertinoIcons.keyboard_chevron_compact_down,
      pack: 'cupertino'),
  'largecircle_fill_circle': IconChoice(
      name: 'largecircle_fill_circle',
      data: CupertinoIcons.largecircle_fill_circle,
      pack: 'cupertino'),
  'lasso': IconChoice(
      name: 'lasso', data: CupertinoIcons.lasso, pack: 'cupertino'),
  'layers': IconChoice(
      name: 'layers', data: CupertinoIcons.layers, pack: 'cupertino'),
  'layers_alt': IconChoice(
      name: 'layers_alt', data: CupertinoIcons.layers_alt, pack: 'cupertino'),
  'layers_alt_fill': IconChoice(
      name: 'layers_alt_fill',
      data: CupertinoIcons.layers_alt_fill,
      pack: 'cupertino'),
  'layers_fill': IconChoice(
      name: 'layers_fill', data: CupertinoIcons.layers_fill, pack: 'cupertino'),
  'leaf_arrow_circlepath': IconChoice(
      name: 'leaf_arrow_circlepath',
      data: CupertinoIcons.leaf_arrow_circlepath,
      pack: 'cupertino'),
  'lessthan': IconChoice(
      name: 'lessthan', data: CupertinoIcons.lessthan, pack: 'cupertino'),
  'lessthan_circle': IconChoice(
      name: 'lessthan_circle',
      data: CupertinoIcons.lessthan_circle,
      pack: 'cupertino'),
  'lessthan_circle_fill': IconChoice(
      name: 'lessthan_circle_fill',
      data: CupertinoIcons.lessthan_circle_fill,
      pack: 'cupertino'),
  'lessthan_square': IconChoice(
      name: 'lessthan_square',
      data: CupertinoIcons.lessthan_square,
      pack: 'cupertino'),
  'lessthan_square_fill': IconChoice(
      name: 'lessthan_square_fill',
      data: CupertinoIcons.lessthan_square_fill,
      pack: 'cupertino'),
  'light_max': IconChoice(
      name: 'light_max', data: CupertinoIcons.light_max, pack: 'cupertino'),
  'light_min': IconChoice(
      name: 'light_min', data: CupertinoIcons.light_min, pack: 'cupertino'),
  'lightbulb': IconChoice(
      name: 'lightbulb', data: CupertinoIcons.lightbulb, pack: 'cupertino'),
  'lightbulb_fill': IconChoice(
      name: 'lightbulb_fill',
      data: CupertinoIcons.lightbulb_fill,
      pack: 'cupertino'),
  'lightbulb_slash': IconChoice(
      name: 'lightbulb_slash',
      data: CupertinoIcons.lightbulb_slash,
      pack: 'cupertino'),
  'lightbulb_slash_fill': IconChoice(
      name: 'lightbulb_slash_fill',
      data: CupertinoIcons.lightbulb_slash_fill,
      pack: 'cupertino'),
  'line_horizontal_3': IconChoice(
      name: 'line_horizontal_3',
      data: CupertinoIcons.line_horizontal_3,
      pack: 'cupertino'),
  'line_horizontal_3_decrease': IconChoice(
      name: 'line_horizontal_3_decrease',
      data: CupertinoIcons.line_horizontal_3_decrease,
      pack: 'cupertino'),
  'line_horizontal_3_decrease_circle': IconChoice(
      name: 'line_horizontal_3_decrease_circle',
      data: CupertinoIcons.line_horizontal_3_decrease_circle,
      pack: 'cupertino'),
  'line_horizontal_3_decrease_circle_fill': IconChoice(
      name: 'line_horizontal_3_decrease_circle_fill',
      data: CupertinoIcons.line_horizontal_3_decrease_circle_fill,
      pack: 'cupertino'),
  'link': IconChoice(
      name: 'link', data: CupertinoIcons.link, pack: 'cupertino'),
  'link_circle': IconChoice(
      name: 'link_circle', data: CupertinoIcons.link_circle, pack: 'cupertino'),
  'link_circle_fill': IconChoice(
      name: 'link_circle_fill',
      data: CupertinoIcons.link_circle_fill,
      pack: 'cupertino'),
  'list_bullet': IconChoice(
      name: 'list_bullet', data: CupertinoIcons.list_bullet, pack: 'cupertino'),
  'list_bullet_below_rectangle': IconChoice(
      name: 'list_bullet_below_rectangle',
      data: CupertinoIcons.list_bullet_below_rectangle,
      pack: 'cupertino'),
  'list_bullet_indent': IconChoice(
      name: 'list_bullet_indent',
      data: CupertinoIcons.list_bullet_indent,
      pack: 'cupertino'),
  'list_dash': IconChoice(
      name: 'list_dash', data: CupertinoIcons.list_dash, pack: 'cupertino'),
  'list_number': IconChoice(
      name: 'list_number', data: CupertinoIcons.list_number, pack: 'cupertino'),
  'list_number_rtl': IconChoice(
      name: 'list_number_rtl',
      data: CupertinoIcons.list_number_rtl,
      pack: 'cupertino'),
  'location_circle': IconChoice(
      name: 'location_circle',
      data: CupertinoIcons.location_circle,
      pack: 'cupertino'),
  'location_circle_fill': IconChoice(
      name: 'location_circle_fill',
      data: CupertinoIcons.location_circle_fill,
      pack: 'cupertino'),
  'location_fill': IconChoice(
      name: 'location_fill',
      data: CupertinoIcons.location_fill,
      pack: 'cupertino'),
  'location_north': IconChoice(
      name: 'location_north',
      data: CupertinoIcons.location_north,
      pack: 'cupertino'),
  'location_north_fill': IconChoice(
      name: 'location_north_fill',
      data: CupertinoIcons.location_north_fill,
      pack: 'cupertino'),
  'location_north_line': IconChoice(
      name: 'location_north_line',
      data: CupertinoIcons.location_north_line,
      pack: 'cupertino'),
  'location_north_line_fill': IconChoice(
      name: 'location_north_line_fill',
      data: CupertinoIcons.location_north_line_fill,
      pack: 'cupertino'),
  'location_slash': IconChoice(
      name: 'location_slash',
      data: CupertinoIcons.location_slash,
      pack: 'cupertino'),
  'location_slash_fill': IconChoice(
      name: 'location_slash_fill',
      data: CupertinoIcons.location_slash_fill,
      pack: 'cupertino'),
  'lock': IconChoice(
      name: 'lock', data: CupertinoIcons.lock, pack: 'cupertino'),
  'lock_circle': IconChoice(
      name: 'lock_circle', data: CupertinoIcons.lock_circle, pack: 'cupertino'),
  'lock_circle_fill': IconChoice(
      name: 'lock_circle_fill',
      data: CupertinoIcons.lock_circle_fill,
      pack: 'cupertino'),
  'lock_fill': IconChoice(
      name: 'lock_fill', data: CupertinoIcons.lock_fill, pack: 'cupertino'),
  'lock_open': IconChoice(
      name: 'lock_open', data: CupertinoIcons.lock_open, pack: 'cupertino'),
  'lock_open_fill': IconChoice(
      name: 'lock_open_fill',
      data: CupertinoIcons.lock_open_fill,
      pack: 'cupertino'),
  'lock_rotation': IconChoice(
      name: 'lock_rotation',
      data: CupertinoIcons.lock_rotation,
      pack: 'cupertino'),
  'lock_rotation_open': IconChoice(
      name: 'lock_rotation_open',
      data: CupertinoIcons.lock_rotation_open,
      pack: 'cupertino'),
  'lock_shield': IconChoice(
      name: 'lock_shield', data: CupertinoIcons.lock_shield, pack: 'cupertino'),
  'lock_shield_fill': IconChoice(
      name: 'lock_shield_fill',
      data: CupertinoIcons.lock_shield_fill,
      pack: 'cupertino'),
  'lock_slash': IconChoice(
      name: 'lock_slash', data: CupertinoIcons.lock_slash, pack: 'cupertino'),
  'lock_slash_fill': IconChoice(
      name: 'lock_slash_fill',
      data: CupertinoIcons.lock_slash_fill,
      pack: 'cupertino'),
  'macwindow': IconChoice(
      name: 'macwindow', data: CupertinoIcons.macwindow, pack: 'cupertino'),
  'map':
      IconChoice(name: 'map', data: CupertinoIcons.map, pack: 'cupertino'),
  'map_fill': IconChoice(
      name: 'map_fill', data: CupertinoIcons.map_fill, pack: 'cupertino'),
  'map_pin': IconChoice(
      name: 'map_pin', data: CupertinoIcons.map_pin, pack: 'cupertino'),
  'map_pin_ellipse': IconChoice(
      name: 'map_pin_ellipse',
      data: CupertinoIcons.map_pin_ellipse,
      pack: 'cupertino'),
  'map_pin_slash': IconChoice(
      name: 'map_pin_slash',
      data: CupertinoIcons.map_pin_slash,
      pack: 'cupertino'),
  'memories': IconChoice(
      name: 'memories', data: CupertinoIcons.memories, pack: 'cupertino'),
  'memories_badge_minus': IconChoice(
      name: 'memories_badge_minus',
      data: CupertinoIcons.memories_badge_minus,
      pack: 'cupertino'),
  'memories_badge_plus': IconChoice(
      name: 'memories_badge_plus',
      data: CupertinoIcons.memories_badge_plus,
      pack: 'cupertino'),
  'metronome': IconChoice(
      name: 'metronome', data: CupertinoIcons.metronome, pack: 'cupertino'),
  'mic_circle': IconChoice(
      name: 'mic_circle', data: CupertinoIcons.mic_circle, pack: 'cupertino'),
  'mic_circle_fill': IconChoice(
      name: 'mic_circle_fill',
      data: CupertinoIcons.mic_circle_fill,
      pack: 'cupertino'),
  'mic_fill': IconChoice(
      name: 'mic_fill', data: CupertinoIcons.mic_fill, pack: 'cupertino'),
  'mic_slash': IconChoice(
      name: 'mic_slash', data: CupertinoIcons.mic_slash, pack: 'cupertino'),
  'mic_slash_fill': IconChoice(
      name: 'mic_slash_fill',
      data: CupertinoIcons.mic_slash_fill,
      pack: 'cupertino'),
  'minus': IconChoice(
      name: 'minus', data: CupertinoIcons.minus, pack: 'cupertino'),
  'minus_circle': IconChoice(
      name: 'minus_circle',
      data: CupertinoIcons.minus_circle,
      pack: 'cupertino'),
  'minus_circle_fill': IconChoice(
      name: 'minus_circle_fill',
      data: CupertinoIcons.minus_circle_fill,
      pack: 'cupertino'),
  'minus_rectangle': IconChoice(
      name: 'minus_rectangle',
      data: CupertinoIcons.minus_rectangle,
      pack: 'cupertino'),
  'minus_rectangle_fill': IconChoice(
      name: 'minus_rectangle_fill',
      data: CupertinoIcons.minus_rectangle_fill,
      pack: 'cupertino'),
  'minus_slash_plus': IconChoice(
      name: 'minus_slash_plus',
      data: CupertinoIcons.minus_slash_plus,
      pack: 'cupertino'),
  'minus_square': IconChoice(
      name: 'minus_square',
      data: CupertinoIcons.minus_square,
      pack: 'cupertino'),
  'minus_square_fill': IconChoice(
      name: 'minus_square_fill',
      data: CupertinoIcons.minus_square_fill,
      pack: 'cupertino'),
  'money_dollar': IconChoice(
      name: 'money_dollar',
      data: CupertinoIcons.money_dollar,
      pack: 'cupertino'),
  'money_dollar_circle': IconChoice(
      name: 'money_dollar_circle',
      data: CupertinoIcons.money_dollar_circle,
      pack: 'cupertino'),
  'money_dollar_circle_fill': IconChoice(
      name: 'money_dollar_circle_fill',
      data: CupertinoIcons.money_dollar_circle_fill,
      pack: 'cupertino'),
  'money_euro': IconChoice(
      name: 'money_euro', data: CupertinoIcons.money_euro, pack: 'cupertino'),
  'money_euro_circle': IconChoice(
      name: 'money_euro_circle',
      data: CupertinoIcons.money_euro_circle,
      pack: 'cupertino'),
  'money_euro_circle_fill': IconChoice(
      name: 'money_euro_circle_fill',
      data: CupertinoIcons.money_euro_circle_fill,
      pack: 'cupertino'),
  'money_pound': IconChoice(
      name: 'money_pound', data: CupertinoIcons.money_pound, pack: 'cupertino'),
  'money_pound_circle': IconChoice(
      name: 'money_pound_circle',
      data: CupertinoIcons.money_pound_circle,
      pack: 'cupertino'),
  'money_pound_circle_fill': IconChoice(
      name: 'money_pound_circle_fill',
      data: CupertinoIcons.money_pound_circle_fill,
      pack: 'cupertino'),
  'money_rubl': IconChoice(
      name: 'money_rubl', data: CupertinoIcons.money_rubl, pack: 'cupertino'),
  'money_rubl_circle': IconChoice(
      name: 'money_rubl_circle',
      data: CupertinoIcons.money_rubl_circle,
      pack: 'cupertino'),
  'money_rubl_circle_fill': IconChoice(
      name: 'money_rubl_circle_fill',
      data: CupertinoIcons.money_rubl_circle_fill,
      pack: 'cupertino'),
  'money_yen': IconChoice(
      name: 'money_yen', data: CupertinoIcons.money_yen, pack: 'cupertino'),
  'money_yen_circle': IconChoice(
      name: 'money_yen_circle',
      data: CupertinoIcons.money_yen_circle,
      pack: 'cupertino'),
  'money_yen_circle_fill': IconChoice(
      name: 'money_yen_circle_fill',
      data: CupertinoIcons.money_yen_circle_fill,
      pack: 'cupertino'),
  'moon': IconChoice(
      name: 'moon', data: CupertinoIcons.moon, pack: 'cupertino'),
  'moon_circle': IconChoice(
      name: 'moon_circle', data: CupertinoIcons.moon_circle, pack: 'cupertino'),
  'moon_circle_fill': IconChoice(
      name: 'moon_circle_fill',
      data: CupertinoIcons.moon_circle_fill,
      pack: 'cupertino'),
  'moon_fill': IconChoice(
      name: 'moon_fill', data: CupertinoIcons.moon_fill, pack: 'cupertino'),
  'moon_stars': IconChoice(
      name: 'moon_stars', data: CupertinoIcons.moon_stars, pack: 'cupertino'),
  'moon_stars_fill': IconChoice(
      name: 'moon_stars_fill',
      data: CupertinoIcons.moon_stars_fill,
      pack: 'cupertino'),
  'moon_zzz': IconChoice(
      name: 'moon_zzz', data: CupertinoIcons.moon_zzz, pack: 'cupertino'),
  'moon_zzz_fill': IconChoice(
      name: 'moon_zzz_fill',
      data: CupertinoIcons.moon_zzz_fill,
      pack: 'cupertino'),
  'move': IconChoice(
      name: 'move', data: CupertinoIcons.move, pack: 'cupertino'),
  'multiply': IconChoice(
      name: 'multiply', data: CupertinoIcons.multiply, pack: 'cupertino'),
  'multiply_circle': IconChoice(
      name: 'multiply_circle',
      data: CupertinoIcons.multiply_circle,
      pack: 'cupertino'),
  'multiply_circle_fill': IconChoice(
      name: 'multiply_circle_fill',
      data: CupertinoIcons.multiply_circle_fill,
      pack: 'cupertino'),
  'multiply_square': IconChoice(
      name: 'multiply_square',
      data: CupertinoIcons.multiply_square,
      pack: 'cupertino'),
  'multiply_square_fill': IconChoice(
      name: 'multiply_square_fill',
      data: CupertinoIcons.multiply_square_fill,
      pack: 'cupertino'),
  'music_albums': IconChoice(
      name: 'music_albums',
      data: CupertinoIcons.music_albums,
      pack: 'cupertino'),
  'music_albums_fill': IconChoice(
      name: 'music_albums_fill',
      data: CupertinoIcons.music_albums_fill,
      pack: 'cupertino'),
  'music_house': IconChoice(
      name: 'music_house', data: CupertinoIcons.music_house, pack: 'cupertino'),
  'music_house_fill': IconChoice(
      name: 'music_house_fill',
      data: CupertinoIcons.music_house_fill,
      pack: 'cupertino'),
  'music_mic': IconChoice(
      name: 'music_mic', data: CupertinoIcons.music_mic, pack: 'cupertino'),
  'music_note_2': IconChoice(
      name: 'music_note_2',
      data: CupertinoIcons.music_note_2,
      pack: 'cupertino'),
  'music_note_list': IconChoice(
      name: 'music_note_list',
      data: CupertinoIcons.music_note_list,
      pack: 'cupertino'),
  'nosign': IconChoice(
      name: 'nosign', data: CupertinoIcons.nosign, pack: 'cupertino'),
  'number': IconChoice(
      name: 'number', data: CupertinoIcons.number, pack: 'cupertino'),
  'number_circle': IconChoice(
      name: 'number_circle',
      data: CupertinoIcons.number_circle,
      pack: 'cupertino'),
  'number_circle_fill': IconChoice(
      name: 'number_circle_fill',
      data: CupertinoIcons.number_circle_fill,
      pack: 'cupertino'),
  'number_square': IconChoice(
      name: 'number_square',
      data: CupertinoIcons.number_square,
      pack: 'cupertino'),
  'number_square_fill': IconChoice(
      name: 'number_square_fill',
      data: CupertinoIcons.number_square_fill,
      pack: 'cupertino'),
  'option': IconChoice(
      name: 'option', data: CupertinoIcons.option, pack: 'cupertino'),
  'paintbrush': IconChoice(
      name: 'paintbrush', data: CupertinoIcons.paintbrush, pack: 'cupertino'),
  'paintbrush_fill': IconChoice(
      name: 'paintbrush_fill',
      data: CupertinoIcons.paintbrush_fill,
      pack: 'cupertino'),
  'pano': IconChoice(
      name: 'pano', data: CupertinoIcons.pano, pack: 'cupertino'),
  'pano_fill': IconChoice(
      name: 'pano_fill', data: CupertinoIcons.pano_fill, pack: 'cupertino'),
  'paperclip': IconChoice(
      name: 'paperclip', data: CupertinoIcons.paperclip, pack: 'cupertino'),
  'paperplane': IconChoice(
      name: 'paperplane', data: CupertinoIcons.paperplane, pack: 'cupertino'),
  'paperplane_fill': IconChoice(
      name: 'paperplane_fill',
      data: CupertinoIcons.paperplane_fill,
      pack: 'cupertino'),
  'paragraph': IconChoice(
      name: 'paragraph', data: CupertinoIcons.paragraph, pack: 'cupertino'),
  'pause_circle': IconChoice(
      name: 'pause_circle',
      data: CupertinoIcons.pause_circle,
      pack: 'cupertino'),
  'pause_circle_fill': IconChoice(
      name: 'pause_circle_fill',
      data: CupertinoIcons.pause_circle_fill,
      pack: 'cupertino'),
  'pause_fill': IconChoice(
      name: 'pause_fill', data: CupertinoIcons.pause_fill, pack: 'cupertino'),
  'pause_rectangle': IconChoice(
      name: 'pause_rectangle',
      data: CupertinoIcons.pause_rectangle,
      pack: 'cupertino'),
  'pause_rectangle_fill': IconChoice(
      name: 'pause_rectangle_fill',
      data: CupertinoIcons.pause_rectangle_fill,
      pack: 'cupertino'),
  'pencil_circle': IconChoice(
      name: 'pencil_circle',
      data: CupertinoIcons.pencil_circle,
      pack: 'cupertino'),
  'pencil_circle_fill': IconChoice(
      name: 'pencil_circle_fill',
      data: CupertinoIcons.pencil_circle_fill,
      pack: 'cupertino'),
  'pencil_ellipsis_rectangle': IconChoice(
      name: 'pencil_ellipsis_rectangle',
      data: CupertinoIcons.pencil_ellipsis_rectangle,
      pack: 'cupertino'),
  'pencil_outline': IconChoice(
      name: 'pencil_outline',
      data: CupertinoIcons.pencil_outline,
      pack: 'cupertino'),
  'pencil_slash': IconChoice(
      name: 'pencil_slash',
      data: CupertinoIcons.pencil_slash,
      pack: 'cupertino'),
  'percent': IconChoice(
      name: 'percent', data: CupertinoIcons.percent, pack: 'cupertino'),
  'person_2': IconChoice(
      name: 'person_2', data: CupertinoIcons.person_2, pack: 'cupertino'),
  'person_2_alt': IconChoice(
      name: 'person_2_alt',
      data: CupertinoIcons.person_2_alt,
      pack: 'cupertino'),
  'person_2_fill': IconChoice(
      name: 'person_2_fill',
      data: CupertinoIcons.person_2_fill,
      pack: 'cupertino'),
  'person_2_square_stack': IconChoice(
      name: 'person_2_square_stack',
      data: CupertinoIcons.person_2_square_stack,
      pack: 'cupertino'),
  'person_2_square_stack_fill': IconChoice(
      name: 'person_2_square_stack_fill',
      data: CupertinoIcons.person_2_square_stack_fill,
      pack: 'cupertino'),
  'person_3': IconChoice(
      name: 'person_3', data: CupertinoIcons.person_3, pack: 'cupertino'),
  'person_3_fill': IconChoice(
      name: 'person_3_fill',
      data: CupertinoIcons.person_3_fill,
      pack: 'cupertino'),
  'person_alt': IconChoice(
      name: 'person_alt', data: CupertinoIcons.person_alt, pack: 'cupertino'),
  'person_alt_circle': IconChoice(
      name: 'person_alt_circle',
      data: CupertinoIcons.person_alt_circle,
      pack: 'cupertino'),
  'person_alt_circle_fill': IconChoice(
      name: 'person_alt_circle_fill',
      data: CupertinoIcons.person_alt_circle_fill,
      pack: 'cupertino'),
  'person_badge_minus': IconChoice(
      name: 'person_badge_minus',
      data: CupertinoIcons.person_badge_minus,
      pack: 'cupertino'),
  'person_badge_minus_fill': IconChoice(
      name: 'person_badge_minus_fill',
      data: CupertinoIcons.person_badge_minus_fill,
      pack: 'cupertino'),
  'person_badge_plus': IconChoice(
      name: 'person_badge_plus',
      data: CupertinoIcons.person_badge_plus,
      pack: 'cupertino'),
  'person_badge_plus_fill': IconChoice(
      name: 'person_badge_plus_fill',
      data: CupertinoIcons.person_badge_plus_fill,
      pack: 'cupertino'),
  'person_circle': IconChoice(
      name: 'person_circle',
      data: CupertinoIcons.person_circle,
      pack: 'cupertino'),
  'person_circle_fill': IconChoice(
      name: 'person_circle_fill',
      data: CupertinoIcons.person_circle_fill,
      pack: 'cupertino'),
  'person_crop_circle': IconChoice(
      name: 'person_crop_circle',
      data: CupertinoIcons.person_crop_circle,
      pack: 'cupertino'),
  'person_crop_circle_badge_checkmark': IconChoice(
      name: 'person_crop_circle_badge_checkmark',
      data: CupertinoIcons.person_crop_circle_badge_checkmark,
      pack: 'cupertino'),
  'person_crop_circle_badge_exclam': IconChoice(
      name: 'person_crop_circle_badge_exclam',
      data: CupertinoIcons.person_crop_circle_badge_exclam,
      pack: 'cupertino'),
  'person_crop_circle_badge_minus': IconChoice(
      name: 'person_crop_circle_badge_minus',
      data: CupertinoIcons.person_crop_circle_badge_minus,
      pack: 'cupertino'),
  'person_crop_circle_badge_plus': IconChoice(
      name: 'person_crop_circle_badge_plus',
      data: CupertinoIcons.person_crop_circle_badge_plus,
      pack: 'cupertino'),
  'person_crop_circle_badge_xmark': IconChoice(
      name: 'person_crop_circle_badge_xmark',
      data: CupertinoIcons.person_crop_circle_badge_xmark,
      pack: 'cupertino'),
  'person_crop_circle_fill': IconChoice(
      name: 'person_crop_circle_fill',
      data: CupertinoIcons.person_crop_circle_fill,
      pack: 'cupertino'),
  'person_crop_circle_fill_badge_checkmark': IconChoice(
      name: 'person_crop_circle_fill_badge_checkmark',
      data: CupertinoIcons.person_crop_circle_fill_badge_checkmark,
      pack: 'cupertino'),
  'person_crop_circle_fill_badge_exclam': IconChoice(
      name: 'person_crop_circle_fill_badge_exclam',
      data: CupertinoIcons.person_crop_circle_fill_badge_exclam,
      pack: 'cupertino'),
  'person_crop_circle_fill_badge_minus': IconChoice(
      name: 'person_crop_circle_fill_badge_minus',
      data: CupertinoIcons.person_crop_circle_fill_badge_minus,
      pack: 'cupertino'),
  'person_crop_circle_fill_badge_plus': IconChoice(
      name: 'person_crop_circle_fill_badge_plus',
      data: CupertinoIcons.person_crop_circle_fill_badge_plus,
      pack: 'cupertino'),
  'person_crop_circle_fill_badge_xmark': IconChoice(
      name: 'person_crop_circle_fill_badge_xmark',
      data: CupertinoIcons.person_crop_circle_fill_badge_xmark,
      pack: 'cupertino'),
  'person_crop_rectangle': IconChoice(
      name: 'person_crop_rectangle',
      data: CupertinoIcons.person_crop_rectangle,
      pack: 'cupertino'),
  'person_crop_rectangle_fill': IconChoice(
      name: 'person_crop_rectangle_fill',
      data: CupertinoIcons.person_crop_rectangle_fill,
      pack: 'cupertino'),
  'person_crop_square': IconChoice(
      name: 'person_crop_square',
      data: CupertinoIcons.person_crop_square,
      pack: 'cupertino'),
  'person_crop_square_fill': IconChoice(
      name: 'person_crop_square_fill',
      data: CupertinoIcons.person_crop_square_fill,
      pack: 'cupertino'),
  'person_fill': IconChoice(
      name: 'person_fill', data: CupertinoIcons.person_fill, pack: 'cupertino'),
  'personalhotspot': IconChoice(
      name: 'personalhotspot',
      data: CupertinoIcons.personalhotspot,
      pack: 'cupertino'),
  'perspective': IconChoice(
      name: 'perspective', data: CupertinoIcons.perspective, pack: 'cupertino'),
  'phone_arrow_down_left': IconChoice(
      name: 'phone_arrow_down_left',
      data: CupertinoIcons.phone_arrow_down_left,
      pack: 'cupertino'),
  'phone_arrow_right': IconChoice(
      name: 'phone_arrow_right',
      data: CupertinoIcons.phone_arrow_right,
      pack: 'cupertino'),
  'phone_arrow_up_right': IconChoice(
      name: 'phone_arrow_up_right',
      data: CupertinoIcons.phone_arrow_up_right,
      pack: 'cupertino'),
  'phone_badge_plus': IconChoice(
      name: 'phone_badge_plus',
      data: CupertinoIcons.phone_badge_plus,
      pack: 'cupertino'),
  'phone_circle': IconChoice(
      name: 'phone_circle',
      data: CupertinoIcons.phone_circle,
      pack: 'cupertino'),
  'phone_circle_fill': IconChoice(
      name: 'phone_circle_fill',
      data: CupertinoIcons.phone_circle_fill,
      pack: 'cupertino'),
  'phone_down': IconChoice(
      name: 'phone_down', data: CupertinoIcons.phone_down, pack: 'cupertino'),
  'phone_down_circle': IconChoice(
      name: 'phone_down_circle',
      data: CupertinoIcons.phone_down_circle,
      pack: 'cupertino'),
  'phone_down_circle_fill': IconChoice(
      name: 'phone_down_circle_fill',
      data: CupertinoIcons.phone_down_circle_fill,
      pack: 'cupertino'),
  'phone_down_fill': IconChoice(
      name: 'phone_down_fill',
      data: CupertinoIcons.phone_down_fill,
      pack: 'cupertino'),
  'phone_fill': IconChoice(
      name: 'phone_fill', data: CupertinoIcons.phone_fill, pack: 'cupertino'),
  'phone_fill_arrow_down_left': IconChoice(
      name: 'phone_fill_arrow_down_left',
      data: CupertinoIcons.phone_fill_arrow_down_left,
      pack: 'cupertino'),
  'phone_fill_arrow_right': IconChoice(
      name: 'phone_fill_arrow_right',
      data: CupertinoIcons.phone_fill_arrow_right,
      pack: 'cupertino'),
  'phone_fill_arrow_up_right': IconChoice(
      name: 'phone_fill_arrow_up_right',
      data: CupertinoIcons.phone_fill_arrow_up_right,
      pack: 'cupertino'),
  'phone_fill_badge_plus': IconChoice(
      name: 'phone_fill_badge_plus',
      data: CupertinoIcons.phone_fill_badge_plus,
      pack: 'cupertino'),
  'photo': IconChoice(
      name: 'photo', data: CupertinoIcons.photo, pack: 'cupertino'),
  'photo_fill': IconChoice(
      name: 'photo_fill', data: CupertinoIcons.photo_fill, pack: 'cupertino'),
  'photo_fill_on_rectangle_fill': IconChoice(
      name: 'photo_fill_on_rectangle_fill',
      data: CupertinoIcons.photo_fill_on_rectangle_fill,
      pack: 'cupertino'),
  'photo_on_rectangle': IconChoice(
      name: 'photo_on_rectangle',
      data: CupertinoIcons.photo_on_rectangle,
      pack: 'cupertino'),
  'piano': IconChoice(
      name: 'piano', data: CupertinoIcons.piano, pack: 'cupertino'),
  'pin':
      IconChoice(name: 'pin', data: CupertinoIcons.pin, pack: 'cupertino'),
  'pin_fill': IconChoice(
      name: 'pin_fill', data: CupertinoIcons.pin_fill, pack: 'cupertino'),
  'pin_slash': IconChoice(
      name: 'pin_slash', data: CupertinoIcons.pin_slash, pack: 'cupertino'),
  'pin_slash_fill': IconChoice(
      name: 'pin_slash_fill',
      data: CupertinoIcons.pin_slash_fill,
      pack: 'cupertino'),
  'placemark': IconChoice(
      name: 'placemark', data: CupertinoIcons.placemark, pack: 'cupertino'),
  'placemark_fill': IconChoice(
      name: 'placemark_fill',
      data: CupertinoIcons.placemark_fill,
      pack: 'cupertino'),
  'play': IconChoice(
      name: 'play', data: CupertinoIcons.play, pack: 'cupertino'),
  'play_circle': IconChoice(
      name: 'play_circle', data: CupertinoIcons.play_circle, pack: 'cupertino'),
  'play_circle_fill': IconChoice(
      name: 'play_circle_fill',
      data: CupertinoIcons.play_circle_fill,
      pack: 'cupertino'),
  'play_fill': IconChoice(
      name: 'play_fill', data: CupertinoIcons.play_fill, pack: 'cupertino'),
  'play_rectangle': IconChoice(
      name: 'play_rectangle',
      data: CupertinoIcons.play_rectangle,
      pack: 'cupertino'),
  'play_rectangle_fill': IconChoice(
      name: 'play_rectangle_fill',
      data: CupertinoIcons.play_rectangle_fill,
      pack: 'cupertino'),
  'playpause': IconChoice(
      name: 'playpause', data: CupertinoIcons.playpause, pack: 'cupertino'),
  'playpause_fill': IconChoice(
      name: 'playpause_fill',
      data: CupertinoIcons.playpause_fill,
      pack: 'cupertino'),
  'plus': IconChoice(
      name: 'plus', data: CupertinoIcons.plus, pack: 'cupertino'),
  'plus_app': IconChoice(
      name: 'plus_app', data: CupertinoIcons.plus_app, pack: 'cupertino'),
  'plus_app_fill': IconChoice(
      name: 'plus_app_fill',
      data: CupertinoIcons.plus_app_fill,
      pack: 'cupertino'),
  'plus_bubble': IconChoice(
      name: 'plus_bubble', data: CupertinoIcons.plus_bubble, pack: 'cupertino'),
  'plus_bubble_fill': IconChoice(
      name: 'plus_bubble_fill',
      data: CupertinoIcons.plus_bubble_fill,
      pack: 'cupertino'),
  'plus_circle': IconChoice(
      name: 'plus_circle', data: CupertinoIcons.plus_circle, pack: 'cupertino'),
  'plus_circle_fill': IconChoice(
      name: 'plus_circle_fill',
      data: CupertinoIcons.plus_circle_fill,
      pack: 'cupertino'),
  'plus_rectangle': IconChoice(
      name: 'plus_rectangle',
      data: CupertinoIcons.plus_rectangle,
      pack: 'cupertino'),
  'plus_rectangle_fill': IconChoice(
      name: 'plus_rectangle_fill',
      data: CupertinoIcons.plus_rectangle_fill,
      pack: 'cupertino'),
  'plus_rectangle_fill_on_rectangle_fill': IconChoice(
      name: 'plus_rectangle_fill_on_rectangle_fill',
      data: CupertinoIcons.plus_rectangle_fill_on_rectangle_fill,
      pack: 'cupertino'),
  'plus_rectangle_on_rectangle': IconChoice(
      name: 'plus_rectangle_on_rectangle',
      data: CupertinoIcons.plus_rectangle_on_rectangle,
      pack: 'cupertino'),
  'plus_slash_minus': IconChoice(
      name: 'plus_slash_minus',
      data: CupertinoIcons.plus_slash_minus,
      pack: 'cupertino'),
  'plus_square': IconChoice(
      name: 'plus_square', data: CupertinoIcons.plus_square, pack: 'cupertino'),
  'plus_square_fill': IconChoice(
      name: 'plus_square_fill',
      data: CupertinoIcons.plus_square_fill,
      pack: 'cupertino'),
  'plus_square_fill_on_square_fill': IconChoice(
      name: 'plus_square_fill_on_square_fill',
      data: CupertinoIcons.plus_square_fill_on_square_fill,
      pack: 'cupertino'),
  'plus_square_on_square': IconChoice(
      name: 'plus_square_on_square',
      data: CupertinoIcons.plus_square_on_square,
      pack: 'cupertino'),
  'plusminus': IconChoice(
      name: 'plusminus', data: CupertinoIcons.plusminus, pack: 'cupertino'),
  'plusminus_circle': IconChoice(
      name: 'plusminus_circle',
      data: CupertinoIcons.plusminus_circle,
      pack: 'cupertino'),
  'plusminus_circle_fill': IconChoice(
      name: 'plusminus_circle_fill',
      data: CupertinoIcons.plusminus_circle_fill,
      pack: 'cupertino'),
  'power': IconChoice(
      name: 'power', data: CupertinoIcons.power, pack: 'cupertino'),
  'printer': IconChoice(
      name: 'printer', data: CupertinoIcons.printer, pack: 'cupertino'),
  'printer_fill': IconChoice(
      name: 'printer_fill',
      data: CupertinoIcons.printer_fill,
      pack: 'cupertino'),
  'projective': IconChoice(
      name: 'projective', data: CupertinoIcons.projective, pack: 'cupertino'),
  'purchased': IconChoice(
      name: 'purchased', data: CupertinoIcons.purchased, pack: 'cupertino'),
  'purchased_circle': IconChoice(
      name: 'purchased_circle',
      data: CupertinoIcons.purchased_circle,
      pack: 'cupertino'),
  'purchased_circle_fill': IconChoice(
      name: 'purchased_circle_fill',
      data: CupertinoIcons.purchased_circle_fill,
      pack: 'cupertino'),
  'qrcode': IconChoice(
      name: 'qrcode', data: CupertinoIcons.qrcode, pack: 'cupertino'),
  'qrcode_viewfinder': IconChoice(
      name: 'qrcode_viewfinder',
      data: CupertinoIcons.qrcode_viewfinder,
      pack: 'cupertino'),
  'question': IconChoice(
      name: 'question', data: CupertinoIcons.question, pack: 'cupertino'),
  'question_circle': IconChoice(
      name: 'question_circle',
      data: CupertinoIcons.question_circle,
      pack: 'cupertino'),
  'question_circle_fill': IconChoice(
      name: 'question_circle_fill',
      data: CupertinoIcons.question_circle_fill,
      pack: 'cupertino'),
  'question_diamond': IconChoice(
      name: 'question_diamond',
      data: CupertinoIcons.question_diamond,
      pack: 'cupertino'),
  'question_diamond_fill': IconChoice(
      name: 'question_diamond_fill',
      data: CupertinoIcons.question_diamond_fill,
      pack: 'cupertino'),
  'question_square': IconChoice(
      name: 'question_square',
      data: CupertinoIcons.question_square,
      pack: 'cupertino'),
  'question_square_fill': IconChoice(
      name: 'question_square_fill',
      data: CupertinoIcons.question_square_fill,
      pack: 'cupertino'),
  'quote_bubble': IconChoice(
      name: 'quote_bubble',
      data: CupertinoIcons.quote_bubble,
      pack: 'cupertino'),
  'quote_bubble_fill': IconChoice(
      name: 'quote_bubble_fill',
      data: CupertinoIcons.quote_bubble_fill,
      pack: 'cupertino'),
  'radiowaves_left': IconChoice(
      name: 'radiowaves_left',
      data: CupertinoIcons.radiowaves_left,
      pack: 'cupertino'),
  'radiowaves_right': IconChoice(
      name: 'radiowaves_right',
      data: CupertinoIcons.radiowaves_right,
      pack: 'cupertino'),
  'rays': IconChoice(
      name: 'rays', data: CupertinoIcons.rays, pack: 'cupertino'),
  'recordingtape': IconChoice(
      name: 'recordingtape',
      data: CupertinoIcons.recordingtape,
      pack: 'cupertino'),
  'rectangle': IconChoice(
      name: 'rectangle', data: CupertinoIcons.rectangle, pack: 'cupertino'),
  'rectangle_3_offgrid': IconChoice(
      name: 'rectangle_3_offgrid',
      data: CupertinoIcons.rectangle_3_offgrid,
      pack: 'cupertino'),
  'rectangle_3_offgrid_fill': IconChoice(
      name: 'rectangle_3_offgrid_fill',
      data: CupertinoIcons.rectangle_3_offgrid_fill,
      pack: 'cupertino'),
  'rectangle_arrow_up_right_arrow_down_left': IconChoice(
      name: 'rectangle_arrow_up_right_arrow_down_left',
      data: CupertinoIcons.rectangle_arrow_up_right_arrow_down_left,
      pack: 'cupertino'),
  'rectangle_arrow_up_right_arrow_down_left_slash': IconChoice(
      name: 'rectangle_arrow_up_right_arrow_down_left_slash',
      data: CupertinoIcons.rectangle_arrow_up_right_arrow_down_left_slash,
      pack: 'cupertino'),
  'rectangle_badge_checkmark': IconChoice(
      name: 'rectangle_badge_checkmark',
      data: CupertinoIcons.rectangle_badge_checkmark,
      pack: 'cupertino'),
  'rectangle_badge_xmark': IconChoice(
      name: 'rectangle_badge_xmark',
      data: CupertinoIcons.rectangle_badge_xmark,
      pack: 'cupertino'),
  'rectangle_compress_vertical': IconChoice(
      name: 'rectangle_compress_vertical',
      data: CupertinoIcons.rectangle_compress_vertical,
      pack: 'cupertino'),
  'rectangle_dock': IconChoice(
      name: 'rectangle_dock',
      data: CupertinoIcons.rectangle_dock,
      pack: 'cupertino'),
  'rectangle_expand_vertical': IconChoice(
      name: 'rectangle_expand_vertical',
      data: CupertinoIcons.rectangle_expand_vertical,
      pack: 'cupertino'),
  'rectangle_fill': IconChoice(
      name: 'rectangle_fill',
      data: CupertinoIcons.rectangle_fill,
      pack: 'cupertino'),
  'rectangle_fill_badge_checkmark': IconChoice(
      name: 'rectangle_fill_badge_checkmark',
      data: CupertinoIcons.rectangle_fill_badge_checkmark,
      pack: 'cupertino'),
  'rectangle_fill_badge_xmark': IconChoice(
      name: 'rectangle_fill_badge_xmark',
      data: CupertinoIcons.rectangle_fill_badge_xmark,
      pack: 'cupertino'),
  'rectangle_fill_on_rectangle_angled_fill': IconChoice(
      name: 'rectangle_fill_on_rectangle_angled_fill',
      data: CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
      pack: 'cupertino'),
  'rectangle_fill_on_rectangle_fill': IconChoice(
      name: 'rectangle_fill_on_rectangle_fill',
      data: CupertinoIcons.rectangle_fill_on_rectangle_fill,
      pack: 'cupertino'),
  'rectangle_grid_1x2': IconChoice(
      name: 'rectangle_grid_1x2',
      data: CupertinoIcons.rectangle_grid_1x2,
      pack: 'cupertino'),
  'rectangle_grid_1x2_fill': IconChoice(
      name: 'rectangle_grid_1x2_fill',
      data: CupertinoIcons.rectangle_grid_1x2_fill,
      pack: 'cupertino'),
  'rectangle_grid_2x2': IconChoice(
      name: 'rectangle_grid_2x2',
      data: CupertinoIcons.rectangle_grid_2x2,
      pack: 'cupertino'),
  'rectangle_grid_2x2_fill': IconChoice(
      name: 'rectangle_grid_2x2_fill',
      data: CupertinoIcons.rectangle_grid_2x2_fill,
      pack: 'cupertino'),
  'rectangle_grid_3x2': IconChoice(
      name: 'rectangle_grid_3x2',
      data: CupertinoIcons.rectangle_grid_3x2,
      pack: 'cupertino'),
  'rectangle_grid_3x2_fill': IconChoice(
      name: 'rectangle_grid_3x2_fill',
      data: CupertinoIcons.rectangle_grid_3x2_fill,
      pack: 'cupertino'),
  'rectangle_on_rectangle': IconChoice(
      name: 'rectangle_on_rectangle',
      data: CupertinoIcons.rectangle_on_rectangle,
      pack: 'cupertino'),
  'rectangle_on_rectangle_angled': IconChoice(
      name: 'rectangle_on_rectangle_angled',
      data: CupertinoIcons.rectangle_on_rectangle_angled,
      pack: 'cupertino'),
  'rectangle_paperclip': IconChoice(
      name: 'rectangle_paperclip',
      data: CupertinoIcons.rectangle_paperclip,
      pack: 'cupertino'),
  'rectangle_split_3x1': IconChoice(
      name: 'rectangle_split_3x1',
      data: CupertinoIcons.rectangle_split_3x1,
      pack: 'cupertino'),
  'rectangle_split_3x1_fill': IconChoice(
      name: 'rectangle_split_3x1_fill',
      data: CupertinoIcons.rectangle_split_3x1_fill,
      pack: 'cupertino'),
  'rectangle_split_3x3': IconChoice(
      name: 'rectangle_split_3x3',
      data: CupertinoIcons.rectangle_split_3x3,
      pack: 'cupertino'),
  'rectangle_split_3x3_fill': IconChoice(
      name: 'rectangle_split_3x3_fill',
      data: CupertinoIcons.rectangle_split_3x3_fill,
      pack: 'cupertino'),
  'rectangle_stack': IconChoice(
      name: 'rectangle_stack',
      data: CupertinoIcons.rectangle_stack,
      pack: 'cupertino'),
  'rectangle_stack_badge_minus': IconChoice(
      name: 'rectangle_stack_badge_minus',
      data: CupertinoIcons.rectangle_stack_badge_minus,
      pack: 'cupertino'),
  'rectangle_stack_badge_person_crop': IconChoice(
      name: 'rectangle_stack_badge_person_crop',
      data: CupertinoIcons.rectangle_stack_badge_person_crop,
      pack: 'cupertino'),
  'rectangle_stack_badge_plus': IconChoice(
      name: 'rectangle_stack_badge_plus',
      data: CupertinoIcons.rectangle_stack_badge_plus,
      pack: 'cupertino'),
  'rectangle_stack_fill': IconChoice(
      name: 'rectangle_stack_fill',
      data: CupertinoIcons.rectangle_stack_fill,
      pack: 'cupertino'),
  'rectangle_stack_fill_badge_minus': IconChoice(
      name: 'rectangle_stack_fill_badge_minus',
      data: CupertinoIcons.rectangle_stack_fill_badge_minus,
      pack: 'cupertino'),
  'rectangle_stack_fill_badge_person_crop': IconChoice(
      name: 'rectangle_stack_fill_badge_person_crop',
      data: CupertinoIcons.rectangle_stack_fill_badge_person_crop,
      pack: 'cupertino'),
  'rectangle_stack_fill_badge_plus': IconChoice(
      name: 'rectangle_stack_fill_badge_plus',
      data: CupertinoIcons.rectangle_stack_fill_badge_plus,
      pack: 'cupertino'),
  'rectangle_stack_person_crop': IconChoice(
      name: 'rectangle_stack_person_crop',
      data: CupertinoIcons.rectangle_stack_person_crop,
      pack: 'cupertino'),
  'rectangle_stack_person_crop_fill': IconChoice(
      name: 'rectangle_stack_person_crop_fill',
      data: CupertinoIcons.rectangle_stack_person_crop_fill,
      pack: 'cupertino'),
  'repeat': IconChoice(
      name: 'repeat', data: CupertinoIcons.repeat, pack: 'cupertino'),
  'repeat_1': IconChoice(
      name: 'repeat_1', data: CupertinoIcons.repeat_1, pack: 'cupertino'),
  'resize': IconChoice(
      name: 'resize', data: CupertinoIcons.resize, pack: 'cupertino'),
  'resize_h': IconChoice(
      name: 'resize_h', data: CupertinoIcons.resize_h, pack: 'cupertino'),
  'resize_v': IconChoice(
      name: 'resize_v', data: CupertinoIcons.resize_v, pack: 'cupertino'),
  'return_icon': IconChoice(
      name: 'return_icon', data: CupertinoIcons.return_icon, pack: 'cupertino'),
  'rhombus': IconChoice(
      name: 'rhombus', data: CupertinoIcons.rhombus, pack: 'cupertino'),
  'rhombus_fill': IconChoice(
      name: 'rhombus_fill',
      data: CupertinoIcons.rhombus_fill,
      pack: 'cupertino'),
  'rocket': IconChoice(
      name: 'rocket', data: CupertinoIcons.rocket, pack: 'cupertino'),
  'rocket_fill': IconChoice(
      name: 'rocket_fill', data: CupertinoIcons.rocket_fill, pack: 'cupertino'),
  'rosette': IconChoice(
      name: 'rosette', data: CupertinoIcons.rosette, pack: 'cupertino'),
  'rotate_left': IconChoice(
      name: 'rotate_left', data: CupertinoIcons.rotate_left, pack: 'cupertino'),
  'rotate_left_fill': IconChoice(
      name: 'rotate_left_fill',
      data: CupertinoIcons.rotate_left_fill,
      pack: 'cupertino'),
  'rotate_right': IconChoice(
      name: 'rotate_right',
      data: CupertinoIcons.rotate_right,
      pack: 'cupertino'),
  'rotate_right_fill': IconChoice(
      name: 'rotate_right_fill',
      data: CupertinoIcons.rotate_right_fill,
      pack: 'cupertino'),
  'scissors': IconChoice(
      name: 'scissors', data: CupertinoIcons.scissors, pack: 'cupertino'),
  'scissors_alt': IconChoice(
      name: 'scissors_alt',
      data: CupertinoIcons.scissors_alt,
      pack: 'cupertino'),
  'scope': IconChoice(
      name: 'scope', data: CupertinoIcons.scope, pack: 'cupertino'),
  'scribble': IconChoice(
      name: 'scribble', data: CupertinoIcons.scribble, pack: 'cupertino'),
  'search_circle': IconChoice(
      name: 'search_circle',
      data: CupertinoIcons.search_circle,
      pack: 'cupertino'),
  'search_circle_fill': IconChoice(
      name: 'search_circle_fill',
      data: CupertinoIcons.search_circle_fill,
      pack: 'cupertino'),
  'selection_pin_in_out': IconChoice(
      name: 'selection_pin_in_out',
      data: CupertinoIcons.selection_pin_in_out,
      pack: 'cupertino'),
  'shield': IconChoice(
      name: 'shield', data: CupertinoIcons.shield, pack: 'cupertino'),
  'shield_fill': IconChoice(
      name: 'shield_fill', data: CupertinoIcons.shield_fill, pack: 'cupertino'),
  'shield_lefthalf_fill': IconChoice(
      name: 'shield_lefthalf_fill',
      data: CupertinoIcons.shield_lefthalf_fill,
      pack: 'cupertino'),
  'shield_slash': IconChoice(
      name: 'shield_slash',
      data: CupertinoIcons.shield_slash,
      pack: 'cupertino'),
  'shield_slash_fill': IconChoice(
      name: 'shield_slash_fill',
      data: CupertinoIcons.shield_slash_fill,
      pack: 'cupertino'),
  'shift': IconChoice(
      name: 'shift', data: CupertinoIcons.shift, pack: 'cupertino'),
  'shift_fill': IconChoice(
      name: 'shift_fill', data: CupertinoIcons.shift_fill, pack: 'cupertino'),
  'sidebar_left': IconChoice(
      name: 'sidebar_left',
      data: CupertinoIcons.sidebar_left,
      pack: 'cupertino'),
  'sidebar_right': IconChoice(
      name: 'sidebar_right',
      data: CupertinoIcons.sidebar_right,
      pack: 'cupertino'),
  'signature': IconChoice(
      name: 'signature', data: CupertinoIcons.signature, pack: 'cupertino'),
  'skew': IconChoice(
      name: 'skew', data: CupertinoIcons.skew, pack: 'cupertino'),
  'slash_circle': IconChoice(
      name: 'slash_circle',
      data: CupertinoIcons.slash_circle,
      pack: 'cupertino'),
  'slash_circle_fill': IconChoice(
      name: 'slash_circle_fill',
      data: CupertinoIcons.slash_circle_fill,
      pack: 'cupertino'),
  'slider_horizontal_3': IconChoice(
      name: 'slider_horizontal_3',
      data: CupertinoIcons.slider_horizontal_3,
      pack: 'cupertino'),
  'slider_horizontal_below_rectangle': IconChoice(
      name: 'slider_horizontal_below_rectangle',
      data: CupertinoIcons.slider_horizontal_below_rectangle,
      pack: 'cupertino'),
  'slowmo': IconChoice(
      name: 'slowmo', data: CupertinoIcons.slowmo, pack: 'cupertino'),
  'smallcircle_circle': IconChoice(
      name: 'smallcircle_circle',
      data: CupertinoIcons.smallcircle_circle,
      pack: 'cupertino'),
  'smallcircle_circle_fill': IconChoice(
      name: 'smallcircle_circle_fill',
      data: CupertinoIcons.smallcircle_circle_fill,
      pack: 'cupertino'),
  'smallcircle_fill_circle': IconChoice(
      name: 'smallcircle_fill_circle',
      data: CupertinoIcons.smallcircle_fill_circle,
      pack: 'cupertino'),
  'smallcircle_fill_circle_fill': IconChoice(
      name: 'smallcircle_fill_circle_fill',
      data: CupertinoIcons.smallcircle_fill_circle_fill,
      pack: 'cupertino'),
  'smiley': IconChoice(
      name: 'smiley', data: CupertinoIcons.smiley, pack: 'cupertino'),
  'smiley_fill': IconChoice(
      name: 'smiley_fill', data: CupertinoIcons.smiley_fill, pack: 'cupertino'),
  'smoke': IconChoice(
      name: 'smoke', data: CupertinoIcons.smoke, pack: 'cupertino'),
  'smoke_fill': IconChoice(
      name: 'smoke_fill', data: CupertinoIcons.smoke_fill, pack: 'cupertino'),
  'snow': IconChoice(
      name: 'snow', data: CupertinoIcons.snow, pack: 'cupertino'),
  'sort_down': IconChoice(
      name: 'sort_down', data: CupertinoIcons.sort_down, pack: 'cupertino'),
  'sort_down_circle': IconChoice(
      name: 'sort_down_circle',
      data: CupertinoIcons.sort_down_circle,
      pack: 'cupertino'),
  'sort_down_circle_fill': IconChoice(
      name: 'sort_down_circle_fill',
      data: CupertinoIcons.sort_down_circle_fill,
      pack: 'cupertino'),
  'sort_up': IconChoice(
      name: 'sort_up', data: CupertinoIcons.sort_up, pack: 'cupertino'),
  'sort_up_circle': IconChoice(
      name: 'sort_up_circle',
      data: CupertinoIcons.sort_up_circle,
      pack: 'cupertino'),
  'sort_up_circle_fill': IconChoice(
      name: 'sort_up_circle_fill',
      data: CupertinoIcons.sort_up_circle_fill,
      pack: 'cupertino'),
  'sparkles': IconChoice(
      name: 'sparkles', data: CupertinoIcons.sparkles, pack: 'cupertino'),
  'speaker': IconChoice(
      name: 'speaker', data: CupertinoIcons.speaker, pack: 'cupertino'),
  'speaker_1': IconChoice(
      name: 'speaker_1', data: CupertinoIcons.speaker_1, pack: 'cupertino'),
  'speaker_1_fill': IconChoice(
      name: 'speaker_1_fill',
      data: CupertinoIcons.speaker_1_fill,
      pack: 'cupertino'),
  'speaker_2': IconChoice(
      name: 'speaker_2', data: CupertinoIcons.speaker_2, pack: 'cupertino'),
  'speaker_2_fill': IconChoice(
      name: 'speaker_2_fill',
      data: CupertinoIcons.speaker_2_fill,
      pack: 'cupertino'),
  'speaker_3': IconChoice(
      name: 'speaker_3', data: CupertinoIcons.speaker_3, pack: 'cupertino'),
  'speaker_3_fill': IconChoice(
      name: 'speaker_3_fill',
      data: CupertinoIcons.speaker_3_fill,
      pack: 'cupertino'),
  'speaker_fill': IconChoice(
      name: 'speaker_fill',
      data: CupertinoIcons.speaker_fill,
      pack: 'cupertino'),
  'speaker_slash': IconChoice(
      name: 'speaker_slash',
      data: CupertinoIcons.speaker_slash,
      pack: 'cupertino'),
  'speaker_slash_fill': IconChoice(
      name: 'speaker_slash_fill',
      data: CupertinoIcons.speaker_slash_fill,
      pack: 'cupertino'),
  'speaker_slash_fill_rtl': IconChoice(
      name: 'speaker_slash_fill_rtl',
      data: CupertinoIcons.speaker_slash_fill_rtl,
      pack: 'cupertino'),
  'speaker_slash_rtl': IconChoice(
      name: 'speaker_slash_rtl',
      data: CupertinoIcons.speaker_slash_rtl,
      pack: 'cupertino'),
  'speaker_zzz': IconChoice(
      name: 'speaker_zzz', data: CupertinoIcons.speaker_zzz, pack: 'cupertino'),
  'speaker_zzz_fill': IconChoice(
      name: 'speaker_zzz_fill',
      data: CupertinoIcons.speaker_zzz_fill,
      pack: 'cupertino'),
  'speaker_zzz_fill_rtl': IconChoice(
      name: 'speaker_zzz_fill_rtl',
      data: CupertinoIcons.speaker_zzz_fill_rtl,
      pack: 'cupertino'),
  'speaker_zzz_rtl': IconChoice(
      name: 'speaker_zzz_rtl',
      data: CupertinoIcons.speaker_zzz_rtl,
      pack: 'cupertino'),
  'speedometer': IconChoice(
      name: 'speedometer', data: CupertinoIcons.speedometer, pack: 'cupertino'),
  'sportscourt': IconChoice(
      name: 'sportscourt', data: CupertinoIcons.sportscourt, pack: 'cupertino'),
  'sportscourt_fill': IconChoice(
      name: 'sportscourt_fill',
      data: CupertinoIcons.sportscourt_fill,
      pack: 'cupertino'),
  'square': IconChoice(
      name: 'square', data: CupertinoIcons.square, pack: 'cupertino'),
  'square_arrow_down': IconChoice(
      name: 'square_arrow_down',
      data: CupertinoIcons.square_arrow_down,
      pack: 'cupertino'),
  'square_arrow_down_fill': IconChoice(
      name: 'square_arrow_down_fill',
      data: CupertinoIcons.square_arrow_down_fill,
      pack: 'cupertino'),
  'square_arrow_down_on_square': IconChoice(
      name: 'square_arrow_down_on_square',
      data: CupertinoIcons.square_arrow_down_on_square,
      pack: 'cupertino'),
  'square_arrow_down_on_square_fill': IconChoice(
      name: 'square_arrow_down_on_square_fill',
      data: CupertinoIcons.square_arrow_down_on_square_fill,
      pack: 'cupertino'),
  'square_arrow_left': IconChoice(
      name: 'square_arrow_left',
      data: CupertinoIcons.square_arrow_left,
      pack: 'cupertino'),
  'square_arrow_left_fill': IconChoice(
      name: 'square_arrow_left_fill',
      data: CupertinoIcons.square_arrow_left_fill,
      pack: 'cupertino'),
  'square_arrow_right': IconChoice(
      name: 'square_arrow_right',
      data: CupertinoIcons.square_arrow_right,
      pack: 'cupertino'),
  'square_arrow_right_fill': IconChoice(
      name: 'square_arrow_right_fill',
      data: CupertinoIcons.square_arrow_right_fill,
      pack: 'cupertino'),
  'square_arrow_up': IconChoice(
      name: 'square_arrow_up',
      data: CupertinoIcons.square_arrow_up,
      pack: 'cupertino'),
  'square_arrow_up_fill': IconChoice(
      name: 'square_arrow_up_fill',
      data: CupertinoIcons.square_arrow_up_fill,
      pack: 'cupertino'),
  'square_arrow_up_on_square': IconChoice(
      name: 'square_arrow_up_on_square',
      data: CupertinoIcons.square_arrow_up_on_square,
      pack: 'cupertino'),
  'square_arrow_up_on_square_fill': IconChoice(
      name: 'square_arrow_up_on_square_fill',
      data: CupertinoIcons.square_arrow_up_on_square_fill,
      pack: 'cupertino'),
  'square_favorites': IconChoice(
      name: 'square_favorites',
      data: CupertinoIcons.square_favorites,
      pack: 'cupertino'),
  'square_favorites_alt': IconChoice(
      name: 'square_favorites_alt',
      data: CupertinoIcons.square_favorites_alt,
      pack: 'cupertino'),
  'square_favorites_alt_fill': IconChoice(
      name: 'square_favorites_alt_fill',
      data: CupertinoIcons.square_favorites_alt_fill,
      pack: 'cupertino'),
  'square_favorites_fill': IconChoice(
      name: 'square_favorites_fill',
      data: CupertinoIcons.square_favorites_fill,
      pack: 'cupertino'),
  'square_fill': IconChoice(
      name: 'square_fill', data: CupertinoIcons.square_fill, pack: 'cupertino'),
  'square_fill_line_vertical_square': IconChoice(
      name: 'square_fill_line_vertical_square',
      data: CupertinoIcons.square_fill_line_vertical_square,
      pack: 'cupertino'),
  'square_fill_line_vertical_square_fill': IconChoice(
      name: 'square_fill_line_vertical_square_fill',
      data: CupertinoIcons.square_fill_line_vertical_square_fill,
      pack: 'cupertino'),
  'square_fill_on_circle_fill': IconChoice(
      name: 'square_fill_on_circle_fill',
      data: CupertinoIcons.square_fill_on_circle_fill,
      pack: 'cupertino'),
  'square_fill_on_square_fill': IconChoice(
      name: 'square_fill_on_square_fill',
      data: CupertinoIcons.square_fill_on_square_fill,
      pack: 'cupertino'),
  'square_grid_2x2': IconChoice(
      name: 'square_grid_2x2',
      data: CupertinoIcons.square_grid_2x2,
      pack: 'cupertino'),
  'square_grid_2x2_fill': IconChoice(
      name: 'square_grid_2x2_fill',
      data: CupertinoIcons.square_grid_2x2_fill,
      pack: 'cupertino'),
  'square_grid_3x2': IconChoice(
      name: 'square_grid_3x2',
      data: CupertinoIcons.square_grid_3x2,
      pack: 'cupertino'),
  'square_grid_3x2_fill': IconChoice(
      name: 'square_grid_3x2_fill',
      data: CupertinoIcons.square_grid_3x2_fill,
      pack: 'cupertino'),
  'square_grid_4x3_fill': IconChoice(
      name: 'square_grid_4x3_fill',
      data: CupertinoIcons.square_grid_4x3_fill,
      pack: 'cupertino'),
  'square_lefthalf_fill': IconChoice(
      name: 'square_lefthalf_fill',
      data: CupertinoIcons.square_lefthalf_fill,
      pack: 'cupertino'),
  'square_line_vertical_square': IconChoice(
      name: 'square_line_vertical_square',
      data: CupertinoIcons.square_line_vertical_square,
      pack: 'cupertino'),
  'square_line_vertical_square_fill': IconChoice(
      name: 'square_line_vertical_square_fill',
      data: CupertinoIcons.square_line_vertical_square_fill,
      pack: 'cupertino'),
  'square_list': IconChoice(
      name: 'square_list', data: CupertinoIcons.square_list, pack: 'cupertino'),
  'square_list_fill': IconChoice(
      name: 'square_list_fill',
      data: CupertinoIcons.square_list_fill,
      pack: 'cupertino'),
  'square_on_circle': IconChoice(
      name: 'square_on_circle',
      data: CupertinoIcons.square_on_circle,
      pack: 'cupertino'),
  'square_on_square': IconChoice(
      name: 'square_on_square',
      data: CupertinoIcons.square_on_square,
      pack: 'cupertino'),
  'square_pencil': IconChoice(
      name: 'square_pencil',
      data: CupertinoIcons.square_pencil,
      pack: 'cupertino'),
  'square_pencil_fill': IconChoice(
      name: 'square_pencil_fill',
      data: CupertinoIcons.square_pencil_fill,
      pack: 'cupertino'),
  'square_righthalf_fill': IconChoice(
      name: 'square_righthalf_fill',
      data: CupertinoIcons.square_righthalf_fill,
      pack: 'cupertino'),
  'square_split_1x2': IconChoice(
      name: 'square_split_1x2',
      data: CupertinoIcons.square_split_1x2,
      pack: 'cupertino'),
  'square_split_1x2_fill': IconChoice(
      name: 'square_split_1x2_fill',
      data: CupertinoIcons.square_split_1x2_fill,
      pack: 'cupertino'),
  'square_split_2x1': IconChoice(
      name: 'square_split_2x1',
      data: CupertinoIcons.square_split_2x1,
      pack: 'cupertino'),
  'square_split_2x1_fill': IconChoice(
      name: 'square_split_2x1_fill',
      data: CupertinoIcons.square_split_2x1_fill,
      pack: 'cupertino'),
  'square_split_2x2': IconChoice(
      name: 'square_split_2x2',
      data: CupertinoIcons.square_split_2x2,
      pack: 'cupertino'),
  'square_split_2x2_fill': IconChoice(
      name: 'square_split_2x2_fill',
      data: CupertinoIcons.square_split_2x2_fill,
      pack: 'cupertino'),
  'square_stack': IconChoice(
      name: 'square_stack',
      data: CupertinoIcons.square_stack,
      pack: 'cupertino'),
  'square_stack_3d_down_dottedline': IconChoice(
      name: 'square_stack_3d_down_dottedline',
      data: CupertinoIcons.square_stack_3d_down_dottedline,
      pack: 'cupertino'),
  'square_stack_3d_down_right': IconChoice(
      name: 'square_stack_3d_down_right',
      data: CupertinoIcons.square_stack_3d_down_right,
      pack: 'cupertino'),
  'square_stack_3d_down_right_fill': IconChoice(
      name: 'square_stack_3d_down_right_fill',
      data: CupertinoIcons.square_stack_3d_down_right_fill,
      pack: 'cupertino'),
  'square_stack_3d_up': IconChoice(
      name: 'square_stack_3d_up',
      data: CupertinoIcons.square_stack_3d_up,
      pack: 'cupertino'),
  'square_stack_3d_up_fill': IconChoice(
      name: 'square_stack_3d_up_fill',
      data: CupertinoIcons.square_stack_3d_up_fill,
      pack: 'cupertino'),
  'square_stack_3d_up_slash': IconChoice(
      name: 'square_stack_3d_up_slash',
      data: CupertinoIcons.square_stack_3d_up_slash,
      pack: 'cupertino'),
  'square_stack_3d_up_slash_fill': IconChoice(
      name: 'square_stack_3d_up_slash_fill',
      data: CupertinoIcons.square_stack_3d_up_slash_fill,
      pack: 'cupertino'),
  'square_stack_fill': IconChoice(
      name: 'square_stack_fill',
      data: CupertinoIcons.square_stack_fill,
      pack: 'cupertino'),
  'squares_below_rectangle': IconChoice(
      name: 'squares_below_rectangle',
      data: CupertinoIcons.squares_below_rectangle,
      pack: 'cupertino'),
  'star': IconChoice(
      name: 'star', data: CupertinoIcons.star, pack: 'cupertino'),
  'star_circle': IconChoice(
      name: 'star_circle', data: CupertinoIcons.star_circle, pack: 'cupertino'),
  'star_circle_fill': IconChoice(
      name: 'star_circle_fill',
      data: CupertinoIcons.star_circle_fill,
      pack: 'cupertino'),
  'star_fill': IconChoice(
      name: 'star_fill', data: CupertinoIcons.star_fill, pack: 'cupertino'),
  'star_lefthalf_fill': IconChoice(
      name: 'star_lefthalf_fill',
      data: CupertinoIcons.star_lefthalf_fill,
      pack: 'cupertino'),
  'star_slash': IconChoice(
      name: 'star_slash', data: CupertinoIcons.star_slash, pack: 'cupertino'),
  'star_slash_fill': IconChoice(
      name: 'star_slash_fill',
      data: CupertinoIcons.star_slash_fill,
      pack: 'cupertino'),
  'staroflife': IconChoice(
      name: 'staroflife', data: CupertinoIcons.staroflife, pack: 'cupertino'),
  'staroflife_fill': IconChoice(
      name: 'staroflife_fill',
      data: CupertinoIcons.staroflife_fill,
      pack: 'cupertino'),
  'stop': IconChoice(
      name: 'stop', data: CupertinoIcons.stop, pack: 'cupertino'),
  'stop_circle': IconChoice(
      name: 'stop_circle', data: CupertinoIcons.stop_circle, pack: 'cupertino'),
  'stop_circle_fill': IconChoice(
      name: 'stop_circle_fill',
      data: CupertinoIcons.stop_circle_fill,
      pack: 'cupertino'),
  'stop_fill': IconChoice(
      name: 'stop_fill', data: CupertinoIcons.stop_fill, pack: 'cupertino'),
  'stopwatch': IconChoice(
      name: 'stopwatch', data: CupertinoIcons.stopwatch, pack: 'cupertino'),
  'stopwatch_fill': IconChoice(
      name: 'stopwatch_fill',
      data: CupertinoIcons.stopwatch_fill,
      pack: 'cupertino'),
  'strikethrough': IconChoice(
      name: 'strikethrough',
      data: CupertinoIcons.strikethrough,
      pack: 'cupertino'),
  'suit_club': IconChoice(
      name: 'suit_club', data: CupertinoIcons.suit_club, pack: 'cupertino'),
  'suit_club_fill': IconChoice(
      name: 'suit_club_fill',
      data: CupertinoIcons.suit_club_fill,
      pack: 'cupertino'),
  'suit_diamond': IconChoice(
      name: 'suit_diamond',
      data: CupertinoIcons.suit_diamond,
      pack: 'cupertino'),
  'suit_diamond_fill': IconChoice(
      name: 'suit_diamond_fill',
      data: CupertinoIcons.suit_diamond_fill,
      pack: 'cupertino'),
  'suit_heart': IconChoice(
      name: 'suit_heart', data: CupertinoIcons.suit_heart, pack: 'cupertino'),
  'suit_heart_fill': IconChoice(
      name: 'suit_heart_fill',
      data: CupertinoIcons.suit_heart_fill,
      pack: 'cupertino'),
  'suit_spade': IconChoice(
      name: 'suit_spade', data: CupertinoIcons.suit_spade, pack: 'cupertino'),
  'suit_spade_fill': IconChoice(
      name: 'suit_spade_fill',
      data: CupertinoIcons.suit_spade_fill,
      pack: 'cupertino'),
  'sum':
      IconChoice(name: 'sum', data: CupertinoIcons.sum, pack: 'cupertino'),
  'sun_dust': IconChoice(
      name: 'sun_dust', data: CupertinoIcons.sun_dust, pack: 'cupertino'),
  'sun_dust_fill': IconChoice(
      name: 'sun_dust_fill',
      data: CupertinoIcons.sun_dust_fill,
      pack: 'cupertino'),
  'sun_haze': IconChoice(
      name: 'sun_haze', data: CupertinoIcons.sun_haze, pack: 'cupertino'),
  'sun_haze_fill': IconChoice(
      name: 'sun_haze_fill',
      data: CupertinoIcons.sun_haze_fill,
      pack: 'cupertino'),
  'sun_max': IconChoice(
      name: 'sun_max', data: CupertinoIcons.sun_max, pack: 'cupertino'),
  'sun_max_fill': IconChoice(
      name: 'sun_max_fill',
      data: CupertinoIcons.sun_max_fill,
      pack: 'cupertino'),
  'sun_min': IconChoice(
      name: 'sun_min', data: CupertinoIcons.sun_min, pack: 'cupertino'),
  'sun_min_fill': IconChoice(
      name: 'sun_min_fill',
      data: CupertinoIcons.sun_min_fill,
      pack: 'cupertino'),
  'sunrise': IconChoice(
      name: 'sunrise', data: CupertinoIcons.sunrise, pack: 'cupertino'),
  'sunrise_fill': IconChoice(
      name: 'sunrise_fill',
      data: CupertinoIcons.sunrise_fill,
      pack: 'cupertino'),
  'sunset': IconChoice(
      name: 'sunset', data: CupertinoIcons.sunset, pack: 'cupertino'),
  'sunset_fill': IconChoice(
      name: 'sunset_fill', data: CupertinoIcons.sunset_fill, pack: 'cupertino'),
  't_bubble': IconChoice(
      name: 't_bubble', data: CupertinoIcons.t_bubble, pack: 'cupertino'),
  't_bubble_fill': IconChoice(
      name: 't_bubble_fill',
      data: CupertinoIcons.t_bubble_fill,
      pack: 'cupertino'),
  'table': IconChoice(
      name: 'table', data: CupertinoIcons.table, pack: 'cupertino'),
  'table_badge_more': IconChoice(
      name: 'table_badge_more',
      data: CupertinoIcons.table_badge_more,
      pack: 'cupertino'),
  'table_badge_more_fill': IconChoice(
      name: 'table_badge_more_fill',
      data: CupertinoIcons.table_badge_more_fill,
      pack: 'cupertino'),
  'table_fill': IconChoice(
      name: 'table_fill', data: CupertinoIcons.table_fill, pack: 'cupertino'),
  'tag_circle': IconChoice(
      name: 'tag_circle', data: CupertinoIcons.tag_circle, pack: 'cupertino'),
  'tag_circle_fill': IconChoice(
      name: 'tag_circle_fill',
      data: CupertinoIcons.tag_circle_fill,
      pack: 'cupertino'),
  'tag_fill': IconChoice(
      name: 'tag_fill', data: CupertinoIcons.tag_fill, pack: 'cupertino'),
  'text_aligncenter': IconChoice(
      name: 'text_aligncenter',
      data: CupertinoIcons.text_aligncenter,
      pack: 'cupertino'),
  'text_alignleft': IconChoice(
      name: 'text_alignleft',
      data: CupertinoIcons.text_alignleft,
      pack: 'cupertino'),
  'text_alignright': IconChoice(
      name: 'text_alignright',
      data: CupertinoIcons.text_alignright,
      pack: 'cupertino'),
  'text_append': IconChoice(
      name: 'text_append', data: CupertinoIcons.text_append, pack: 'cupertino'),
  'text_badge_checkmark': IconChoice(
      name: 'text_badge_checkmark',
      data: CupertinoIcons.text_badge_checkmark,
      pack: 'cupertino'),
  'text_badge_minus': IconChoice(
      name: 'text_badge_minus',
      data: CupertinoIcons.text_badge_minus,
      pack: 'cupertino'),
  'text_badge_plus': IconChoice(
      name: 'text_badge_plus',
      data: CupertinoIcons.text_badge_plus,
      pack: 'cupertino'),
  'text_badge_star': IconChoice(
      name: 'text_badge_star',
      data: CupertinoIcons.text_badge_star,
      pack: 'cupertino'),
  'text_badge_xmark': IconChoice(
      name: 'text_badge_xmark',
      data: CupertinoIcons.text_badge_xmark,
      pack: 'cupertino'),
  'text_bubble': IconChoice(
      name: 'text_bubble', data: CupertinoIcons.text_bubble, pack: 'cupertino'),
  'text_bubble_fill': IconChoice(
      name: 'text_bubble_fill',
      data: CupertinoIcons.text_bubble_fill,
      pack: 'cupertino'),
  'text_cursor': IconChoice(
      name: 'text_cursor', data: CupertinoIcons.text_cursor, pack: 'cupertino'),
  'text_insert': IconChoice(
      name: 'text_insert', data: CupertinoIcons.text_insert, pack: 'cupertino'),
  'text_justify': IconChoice(
      name: 'text_justify',
      data: CupertinoIcons.text_justify,
      pack: 'cupertino'),
  'text_justifyleft': IconChoice(
      name: 'text_justifyleft',
      data: CupertinoIcons.text_justifyleft,
      pack: 'cupertino'),
  'text_justifyright': IconChoice(
      name: 'text_justifyright',
      data: CupertinoIcons.text_justifyright,
      pack: 'cupertino'),
  'text_quote': IconChoice(
      name: 'text_quote', data: CupertinoIcons.text_quote, pack: 'cupertino'),
  'textbox': IconChoice(
      name: 'textbox', data: CupertinoIcons.textbox, pack: 'cupertino'),
  'textformat': IconChoice(
      name: 'textformat', data: CupertinoIcons.textformat, pack: 'cupertino'),
  'textformat_123': IconChoice(
      name: 'textformat_123',
      data: CupertinoIcons.textformat_123,
      pack: 'cupertino'),
  'textformat_abc': IconChoice(
      name: 'textformat_abc',
      data: CupertinoIcons.textformat_abc,
      pack: 'cupertino'),
  'textformat_abc_dottedunderline': IconChoice(
      name: 'textformat_abc_dottedunderline',
      data: CupertinoIcons.textformat_abc_dottedunderline,
      pack: 'cupertino'),
  'textformat_alt': IconChoice(
      name: 'textformat_alt',
      data: CupertinoIcons.textformat_alt,
      pack: 'cupertino'),
  'textformat_size': IconChoice(
      name: 'textformat_size',
      data: CupertinoIcons.textformat_size,
      pack: 'cupertino'),
  'textformat_subscript': IconChoice(
      name: 'textformat_subscript',
      data: CupertinoIcons.textformat_subscript,
      pack: 'cupertino'),
  'textformat_superscript': IconChoice(
      name: 'textformat_superscript',
      data: CupertinoIcons.textformat_superscript,
      pack: 'cupertino'),
  'thermometer': IconChoice(
      name: 'thermometer', data: CupertinoIcons.thermometer, pack: 'cupertino'),
  'thermometer_snowflake': IconChoice(
      name: 'thermometer_snowflake',
      data: CupertinoIcons.thermometer_snowflake,
      pack: 'cupertino'),
  'thermometer_sun': IconChoice(
      name: 'thermometer_sun',
      data: CupertinoIcons.thermometer_sun,
      pack: 'cupertino'),
  'ticket': IconChoice(
      name: 'ticket', data: CupertinoIcons.ticket, pack: 'cupertino'),
  'ticket_fill': IconChoice(
      name: 'ticket_fill', data: CupertinoIcons.ticket_fill, pack: 'cupertino'),
  'tickets': IconChoice(
      name: 'tickets', data: CupertinoIcons.tickets, pack: 'cupertino'),
  'tickets_fill': IconChoice(
      name: 'tickets_fill',
      data: CupertinoIcons.tickets_fill,
      pack: 'cupertino'),
  'timelapse': IconChoice(
      name: 'timelapse', data: CupertinoIcons.timelapse, pack: 'cupertino'),
  'timer': IconChoice(
      name: 'timer', data: CupertinoIcons.timer, pack: 'cupertino'),
  'timer_fill': IconChoice(
      name: 'timer_fill', data: CupertinoIcons.timer_fill, pack: 'cupertino'),
  'today': IconChoice(
      name: 'today', data: CupertinoIcons.today, pack: 'cupertino'),
  'today_fill': IconChoice(
      name: 'today_fill', data: CupertinoIcons.today_fill, pack: 'cupertino'),
  'tornado': IconChoice(
      name: 'tornado', data: CupertinoIcons.tornado, pack: 'cupertino'),
  'tortoise': IconChoice(
      name: 'tortoise', data: CupertinoIcons.tortoise, pack: 'cupertino'),
  'tortoise_fill': IconChoice(
      name: 'tortoise_fill',
      data: CupertinoIcons.tortoise_fill,
      pack: 'cupertino'),
  'tram_fill': IconChoice(
      name: 'tram_fill', data: CupertinoIcons.tram_fill, pack: 'cupertino'),
  'trash': IconChoice(
      name: 'trash', data: CupertinoIcons.trash, pack: 'cupertino'),
  'trash_circle': IconChoice(
      name: 'trash_circle',
      data: CupertinoIcons.trash_circle,
      pack: 'cupertino'),
  'trash_circle_fill': IconChoice(
      name: 'trash_circle_fill',
      data: CupertinoIcons.trash_circle_fill,
      pack: 'cupertino'),
  'trash_fill': IconChoice(
      name: 'trash_fill', data: CupertinoIcons.trash_fill, pack: 'cupertino'),
  'trash_slash': IconChoice(
      name: 'trash_slash', data: CupertinoIcons.trash_slash, pack: 'cupertino'),
  'trash_slash_fill': IconChoice(
      name: 'trash_slash_fill',
      data: CupertinoIcons.trash_slash_fill,
      pack: 'cupertino'),
  'tray': IconChoice(
      name: 'tray', data: CupertinoIcons.tray, pack: 'cupertino'),
  'tray_2': IconChoice(
      name: 'tray_2', data: CupertinoIcons.tray_2, pack: 'cupertino'),
  'tray_2_fill': IconChoice(
      name: 'tray_2_fill', data: CupertinoIcons.tray_2_fill, pack: 'cupertino'),
  'tray_arrow_down': IconChoice(
      name: 'tray_arrow_down',
      data: CupertinoIcons.tray_arrow_down,
      pack: 'cupertino'),
  'tray_arrow_down_fill': IconChoice(
      name: 'tray_arrow_down_fill',
      data: CupertinoIcons.tray_arrow_down_fill,
      pack: 'cupertino'),
  'tray_arrow_up': IconChoice(
      name: 'tray_arrow_up',
      data: CupertinoIcons.tray_arrow_up,
      pack: 'cupertino'),
  'tray_arrow_up_fill': IconChoice(
      name: 'tray_arrow_up_fill',
      data: CupertinoIcons.tray_arrow_up_fill,
      pack: 'cupertino'),
  'tray_fill': IconChoice(
      name: 'tray_fill', data: CupertinoIcons.tray_fill, pack: 'cupertino'),
  'tray_full': IconChoice(
      name: 'tray_full', data: CupertinoIcons.tray_full, pack: 'cupertino'),
  'tray_full_fill': IconChoice(
      name: 'tray_full_fill',
      data: CupertinoIcons.tray_full_fill,
      pack: 'cupertino'),
  'tree': IconChoice(
      name: 'tree', data: CupertinoIcons.tree, pack: 'cupertino'),
  'triangle': IconChoice(
      name: 'triangle', data: CupertinoIcons.triangle, pack: 'cupertino'),
  'triangle_fill': IconChoice(
      name: 'triangle_fill',
      data: CupertinoIcons.triangle_fill,
      pack: 'cupertino'),
  'triangle_lefthalf_fill': IconChoice(
      name: 'triangle_lefthalf_fill',
      data: CupertinoIcons.triangle_lefthalf_fill,
      pack: 'cupertino'),
  'triangle_righthalf_fill': IconChoice(
      name: 'triangle_righthalf_fill',
      data: CupertinoIcons.triangle_righthalf_fill,
      pack: 'cupertino'),
  'tropicalstorm': IconChoice(
      name: 'tropicalstorm',
      data: CupertinoIcons.tropicalstorm,
      pack: 'cupertino'),
  'tuningfork': IconChoice(
      name: 'tuningfork', data: CupertinoIcons.tuningfork, pack: 'cupertino'),
  'tv': IconChoice(name: 'tv', data: CupertinoIcons.tv, pack: 'cupertino'),
  'tv_circle': IconChoice(
      name: 'tv_circle', data: CupertinoIcons.tv_circle, pack: 'cupertino'),
  'tv_circle_fill': IconChoice(
      name: 'tv_circle_fill',
      data: CupertinoIcons.tv_circle_fill,
      pack: 'cupertino'),
  'tv_fill': IconChoice(
      name: 'tv_fill', data: CupertinoIcons.tv_fill, pack: 'cupertino'),
  'tv_music_note': IconChoice(
      name: 'tv_music_note',
      data: CupertinoIcons.tv_music_note,
      pack: 'cupertino'),
  'tv_music_note_fill': IconChoice(
      name: 'tv_music_note_fill',
      data: CupertinoIcons.tv_music_note_fill,
      pack: 'cupertino'),
  'uiwindow_split_2x1': IconChoice(
      name: 'uiwindow_split_2x1',
      data: CupertinoIcons.uiwindow_split_2x1,
      pack: 'cupertino'),
  'umbrella': IconChoice(
      name: 'umbrella', data: CupertinoIcons.umbrella, pack: 'cupertino'),
  'umbrella_fill': IconChoice(
      name: 'umbrella_fill',
      data: CupertinoIcons.umbrella_fill,
      pack: 'cupertino'),
  'underline': IconChoice(
      name: 'underline', data: CupertinoIcons.underline, pack: 'cupertino'),
  'upload_circle': IconChoice(
      name: 'upload_circle',
      data: CupertinoIcons.upload_circle,
      pack: 'cupertino'),
  'upload_circle_fill': IconChoice(
      name: 'upload_circle_fill',
      data: CupertinoIcons.upload_circle_fill,
      pack: 'cupertino'),
  'videocam': IconChoice(
      name: 'videocam', data: CupertinoIcons.videocam, pack: 'cupertino'),
  'videocam_circle': IconChoice(
      name: 'videocam_circle',
      data: CupertinoIcons.videocam_circle,
      pack: 'cupertino'),
  'videocam_circle_fill': IconChoice(
      name: 'videocam_circle_fill',
      data: CupertinoIcons.videocam_circle_fill,
      pack: 'cupertino'),
  'videocam_fill': IconChoice(
      name: 'videocam_fill',
      data: CupertinoIcons.videocam_fill,
      pack: 'cupertino'),
  'view_2d': IconChoice(
      name: 'view_2d', data: CupertinoIcons.view_2d, pack: 'cupertino'),
  'view_3d': IconChoice(
      name: 'view_3d', data: CupertinoIcons.view_3d, pack: 'cupertino'),
  'viewfinder': IconChoice(
      name: 'viewfinder', data: CupertinoIcons.viewfinder, pack: 'cupertino'),
  'viewfinder_circle': IconChoice(
      name: 'viewfinder_circle',
      data: CupertinoIcons.viewfinder_circle,
      pack: 'cupertino'),
  'viewfinder_circle_fill': IconChoice(
      name: 'viewfinder_circle_fill',
      data: CupertinoIcons.viewfinder_circle_fill,
      pack: 'cupertino'),
  'wand_rays': IconChoice(
      name: 'wand_rays', data: CupertinoIcons.wand_rays, pack: 'cupertino'),
  'wand_rays_inverse': IconChoice(
      name: 'wand_rays_inverse',
      data: CupertinoIcons.wand_rays_inverse,
      pack: 'cupertino'),
  'wand_stars': IconChoice(
      name: 'wand_stars', data: CupertinoIcons.wand_stars, pack: 'cupertino'),
  'wand_stars_inverse': IconChoice(
      name: 'wand_stars_inverse',
      data: CupertinoIcons.wand_stars_inverse,
      pack: 'cupertino'),
  'waveform': IconChoice(
      name: 'waveform', data: CupertinoIcons.waveform, pack: 'cupertino'),
  'waveform_circle': IconChoice(
      name: 'waveform_circle',
      data: CupertinoIcons.waveform_circle,
      pack: 'cupertino'),
  'waveform_circle_fill': IconChoice(
      name: 'waveform_circle_fill',
      data: CupertinoIcons.waveform_circle_fill,
      pack: 'cupertino'),
  'waveform_path': IconChoice(
      name: 'waveform_path',
      data: CupertinoIcons.waveform_path,
      pack: 'cupertino'),
  'waveform_path_badge_minus': IconChoice(
      name: 'waveform_path_badge_minus',
      data: CupertinoIcons.waveform_path_badge_minus,
      pack: 'cupertino'),
  'waveform_path_badge_plus': IconChoice(
      name: 'waveform_path_badge_plus',
      data: CupertinoIcons.waveform_path_badge_plus,
      pack: 'cupertino'),
  'waveform_path_ecg': IconChoice(
      name: 'waveform_path_ecg',
      data: CupertinoIcons.waveform_path_ecg,
      pack: 'cupertino'),
  'wifi': IconChoice(
      name: 'wifi', data: CupertinoIcons.wifi, pack: 'cupertino'),
  'wifi_exclamationmark': IconChoice(
      name: 'wifi_exclamationmark',
      data: CupertinoIcons.wifi_exclamationmark,
      pack: 'cupertino'),
  'wifi_slash': IconChoice(
      name: 'wifi_slash', data: CupertinoIcons.wifi_slash, pack: 'cupertino'),
  'wind': IconChoice(
      name: 'wind', data: CupertinoIcons.wind, pack: 'cupertino'),
  'wind_snow': IconChoice(
      name: 'wind_snow', data: CupertinoIcons.wind_snow, pack: 'cupertino'),
  'wrench': IconChoice(
      name: 'wrench', data: CupertinoIcons.wrench, pack: 'cupertino'),
  'wrench_fill': IconChoice(
      name: 'wrench_fill', data: CupertinoIcons.wrench_fill, pack: 'cupertino'),
  'xmark': IconChoice(
      name: 'xmark', data: CupertinoIcons.xmark, pack: 'cupertino'),
  'xmark_circle': IconChoice(
      name: 'xmark_circle',
      data: CupertinoIcons.xmark_circle,
      pack: 'cupertino'),
  'xmark_circle_fill': IconChoice(
      name: 'xmark_circle_fill',
      data: CupertinoIcons.xmark_circle_fill,
      pack: 'cupertino'),
  'xmark_octagon': IconChoice(
      name: 'xmark_octagon',
      data: CupertinoIcons.xmark_octagon,
      pack: 'cupertino'),
  'xmark_octagon_fill': IconChoice(
      name: 'xmark_octagon_fill',
      data: CupertinoIcons.xmark_octagon_fill,
      pack: 'cupertino'),
  'xmark_rectangle': IconChoice(
      name: 'xmark_rectangle',
      data: CupertinoIcons.xmark_rectangle,
      pack: 'cupertino'),
  'xmark_rectangle_fill': IconChoice(
      name: 'xmark_rectangle_fill',
      data: CupertinoIcons.xmark_rectangle_fill,
      pack: 'cupertino'),
  'xmark_seal': IconChoice(
      name: 'xmark_seal', data: CupertinoIcons.xmark_seal, pack: 'cupertino'),
  'xmark_seal_fill': IconChoice(
      name: 'xmark_seal_fill',
      data: CupertinoIcons.xmark_seal_fill,
      pack: 'cupertino'),
  'xmark_shield': IconChoice(
      name: 'xmark_shield',
      data: CupertinoIcons.xmark_shield,
      pack: 'cupertino'),
  'xmark_shield_fill': IconChoice(
      name: 'xmark_shield_fill',
      data: CupertinoIcons.xmark_shield_fill,
      pack: 'cupertino'),
  'xmark_square': IconChoice(
      name: 'xmark_square',
      data: CupertinoIcons.xmark_square,
      pack: 'cupertino'),
  'xmark_square_fill': IconChoice(
      name: 'xmark_square_fill',
      data: CupertinoIcons.xmark_square_fill,
      pack: 'cupertino'),
  'zoom_in': IconChoice(
      name: 'zoom_in', data: CupertinoIcons.zoom_in, pack: 'cupertino'),
  'zoom_out': IconChoice(
      name: 'zoom_out', data: CupertinoIcons.zoom_out, pack: 'cupertino'),
  'zzz':
      IconChoice(name: 'zzz', data: CupertinoIcons.zzz, pack: 'cupertino'),
};
