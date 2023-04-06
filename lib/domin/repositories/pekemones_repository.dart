import 'package:either_dart/either.dart';
import 'package:peko_application/data/failure.dart';
import 'package:peko_application/data/models/pekemones_model.dart';
import 'package:peko_application/domin/entities/pekemons.dart';

abstract class PekemonsRepository {
  Future<Either<Failure, List<PekemonsModel>>> getPekemones();
}
