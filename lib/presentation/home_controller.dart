import 'package:animated_post_it/models/post_it_entity.dart';
import 'package:animated_post_it/presentation/home.dart';
import 'package:flutter/material.dart';

class HomeController {
  static final HomeController _instance = HomeController._internal();

  factory HomeController() => _instance;

  HomeController._internal();

  List<PostItEntity> list = [
    PostItEntity(
      title: 'teste 1',
      description: '123456789-123456789-123456789-123456789',
      hero: Home.heroGiver(),
    ),
    PostItEntity(
      title: 'teste 1',
      description:
          'omem pré-histórico não conseguia ainda ter controle sobre ele. Se o fogo adquirido a partir desse episódio se apagasse, era necessário aguardar por outros incêndios para que se pudesse obter fogo novamente. Mas este fogo já o ajudou bastante a cozinhar seu alimento, a iluminar algum lugar na hora desejada, em seu aquecimento e também para se proteger de animais que não se aproximavam do fogo. A Era do Paleolítico, entre um e dois milhões de anos atrás, foi testemunha da utilização inédita do fogo pelo homem. Nesta época, alguns já moravam em cavernas e vestiam-se com peles de animais, que anteriormente poderiam ter servido como alimento. Desenvolviam  linguagem e comunicação, através de desenhos feitos nas paredes das cavernas, que nos ajudaram a entender a importância, para esses povos, da descoberta do fogo. Entre 1,8 milhões e 300 mil ',
      hero: Home.heroGiver(),
    ),
    // PostItEntity(
    //   title: 'teste 1',
    //   description:
    //       'omem pré-histórico não conseguia ainda ter controle sobre ele. Se o fogo adquirido a partir desse episódio se apagasse, era necessário aguardar por outros incêndios para que se pudesse obter fogo novamente. Mas este fogo já o ajudou bastante a cozinhar seu alimento, a iluminar algum lugar na hora desejada, em seu aquecimento e também para se proteger de animais que não se aproximavam do fogo. A Era do Paleolítico, entre um e dois milhões de anos atrás, foi testemunha da utilização inédita do fogo pelo homem. Nesta época, alguns já moravam em cavernas e vestiam-se com peles de animais, que anteriormente poderiam ter servido como alimento. Desenvolviam  linguagem e comunicação, através de desenhos feitos nas paredes das cavernas, que nos ajudaram a entender a importância, para esses povos, da descoberta do fogo. Entre 1,8 milhões e 300 mil anos atrás, o Homo Erectus, um ser com o raciocínio mais evoluído, descobriu que se fizesse fricção entre duas pedras, esfregando uma na outra, ele conseguia produzir uma faísca, que se colocada em algum lugar de fácil combustão, pegaria fogo normalmente. Assim ele não precisava mais esperar que o raio caísse em alguma árvore para obter fogo. Os fósseis mais conhecidos foram chamados de Homem de Pequim, que viveu entre 250.000 a 500.000 anos e foi encontrado em escavações na capital da China na década de 1920. A relação do homem com o fogo passou por três estágios distintos: a produção pelo homem, a manutenção mediante o uso de fogueiras, e a utilização de resinas, para que este não apagasse tão facilmente quando as tochas acesas eram carregadas. Arqueólogos israelenses descobriram o indício mais antigo de uma fogueira produzida há 790 mil anos, às margens do rio Jordão, entre Israel e a Jordânia. Na mitologia grega, a criação do fogo é imortalizada na tragédia Prometeu Acorrentado de Ésquilo (525 a.C. – 456 a.C.), que relata o mito da domesticação do fogo. Prometeu e seu irmão Epimeteu eram responsáveis pela criação dos homens e dos animais. Epimeteu trabalhava e seu irmão supervisionava as obras prontas, dando características próprias a cada animal.  Quando chegou a vez do homem, sobraram poucos recursos, co ',
    //   hero: Home.heroGiver(),
    // )
  ];

  List<Color> particleColors = [Colors.blueGrey[500]!];
}
