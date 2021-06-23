import 'package:flutter/cupertino.dart';
import 'package:flutter_app/core/utils/my_shared_pref.dart';

/**
 * Created by venkateshmurthytp on 23,June,2021
 */
abstract class LocalDataSource {}

class LocalDataSourceImpl extends LocalDataSource {
  final MySharedPref mySharedPref;

  LocalDataSourceImpl({@required this.mySharedPref});
}
