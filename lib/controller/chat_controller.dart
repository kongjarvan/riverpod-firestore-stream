//provider
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_stream/domain/chat/chat_firestore_repository.dart';
import 'package:riverpod_firestore_stream/dto/chat/chat_req_dto.dart';

final chatControllerProvider = Provider((ref) {
  return ChatController(ref);
});

class ChatController {
  Ref _ref;
  ChatController(this._ref);

  void findAllStream() {}

  void insert(ChatInsertReqDto dto) {
    Future<DocumentReference> futureDoc = _ref.read(chatFirestoreRepositoryProvider).insert(dto);

    futureDoc.then((value) {
      print("디버그: ${value.id}");
      // 여기서는 화면이동
      // Navigator.pushNamed(context, Routes.login.path); 화면이 겹쳐짐(스택추가)
      // Navigator.popAndPushNamed(context, Routes.login.path);로그인창 꺼내서 버림(스택제거)
      // Navigator.pop(context); 현재화면에서 빠져나옴
      // Navigator.pushAndRemoveUntil(context, Routes.login.path, (route) => false); 모든페이지 제거후 첫페이지로 이동
    }).onError((error, stackTrace) {
      print("error : ${error}");
      // 여기서는 경고장 (에러메세지)
    });
    // 오브젝트 타입
  }
}
