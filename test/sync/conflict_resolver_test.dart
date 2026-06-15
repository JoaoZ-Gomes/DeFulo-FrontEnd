import 'package:flutter_test/flutter_test.dart';
import 'package:defulo/core/sync/conflict/conflict_resolver.dart';

void main() {
  group('ConflictResolutionStrategies', () {
    group('LastWriteWinsResolver', () {
      late LastWriteWinsResolver resolver;

      setUp(() {
        resolver = LastWriteWinsResolver();
      });

      test('should resolve to local data when local is newer', () async {
        final localData = {'nome': 'Talhão A - Atualizado', 'area': '10.5'};
        final remoteData = {'nome': 'Talhão A', 'area': '10.0'};
        final localTime = '2026-05-29T15:00:00Z';
        final remoteTime = '2026-05-29T14:00:00Z';

        final result = await resolver.resolve(
          localData: localData,
          remoteData: remoteData,
          localVersion: 1,
          remoteVersion: 1,
          localUpdatedAt: localTime,
          remoteUpdatedAt: remoteTime,
          entityType: 'talhao',
        );

        expect(result.winner, 'local');
        expect(result.resolvedData, localData);
        expect(result.discardedData, remoteData);
      });

      test('should resolve to remote data when remote is newer', () async {
        final localData = {'nome': 'Talhão A', 'area': '10.0'};
        final remoteData = {'nome': 'Talhão A - Atualizado', 'area': '10.5'};
        final localTime = '2026-05-29T14:00:00Z';
        final remoteTime = '2026-05-29T15:00:00Z';

        final result = await resolver.resolve(
          localData: localData,
          remoteData: remoteData,
          localVersion: 1,
          remoteVersion: 1,
          localUpdatedAt: localTime,
          remoteUpdatedAt: remoteTime,
          entityType: 'talhao',
        );

        expect(result.winner, 'remote');
        expect(result.resolvedData, remoteData);
        expect(result.discardedData, localData);
      });

      test('should resolve to remote when timestamps are equal', () async {
        final timestamp = '2026-05-29T15:00:00Z';
        final localData = {'nome': 'Talhão A'};
        final remoteData = {'nome': 'Talhão A'};

        final result = await resolver.resolve(
          localData: localData,
          remoteData: remoteData,
          localVersion: 1,
          remoteVersion: 1,
          localUpdatedAt: timestamp,
          remoteUpdatedAt: timestamp,
          entityType: 'talhao',
        );

        expect(result.winner, 'remote');
      });
    });

    group('ServerWinsResolver', () {
      late ServerWinsResolver resolver;

      setUp(() {
        resolver = ServerWinsResolver();
      });

      test('should always resolve to remote data', () async {
        final localData = {'nome': 'Talhão A - Local'};
        final remoteData = {'nome': 'Talhão A - Remoto'};

        final result = await resolver.resolve(
          localData: localData,
          remoteData: remoteData,
          localVersion: 1,
          remoteVersion: 2,
          localUpdatedAt: '2026-05-29T15:00:00Z',
          remoteUpdatedAt: '2026-05-29T14:00:00Z',  // Mesmo se local é mais novo
          entityType: 'fazenda',
        );

        expect(result.winner, 'remote');
        expect(result.resolvedData, remoteData);
      });
    });

    group('ClientWinsResolver', () {
      late ClientWinsResolver resolver;

      setUp(() {
        resolver = ClientWinsResolver();
      });

      test('should always resolve to local data', () async {
        final localData = {'nome': 'Talhão A - Local'};
        final remoteData = {'nome': 'Talhão A - Remoto'};

        final result = await resolver.resolve(
          localData: localData,
          remoteData: remoteData,
          localVersion: 1,
          remoteVersion: 2,
          localUpdatedAt: '2026-05-29T14:00:00Z',
          remoteUpdatedAt: '2026-05-29T15:00:00Z',  // Mesmo se remoto é mais novo
          entityType: 'talhao',
        );

        expect(result.winner, 'local');
        expect(result.resolvedData, localData);
      });
    });

    group('ConflictResolverFactory', () {
      test('should use LastWriteWins for talhao by default', () {
        final resolver = ConflictResolverFactory.getDefaultResolver('talhao');
        expect(resolver, isA<LastWriteWinsResolver>());
      });

      test('should use ServerWins for usuario by default', () {
        final resolver = ConflictResolverFactory.getDefaultResolver('usuario');
        expect(resolver, isA<ServerWinsResolver>());
      });

      test('should use ServerWins for fazenda by default', () {
        final resolver = ConflictResolverFactory.getDefaultResolver('fazenda');
        expect(resolver, isA<ServerWinsResolver>());
      });

      test('should use LastWriteWins for evento by default', () {
        final resolver = ConflictResolverFactory.getDefaultResolver('evento');
        expect(resolver, isA<LastWriteWinsResolver>());
      });
    });

    group('ManualMergeResolver', () {
      late ManualMergeResolver resolver;

      setUp(() {
        resolver = ManualMergeResolver();
      });

      test('should identify conflicting fields correctly', () {
        final localData = {
          'nome': 'Talhão A',
          'area': '15.5',
          'cultura': 'Milho',
        };
        final remoteData = {
          'nome': 'Talhão A',
          'area': '16.0',  // Diferente
          'cultura': 'Soja',  // Diferente
          'status': 'ATIVA',  // Existe apenas no remoto
        };

        final conflicts = resolver.findConflictingFields(localData, remoteData);

        expect(conflicts.length, 3);
        expect(conflicts.containsKey('area'), true);
        expect(conflicts.containsKey('cultura'), true);
        expect(conflicts.containsKey('status'), true);
      });

      test('should not identify non-conflicting fields', () {
        final localData = {
          'nome': 'Talhão A',
          'area': '15.5',
        };
        final remoteData = {
          'nome': 'Talhão A',
          'area': '15.5',
        };

        final conflicts = resolver.findConflictingFields(localData, remoteData);

        expect(conflicts.isEmpty, true);
      });
    });
  });
}
