part of 'base_list_repository.dart';

class ReaderListRepository extends BaseListRepository<Reader> {
  @override
  Future<List<Reader>> _fetchData() async {
    return Future.value(List.generate(
        3,
        (index) => Reader(
            id: index,
            name: "Hoàng Hữu My",
            studentCode: '400000',
            university: "UIT",
            gender: "Name")));

    ///real function
    // final List mapData = await _service.fetchInfo('/student-management/students');
    // return mapData.map((e) => Reader.fromMap(e)).toList();
  }

  @override
  Future<List<Reader>> updateInfo(Reader modal) async {
    // final isSuccess = await _service.updateInfo('/student-management/student/${modal.id}',
    //     updateMap: modal.toMap());

    // if (isSuccess) {
    //   _replace(modal);
    // }
    return _info!;
  }

  @override
  Future<List<Reader>> createNew(Reader modal) async {
    // final response =
    //     await _service.createNewInfo('/student-management/student', newMapInfo: modal.toMap());
    // _addItem(Reader.fromMap(response));
    return _info!;
  }

  @override
  Future<List<Reader>> delete(int id) async {
    // final isSuccess =
    //     await _service.deleteInfo('/student-management/student/$id', id: id.toString());
    // if (isSuccess) {
    //   _deleteItem(id);
    // }
    return _info!;
  }
}
