import 'package:either_dart/either.dart';
import 'package:peko_application/data/failure.dart';
import 'package:peko_application/data/models/pekemones_model.dart';
import 'package:peko_application/domin/entities/pekemons.dart';
import 'package:peko_application/domin/repositories/pekemones_repository.dart';

class GetPekemoens {
  final PekemonsRepository pekemonsRepository;
  GetPekemoens(this.pekemonsRepository);
  Future<Either<Failure, List<PekemonsModel>>> homePageData() {
    return pekemonsRepository.getPekemones();
  }
}
