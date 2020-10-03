import 'models.dart';

// TODO: delete this
const countries = [
  'ქვეყნები',
  'ცნობილი ადამიანები',
  'ცხოველები',
  'ფილმები',
];

// Questions for the category - animals
final List<String> questionsAnimals = [
  'ლომი',
  'ვეფხვი',
  'ირემი',
  'თაგვი',
  'სპილო',
  'გველი',
];

// Questions for the category - countries
final List<String> questionsCountries = [
  'ამერიკა',
  'კანადა',
  'იაპონია',
  'სამხრეთ აფრიკა',
  'ვენესუელა',
  'ავსტრალია',
];

// Questions for the category - movies
final List<String> questionsMovies = [
  'დიდი აფეთქების თეორია',
  'კაჭკაჭ ჯაფარა',
  'მეფე ლომი',
  'ვინ შეჭამა ჩემი მაროჟნი',
  'დამბ ენდ დამბერი',
  'ტაქსისტი',
];

// Questions for the category - celebrities
final List<String> questionsCelebrities = [
  'მუმფასა',
  'სკარი',
  'სიმბა',
  'კიარა',
  'ტიმონი',
  'პუმბა',
];

final List<Category> categories = [
  Category('ქვეყნები', questionsCountries),
  Category('ცხოველები', questionsAnimals),
  Category('ფილმები', questionsMovies),
  Category('ცნობილი ადამიანები', questionsCelebrities),
];
