import 'package:dio/dio.dart';
import 'package:movies_app/service/dio_service.dart';

class DioServiceImplementation implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: "https://api.themoviedb.org/4/",
        headers: {
          'contentType': 'application/json; charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMjBhOWY0NWZhZGY1M2I2NzljZGI2MDFmNmY5ODEyNSIsInN1YiI6IjYxODk4YmRkMTYwZTczMDA2NzU0MmQ0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lc4T9V-qce-g841Nn2UN8nWVBPMF9EQzYYcUFNQuvlU'
        }
      ),
    );
  }
}
