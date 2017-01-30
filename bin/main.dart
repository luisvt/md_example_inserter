import 'dart:io';

import 'package:glob/glob.dart';
import 'package:path/path.dart';

main() {
  final mdtmplGlob = new Glob("**.mdtmpl");

  for (File inputFile in mdtmplGlob.listSync()) {
    var inputFileContent = inputFile.readAsStringSync();

    var result = inputFileContent.replaceAllMapped(new RegExp(r'\{@example (.+\.(.+))\}'), (match) {

      String filePath = match.group(1);
      String fileExtension = match.group(2);

      File file = new File(isAbsolute(filePath) ? filePath : join(dirname(inputFile.path), filePath));
      String fileContent = file.readAsStringSync();
      return '''```$fileExtension
$fileContent
```''';
    });

    var outputFile = new File(withoutExtension(inputFile.path) + '.md');
    outputFile.writeAsStringSync(result);
  }
}