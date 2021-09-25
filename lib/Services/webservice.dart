import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test/models/dose_model.dart';
import 'package:test/utils/constants.dart';


class WebService {

  // hit the url and get the json data
  Future<AssociatedDrug> fetchDoseData() async {
    var returnObj;
    final response = await http.get(Uri.parse(Constants.TOP_URL));
    if (response.statusCode == 200) {
      var result = response.body;
      var lst = Dose.fromJson(json.decode(result));
      //filter data
      for (var i = 0; i < lst.problems!.length; i++) {
        for (var j = 0; j < lst.problems![i].diabetes!.length; j++) {
          for (var k = 0;
              k < lst.problems![i].diabetes![j].medications!.length;
              k++) {
            for (var l = 0;
                l <
                    lst.problems![i].diabetes![j].medications![k]
                        .medicationsClasses!.length;
                l++) {
              for (var m = 0;
                  m <
                      lst.problems![i].diabetes![j].medications![k]
                          .medicationsClasses![l].className!.length;
                  m++) {
                for (var n = 0;
                    n <
                        lst
                            .problems![i]
                            .diabetes![j]
                            .medications![k]
                            .medicationsClasses![l]
                            .className![m]
                            .associatedDrug!
                            .length;
                    n++) {
                  returnObj = lst.problems![i].diabetes![j].medications![k]
                      .medicationsClasses![l].className![m].associatedDrug![n];
                 
                }
              }
            }
          }
        }
      }
      return returnObj;
    } else {
      throw Exception("Failled to get top news");
    }
  }
}
