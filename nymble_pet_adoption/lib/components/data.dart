class Pet {
  final String id;
  bool isAdopted;
  final String price;
  final String picture;
  final int age;
  final String name;
  final String gender;
  final String address;
  final String about;
  final int adoptedTime;
  bool like;

  Pet(
      {required this.id,
      required this.isAdopted,
      required this.price,
      required this.picture,
      required this.age,
      required this.name,
      required this.gender,
      required this.address,
      required this.about,
      required this.adoptedTime,
      required this.like});
}

class PetService {
  static List<Pet> getAllPets() {
    List<Map<String, dynamic>> rawData = PetDataRaw.petData();
    return rawData
        .map((pet) => Pet(
            id: pet['_id'],
            isAdopted: pet['isAdopted'],
            price: pet['price'],
            picture: pet['picture'],
            age: pet['age'],
            name: pet['name'],
            gender: pet['gender'],
            address: pet['address'],
            about: pet['about'],
            adoptedTime: pet['adoptedTime'],
            like: pet['like']))
        .toList();
  }
}

class PetDataRaw {
  static List<Map<String, dynamic>> petData() {
    return [
      {
        "_id": "64aeefe6b5d0b0ff66eaa884",
        "isAdopted": false,
        "price": "873.28",
        "picture": "6_2.jpg",
        "age": 4,
        "name": "Fox",
        "gender": "male",
        "address": "New York",
        "about":
            "Sit sunt ex Lorem consequat nulla. Laboris Lorem minim in in ad duis laboris do in irure. Dolore Lorem ullamco ex do adipisicing proident duis ullamco eiusmod dolor do consectetur sint tempor. Culpa aute ea ex ad dolore culpa nisi.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe60735ae81ee7f02ef",
        "isAdopted": false,
        "price": "1,895.74",
        "picture": "7_2.jpg",
        "age": 17,
        "name": "Shelly",
        "gender": "female",
        "address": "LA",
        "about":
            "Nulla pariatur pariatur mollit pariatur dolor. Quis reprehenderit consequat magna fugiat aute duis ullamco. Proident aute aliquip occaecat laboris. Anim in dolor commodo cupidatat qui sint esse id. Pariatur non labore cupidatat ullamco pariatur qui aute laborum aliquip. Laboris velit fugiat labore et.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe6f39945e64ca9711d",
        "isAdopted": false,
        "price": "1,531.74",
        "picture": "2_2.jpg",
        "age": 4,
        "name": "Katherine",
        "gender": "female",
        "address": "Chicago",
        "about":
            "Eiusmod anim est elit occaecat anim eu pariatur sint id. Deserunt fugiat et pariatur aliquip ex aute. Magna do culpa fugiat nisi. Consequat ullamco sunt minim est adipisicing sit proident id velit qui. Cupidatat minim in dolore eu ex irure anim sint deserunt elit. Eiusmod excepteur Lorem ipsum commodo elit dolor ad nostrud nostrud duis laborum proident. Ea cupidatat velit velit cupidatat.",
        "adoptedTime": 1648821645,
        "like": true
      },
      {
        "_id": "64aeefe694a3faa0adeea8bb",
        "isAdopted": false,
        "price": "292.63",
        "picture": "5_2.jpg",
        "age": 17,
        "name": "Todd",
        "gender": "male",
        "address": "Dallas",
        "about":
            "Adipisicing commodo amet qui ea et ut Lorem mollit in amet. Duis magna aliqua ex proident pariatur dolor officia irure esse. Laboris do incididunt velit elit sint ut consectetur. Labore aliquip excepteur quis culpa occaecat elit reprehenderit. Irure ut ex est elit adipisicing eu nostrud magna velit qui. Ipsum velit Lorem Lorem in aliqua est qui adipisicing id incididunt est enim amet. Incididunt veniam voluptate ex excepteur dolore quis nostrud do consequat voluptate laboris dolore.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe656d616cb7ccfec7c",
        "isAdopted": true,
        "price": "1,624.91",
        "picture": "9_2.jpg",
        "age": 17,
        "name": "Alejandra",
        "gender": "female",
        "address": "Miami",
        "about":
            "Cillum veniam officia laborum est exercitation sunt officia anim cupidatat anim commodo. Ad duis consequat consectetur consectetur do irure fugiat amet aliquip reprehenderit elit culpa fugiat. Qui enim sunt aliquip sunt est amet ad. Deserunt irure cillum laborum laborum. Fugiat pariatur eiusmod reprehenderit ut eu aliqua reprehenderit ex.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe6044dc78a231ae87a",
        "isAdopted": false,
        "price": "871.12",
        "picture": "6_2.jpg",
        "age": 17,
        "name": "Pope",
        "gender": "male",
        "address": "Houston",
        "about":
            "Qui consectetur pariatur nulla ex aliquip officia non est. Ad adipisicing incididunt occaecat proident aliquip elit consequat do ex laboris nulla in. Esse eiusmod in adipisicing eiusmod exercitation sunt et dolor proident. Elit dolore amet commodo voluptate ad in ex commodo sit dolor mollit duis adipisicing. Aliquip dolor consequat magna ipsum laborum. Labore ea pariatur enim aute adipisicing non eu id excepteur est anim pariatur.",
        "adoptedTime": 1648821645,
        "like": true
      },
      {
        "_id": "64aeefe658f5852b7e213387",
        "isAdopted": false,
        "price": "844.86",
        "picture": "9_2.jpg",
        "age": 19,
        "name": "Misty",
        "gender": "female",
        "address": "Atlanta",
        "about":
            "Est nisi incididunt Lorem aute nostrud adipisicing cillum enim cupidatat labore aliquip sunt. Quis ipsum pariatur enim elit commodo. Minim non aliquip occaecat culpa aliquip in pariatur id exercitation exercitation adipisicing reprehenderit sunt culpa. Est est ea culpa sint sint voluptate laborum qui voluptate pariatur nostrud qui. Nisi ex deserunt adipisicing non duis occaecat sit. Nulla do consectetur fugiat qui voluptate anim anim eu quis incididunt aliqua.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe66056ee06df84e3d6",
        "isAdopted": true,
        "price": "1,771.46",
        "picture": "3_2.jpg",
        "age": 9,
        "name": "Mercedes",
        "gender": "female",
        "address": "Seattle",
        "about":
            "Labore cupidatat in aliqua sint enim sunt elit duis eu culpa consequat pariatur sint. Id ipsum incididunt id ullamco ullamco voluptate duis exercitation in veniam nisi. Nulla deserunt ullamco tempor pariatur incididunt.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe612148f33c3d78482",
        "isAdopted": false,
        "price": "1,521.50",
        "picture": "7_2.jpg",
        "age": 11,
        "name": "Holder",
        "gender": "male",
        "address": "Detroit",
        "about":
            "In officia id officia pariatur duis. Aute quis cupidatat laboris dolor nisi velit laborum exercitation ullamco. In minim laboris labore ullamco quis dolor fugiat esse esse ullamco. Ad exercitation amet duis ex veniam sit culpa nisi minim. Tempor fugiat consectetur culpa enim ad duis laboris et occaecat. Ullamco excepteur id fugiat magna ut nulla do ut nulla excepteur est anim pariatur.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe631cb124be334520b",
        "isAdopted": false,
        "price": "624.78",
        "picture": "7.jpg",
        "age": 5,
        "name": "Beck",
        "gender": "male",
        "address": "Denver",
        "about":
            "Elit et do eu aliquip mollit fugiat ut qui pariatur magna occaecat incididunt ut in. Deserunt dolor amet culpa aute officia commodo esse proident elit culpa. Incididunt cupidatat dolor qui aliquip aliqua laborum adipisicing aute cillum reprehenderit fugiat. Cupidatat velit ipsum eu et consectetur anim culpa amet deserunt culpa. Velit anim quis non officia velit magna adipisicing occaecat cupidatat elit dolor cupidatat elit sunt.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe6dbe9055b1cefd045",
        "isAdopted": true,
        "price": "1,274.31",
        "picture": "8_2.jpg",
        "age": 1,
        "name": "Allie",
        "gender": "female",
        "address": "Boston",
        "about":
            "Ad irure eu consequat nulla laborum fugiat velit. Fugiat adipisicing cupidatat labore consectetur quis sunt in est irure culpa. Ad culpa non nostrud mollit ullamco ipsum.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe60a8c1e8cffab37df",
        "isAdopted": false,
        "price": "485.77",
        "picture": "3_2.jpg",
        "age": 5,
        "name": "Joy",
        "gender": "female",
        "address": "Portland",
        "about":
            "Ut est excepteur anim amet eu ea aute amet deserunt exercitation id. Lorem exercitation sunt dolore reprehenderit nulla esse. Lorem ex ea aute veniam culpa adipisicing ea sint labore adipisicing consectetur mollit in aliqua.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe6b46d054b04db9a06",
        "isAdopted": false,
        "price": "149.65",
        "picture": "6_2.jpg",
        "age": 16,
        "name": "Hinton",
        "gender": "male",
        "address": "Phoenix",
        "about":
            "Qui sunt officia ullamco consectetur do officia deserunt culpa consectetur nostrud nulla. Nostrud cupidatat eu mollit anim. Ex cupidatat duis non ut labore amet anim cillum culpa consectetur minim.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe6ffabbb68465fcbb0",
        "isAdopted": false,
        "price": "1,323.69",
        "picture": "5_2.jpg",
        "age": 14,
        "name": "Michele",
        "gender": "female",
        "address": "Austin",
        "about":
            "Ad ut proident eiusmod veniam aliquip ex incididunt proident cillum veniam adipisicing exercitation voluptate. Velit ullamco non et duis ad irure elit laboris irure nulla exercitation pariatur id. Ea eu esse quis amet cupidatat excepteur culpa pariatur labore dolore veniam ad cillum ut. Laborum esse fugiat nulla sunt. Nisi velit mollit minim do id ullamco.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe6f0f6ecba2e813581",
        "isAdopted": false,
        "price": "1,039.64",
        "picture": "3_2.jpg",
        "age": 10,
        "name": "Josefa",
        "gender": "female",
        "address": "Phila",
        "about":
            "Culpa velit sunt ad anim in tempor amet culpa reprehenderit occaecat velit esse exercitation cillum. Id exercitation excepteur deserunt quis mollit esse exercitation minim officia eu. Et tempor ipsum adipisicing sint. Qui occaecat magna dolor elit id magna eu reprehenderit mollit duis aliqua fugiat in.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe6383a82432659fc57",
        "isAdopted": false,
        "price": "729.67",
        "picture": "2_2.jpg",
        "age": 13,
        "name": "Nicholson",
        "gender": "male",
        "address": "Seattle",
        "about":
            "Adipisicing aliqua minim laboris deserunt tempor do nulla aliqua adipisicing. Incididunt cupidatat nisi deserunt ad consequat dolore. Laboris ipsum labore reprehenderit dolore magna ut est cillum pariatur culpa esse. Proident consequat laborum cupidatat aliquip consequat reprehenderit. Id adipisicing ipsum laborum duis quis quis deserunt culpa magna.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe6ce011ee5db9f190e",
        "isAdopted": false,
        "price": "1,507.79",
        "picture": "5.jpg",
        "age": 17,
        "name": "Castro",
        "gender": "male",
        "address": "Miami",
        "about":
            "Mollit laboris aliqua aute esse aute nulla ex. Esse do dolor labore et est eu veniam ullamco cillum irure. Consequat minim cupidatat nostrud laborum fugiat dolor amet occaecat. Fugiat et et mollit esse fugiat dolore aliqua dolore labore eu nulla veniam sit.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe6bc061ffa9ea60eae",
        "isAdopted": false,
        "price": "1,746.55",
        "picture": "9_2.jpg",
        "age": 4,
        "name": "Gonzalez",
        "gender": "male",
        "address": "Houston",
        "about":
            "Velit reprehenderit ex ut sit minim laborum laborum laboris reprehenderit ullamco veniam velit ipsum. Commodo proident eu do laborum quis esse aute incididunt fugiat consequat consequat exercitation. Cillum velit veniam ullamco reprehenderit velit proident adipisicing enim dolor magna deserunt enim. Officia amet cillum sunt exercitation dolore. Adipisicing cupidatat occaecat ipsum mollit ullamco excepteur enim eu labore deserunt culpa ullamco consequat velit. Aute ullamco culpa culpa pariatur elit labore elit fugiat excepteur exercitation.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe6718fa1029be14be6",
        "isAdopted": false,
        "price": "741.14",
        "picture": "4_2.jpg",
        "age": 10,
        "name": "Marcie",
        "gender": "female",
        "address": "Las Vegas",
        "about":
            "Cupidatat cillum aute reprehenderit voluptate deserunt ad fugiat. Do exercitation qui ullamco Lorem voluptate occaecat deserunt esse eu tempor tempor ad officia ex. Quis velit amet Lorem do dolor quis.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe60da0b5c5e3f5e3d7",
        "isAdopted": false,
        "price": "944.75",
        "picture": "7_2.jpg",
        "age": 6,
        "name": "Danielle",
        "gender": "female",
        "address": "Chicago",
        "about":
            "Amet proident irure amet ullamco esse laboris. Sunt qui exercitation esse dolor eu ad esse. Eu commodo nostrud eiusmod ullamco voluptate ad adipisicing. Adipisicing incididunt ex proident magna laborum pariatur sint ullamco aliqua laboris. Excepteur nulla adipisicing occaecat qui aute dolore et culpa non labore voluptate cillum reprehenderit sint. Exercitation aliquip tempor tempor proident Lorem magna incididunt nulla enim.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe6fab9884938aa78e6",
        "isAdopted": false,
        "price": "882.88",
        "picture": "2_2.jpg",
        "age": 10,
        "name": "Patel",
        "gender": "male",
        "address": "New York",
        "about":
            "Est proident incididunt quis velit et laboris aliquip adipisicing nulla. Nisi id labore non occaecat cupidatat ex proident ullamco tempor excepteur laboris fugiat. Commodo dolor voluptate sint labore consequat ad aute labore aliqua ut quis pariatur. Non duis esse officia consequat laborum velit dolor ea in dolor nulla exercitation.",
        "adoptedTime": 1648821645,
        "like": false
      },
      {
        "_id": "64aeefe61e3425248b2342f9",
        "isAdopted": false,
        "price": "1,470.95",
        "picture": "8.jpg",
        "age": 10,
        "name": "Audra",
        "gender": "female",
        "address": "LA",
        "about":
            "Amet cillum est eu aute veniam cupidatat consectetur. Aliquip minim nostrud incididunt quis sint aliqua. Non ullamco ut qui anim sunt duis eu. Labore esse et quis cupidatat qui esse velit in. Aliquip exercitation eiusmod dolor pariatur ullamco. Sunt excepteur magna reprehenderit exercitation. Ad sit officia sunt commodo eiusmod pariatur sit.",
        "adoptedTime": 1648821645,
        "like": false
      }
    ];
  }
}
