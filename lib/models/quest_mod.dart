// model to design a question and its answers
class Quest{
  const Quest(this.text, this.ans);

  final String text;
  final List<String> ans;

  //Note: We need to keep track of the coorect answer, so we cannot change the original list. But shuffle() changes the original list, thereforewe need to copy the original list and performn shuffle() on the copied one.

  List<String> getShuffledAnswers(){
    final shuffledList = List.of(ans); //copying the original list 
    shuffledList.shuffle(); // shuffling it 
    return shuffledList;
  }
}