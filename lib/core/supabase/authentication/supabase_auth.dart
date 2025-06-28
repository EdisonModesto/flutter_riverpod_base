import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_auth.g.dart';

@riverpod
SupabaseAuth supabaseAuth(Ref ref) => SupabaseAuth();

class SupabaseAuth {
  final SupabaseClient supabase = Supabase.instance.client;

  //* Sign up with email and password
  Future<Either<String, AuthResponse>> signUpEmail(
    String email,
    String password,
  ) async {
    try {
      final credential = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      return Right(credential);
    } on AuthException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  //* Sign in with email and password
  Future<Either<String, AuthResponse>> signInEmail(
    String email,
    String password,
  ) async {
    try {
      final credential = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return Right(credential);
    } on AuthException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  //* Sign out
  Future<Either<String, Unit>> signOut() async {
    try {
      await supabase.auth.signOut();
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
