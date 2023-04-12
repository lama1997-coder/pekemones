import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:peko_application/data/exception.dart';
import 'package:peko_application/data/models/pekemones_model.dart';
import 'package:peko_application/domin/entities/pekemons.dart';
import 'package:peko_application/data/failure.dart';
import 'package:either_dart/src/either.dart';
import 'package:peko_application/domin/repositories/pekemones_repository.dart';

import '../datasources/remote_data_source.dart';

class PekemonsRepositoryImpl extends PekemonsRepository {
  final RemoteDataSource remoteDataSource;

  PekemonsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<PekemonsModel>>> getPekemones() async {
    try {
      int count = 5;
      int pokeIndex;
      Random rnd;
      List<PekemonsModel> listPfBekemons = [];
      int min = 1;
      int max = 893;
      for (int i = 0; i < count; i++) {
        rnd =  Random();
        pokeIndex = min + rnd.nextInt(max - min);
        final result = await remoteDataSource.httpRequest(
            url: "api/v2/pokemon/$pokeIndex");
        listPfBekemons.add(PekemonsModel.fromJson(result.data));
      }
      return Right(listPfBekemons);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
