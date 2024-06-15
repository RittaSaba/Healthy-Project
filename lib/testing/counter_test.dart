import 'package:temp_task2/testing/counter_class.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // test('check if increment works', () {
  //   final Counter obj = Counter();
  //   obj.increment();
  //   expect(obj.counter, 3);
  // });
  group('check if ll methods on counter works', () {
    final Counter obj=Counter();
    test ('check if increment works',(){
      obj.increment();
      expect(obj.counter,1);
    }) ;



    });



}
