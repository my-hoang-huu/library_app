part of 'base_list_repository.dart';

class BookListRepository extends BaseListRepository<Book> {
  @override
  Future<List<Book>> _fetchData() async {
    return Future.value(List.generate(
        3,
        (index) => Book(
            description:
                "A book description is a short summary of a book's story or content that is designed to “hook” a reader and lead to a sale. Typically, the book's description conveys important information about its topic or focus (in nonfiction) or the plot and tone (for a novel or any other piece of fiction",
            id: index,
            image: "assets/images/book01.png",
            name: "test",
            price: 2,
            pageCount: 200,
            isPopular: true,
            author: "My")));

    ///real function
    // final List mapData = await _service.fetchInfo('/book-management/books');
    // if (kDebugMode) {
    //   print(["base_repository: ", mapData]);
    // }
    // return mapData.map((e) => Book.fromMap(e)).toList();
  }

  @override
  Future<List<Book>> updateInfo(Book modal) async {
    //fake
    return _info!;

    // final isSuccess =
    //     await _service.updateInfo('/book-management/book/${modal.id}', updateMap: modal.toMap());
    // if (kDebugMode) {
    //   print(["base_repository: ", isSuccess]);
    // }
    // if (isSuccess) {
    //   _replace(modal);
    // }
    // return _info!;
  }

  @override
  Future<List<Book>> createNew(Book modal) async {
    // final response =
    //     await _service.createNewInfo('/book-management/book', newMapInfo: modal.toMap());
    // if (kDebugMode) {
    //   print(["base_repository: |||||||||||| ", response]);
    // }
    // _addItem(Book.fromMap(response));
    return _info!;
  }

  @override
  Future<List<Book>> delete(int id) async {
    // final isSuccess = await _service.deleteInfo('/book-management/book/$id', id: id.toString());
    // if (isSuccess) {
    //   _deleteItem(id);
    // }
    return _info!;
  }
}
