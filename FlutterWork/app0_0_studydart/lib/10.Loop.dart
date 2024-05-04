void main(){
  // for(초기화; 조건식; 증감식) : 반복적인 일을 처리할때 > while, do while
  for(int i=0; i<10; i++){
    print(i + 1);
  }
  // for - in : 리스트를 처음부터 끝까지 수행
  int total = 0;
  List<int> nums = [1 , 2, 3, 4, 5 , 6, 7];

  for(int i=0; i<nums.length; i++){
    total += nums[i];
  }
  print(total);

  total = 0;
  for(var num in nums){
    total = total + num;
  }
  print(total);

  int total2 = 0;
  while(total2 < 0){
    print('1111');
    total2 += 1;
  }
  print(total2);

  total2 = 0;
  do{
    print('2222');
    total2 += 1;
  }while(total2<0);
  print(total2);

  // 반복문을 빠져나가는것은 break
  total2 = 0;
  for(int num in nums){
    total2 += num;
    if(total2 > 10){
      print(num);
      break;
    }
  }
  print(total2);

}