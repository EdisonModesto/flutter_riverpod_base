import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_db.g.dart';

@riverpod
SupabaseDb supabaseDb(Ref ref) => SupabaseDb();

class SupabaseDb {
  final SupabaseClient supabase = Supabase.instance.client;

  //* Create a new user
  Future<Either<String, Unit>> createUser(String email, String password) async {
    try {
      final result = await supabase.from('users').insert({
        'email': email,
        'password': password,
      });
      return Right(result);
    } on AuthException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  //* Fetch the current user
  Future<Either<String, PostgrestMap>> getUser(String id) async {
    try {
      final result = await supabase
          .from('users')
          .select('*')
          .eq('id', id)
          .single();
      return Right(result);
    } on AuthException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
