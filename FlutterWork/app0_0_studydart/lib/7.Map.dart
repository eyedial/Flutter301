// Map > {}형태 > key:value 매칭
void main() {
  Map<String, String> muhan = {
    'aaa': '가',
    'bbb': '나',
    'ccc': '다',
  };
  Map<int, String> bang = {
    1: 'aaa',
    2: 'bbb',
    3: 'ccc',

  };

  print(muhan);

  // 요소에 접근 : muhan['aaa']
  print(muhan['aaa']);
  print(bang[1]);

  muhan.addAll({
    'ddd': '라',
    'eee': '마',
  });
  print(muhan);

  // 기존에 존재하면 갱신
  bang[3] = 'ddd';
  print(bang);
  // 존재하지 않으면 추가
  bang[4] = 'fff';
  print(bang);

  // 삭제하기
  bang.remove(3);
  print(bang);

  muhan.remove('ddd');
  print(muhan);

  // 카겂만 거져오기
  print(muhan.keys);
  print(muhan.values);


}