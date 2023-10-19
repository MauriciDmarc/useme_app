import 'package:useme_app/models/item_model.dart';

List<String> listcategories = [
  "Creatina",
  "Whey-Protein",
  "Pré-Workout",
  "Glutamina",
  "BCAA",
  "Naturais",
  "Roupas"
];

ItemModel Whey = ItemModel(
    itemName: "Nutri Whey Protein",
    imgUrl:
        "https://integralmedica.vteximg.com.br/arquivos/ids/165431-292-292/POUCH-900G-COOKIES.png?v=638205298721230000",
    description:
        "Com uma fórmula de fácil solubilidade e delicioso sabor, NutriWhey Protein Pouch é um hipercalórico diferenciado, pois além da oferta energética vinda dos carboidratos. Nutri Whey Pouch contém 30 g das melhores proteínas que estão relacionadas a recuperação e ganho de massa muscular, essas proteínas contribuem com o aporte de aminoácidos essenciais que são compostos que participam da síntese proteica e promovem a melhor recuperação principalmente no período pós treino.",
    unit: "900g",
    price: 134.22);

ItemModel Creatina = ItemModel(
    itemName: "Creatina Hardcore",
    imgUrl:
        "https://integralmedica.vteximg.com.br/arquivos/ids/165812-0-0/CENA_POTE_in_CREATINA150-ME2640-1000x1000.png?v=638303973271600000",
    description:
        "A creatina é um composto que pode ser produzido pelo nosso organismo, através do consumo de alimentos de origem animal como carnes e peixes mas também pode se suplementada na forma de creatina mono-hidratada. Tem importante papel no fortalecimento dos ossos, melhora o metabolismo e diminui a fadiga pós treino.",
    unit: "350g",
    price: 61.52);

ItemModel Glutamina = ItemModel(
    itemName: "Glutamine Isolates",
    imgUrl:
        "https://integralmedica.vteximg.com.br/arquivos/ids/165360-0-0/150g.png?v=638203736165170000",
    description:
        "Glutamina Integralmédica é uma peça chave para quem procura melhorar seu sistema imunológico e digestivo. Com ação antioxidante, ajuda a diminuir o catabolismo muscular.",
    unit: "300g",
    price: 45.02);

List<ItemModel> items = [Whey, Creatina, Glutamina];
