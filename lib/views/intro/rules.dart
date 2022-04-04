import 'package:flawtrack/const.dart';
import 'package:flawtrack/widgets/stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class UsingRules extends StatefulWidget {
  const UsingRules({Key? key}) : super(key: key);

  @override
  State<UsingRules> createState() => _UsingRulesState();
}

class _UsingRulesState extends State<UsingRules> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          'Қолдану ережелері',
          style: TextStyle(
              color: black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  'Шартты белгілер: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Table(
                border: TableBorder.all(
                    color: Color.fromRGBO(227, 227, 227, 1),
                    style: BorderStyle.solid,
                    width: 1),
                children: [
                  TableRow(children: [
                    Container(
                        height: 50,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ImageIcon(
                                AssetImage('assets/pins/trashcan.png'),
                                size: 24,
                                color: black),
                          )
                        ])),
                    Container(
                        height: 50,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Орынды емес қоқыс',
                                style: TextStyle(fontSize: 15.0)),
                          )
                        ])),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageIcon(AssetImage('assets/pins/road.png'),
                            size: 24, color: black),
                      )
                    ]),
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Жол/тратуар сынған',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      )
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageIcon(AssetImage('assets/pins/dog.png'),
                            size: 24, color: black),
                      )
                    ]),
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Үйсіз/жоғалған ит',
                            style: TextStyle(fontSize: 15.0)),
                      )
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageIcon(AssetImage('assets/pins/cat.png'),
                            size: 24, color: black),
                      )
                    ]),
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Үйсіз/жоғалған мысық',
                            style: TextStyle(fontSize: 15.0)),
                      )
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageIcon(AssetImage('assets/pins/trash.png'),
                            size: 24, color: black),
                      )
                    ]),
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Орынды емес свалка',
                            style: TextStyle(fontSize: 15.0)),
                      )
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageIcon(AssetImage('assets/pins/drown.png'),
                            size: 24, color: black),
                      )
                    ]),
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Су басылуы',
                            style: TextStyle(fontSize: 15.0)),
                      )
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageIcon(AssetImage('assets/pins/homeless.png'),
                            size: 24, color: black),
                      )
                    ]),
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('БОМЖ', style: TextStyle(fontSize: 15.0)),
                      )
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageIcon(
                            AssetImage('assets/pins/volunteer.png'),
                            size: 24,
                            color: black),
                      )
                    ]),
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Text(AppLocalizations.of(context).volunteer, style: TextStyle(fontSize: 15.0)),
                      )
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageIcon(AssetImage('assets/pins/fixed.png'),
                            size: 24, color: black),
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Text('Түзетілді', style: TextStyle(fontSize: 15.0))
                      ]),
                    ),
                  ]),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => StepperW()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width*0.9,
                      child: Text('Как закреплять проблемы на карте?', style: TextStyle(color: primaryColor,  fontWeight: FontWeight.bold,
                      fontSize: 18, decoration: TextDecoration.underline),
                      ))
                  
                    ],
                ),
              ),
              Center(
                child: Text(
                  'Онлайн-этикет',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Image.asset(
                'assets/etiquet.png',
                width: width * 0.85,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: width * 0.91,
                child: RichText(
                    text: TextSpan(
                  text:
                      'Около 60% жителей планеты вовлечены в онлайн-общение, ежедневно каждый пользователь проводит в сети в среднем 6.43 часов (а это около 100 дней в году), свыше 50% всего трафика приходится на мобильные устройства.\n\n',
                  style: TextStyle(fontSize: 15, color: black),
                  children: const <TextSpan>[
                    TextSpan(
                        text:
                            'Онлайн-этикет – это не столько про четкие правила, сколько про уважение к границам и времени других людей, создание благоприятного впечатления, повышение эффективности коммуникации и умение строить взаимовыгодные отношения.\n'),
                    TextSpan(
                        text:
                            'Там, где есть люди, всегда формируются нормы их взаимодействия, и Интернет исключением не является. В частной переписке с близкими и родными мы вольны общаться так, как привыкли в реальной жизни, в рамках установленных личных границ и сложившихся на протяжении многих лет шаблонов. \n'),
                    TextSpan(
                        text:
                            'Но построение коммуникации с незнакомыми людьми (в профессиональной деятельности или вне ее) требует соблюдения определенных правил. Это касается как онлайн-переписки в социальных сетях и чатах, так и общения в формате аудио, видео.'),
                    TextSpan(
                        text:
                            'Эта страница посвящена основным правилам онлайн-этикета – не прописанным в книгах и не закрепленным письменно, но сформировавшимся стихийно в процессе развития информационных технологий и расширения каналов коммуникации. В условиях стремительно увеличивающегося числа фрилансеров и специалистов разных сфер, работающих удаленно, тема особенно актуальна. Ведь знание элементарных принципов и минимальных требований к онлайн-общению поможет значительно повысить эффективность коммуникации, минимизировать затрачиваемые ресурсы, упростить процессы, достичь поставленных целей. \n\n'),
                    TextSpan(
                        text: '1.Уважайте своих собеседников\n \n',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'Эван Селинджер, профессор департамента философии Рочестерского института технологии, в своем выступлении в рамках TEDxFlourCity говорил: «Мы не коммуницируем с информацией. Мы общаемся с людьми и тратим немного больше времени на то, чтобы показать, что они что-то значат. И надеемся, что когда людим нам ответят, они также сделают это с уважением».\n'),
                    TextSpan(
                        text:
                            'Учитывайте, что у каждого человека есть свои понятия о приличном-неприличном, статусе и субординации, а также у всех случаются плохие дни или ваши визави могут быть заняты чем-то важным в тот момент, когда вы до них пытаетесь достучаться. Проявите уважение и чуточку терпения. \n\n'),
                    TextSpan(
                        text: '2. Пользуйтесь логикой и интуицией\n\n',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'На основании элементарных данных – возраста, пола, служебного и семейного (если оно вам известно) положения можно составить примерную картину о человеке. К 50-летнему профессору в личном сообщении не стоит обращаться «йо, чувак!», так же как и писать двадцатилетнему художнику «Уважаемый Сергей Леонидович». Первый оскорбится, второй напугается, что ему прислали весточку из полиции или банка. \n'),
                    TextSpan(
                        text:
                            'При личной встрече спросите, каким из социальных каналов ваш собеседник предпочитает пользоваться в деловой переписке – и гневные мысли в ваш адрес будут исключены. Всегда извиняйтесь, если написали человеку не в рабочее время или выходной – у него, на самом деле, выходного может и не быть, и если так и есть, он сам вас заверит, что все нормально и будет рад вашему стремлению оперативно решить дела. Интуиция вам нужна, чтобы не попасть впросак: на самом деле, ваше тело и мозг беспрестанно собирают мельчайшую информацию о происходящем вокруг, и вот этот совокупный опыт поможет понять, когда со своими вопросами к нужному человеку лучше не лезть\n\n'),
                    TextSpan(
                        text:
                            '3. Не вступайте в публичное выяснение отношений в социальных сетях\n\n',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'Трудно удержаться, когда вопрос на повестке дня оказался для вас больным или вы столкнулись с хамством или неадекватностью собеседника. Задайте себе вопрос: не повредит ли выяснение отношений моей репутации у важных для карьеры/жизни людей, поддержат ли они меня или сочтут таким же неадекватным\n'),
                    TextSpan(
                        text:
                            'В журналистской и культурной профессиональной среде в Facebook часто разгорается бурный «срач» между лично или заочно знакомыми людьми на актуальные темы (например, пару недавних – просьба Земфиры убрать на концерте наш национальных флаг или скандал с локальным производителем детокс-напитков). Без ущерба для себя из спора выходят люди, которые без истерики излагают свою позицию, игнорируют троллей и стараются найти логику в комментариях противоположной стороны.\n'),
                    TextSpan(
                        text:
                            'Но если есть выбор вступать или не вступать в спор – лучше этого не делать. В конце концов, если вас лично обидели, можете указать это в личном сообщении. При этом помните, что другой человек всегда может опубликовать даже ваши приватные сообщения в паблике. \n\n'),
                    TextSpan(
                        text:
                            '4. Будьте информативными, своевременными и краткими \n\n',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'Уважайте время других людей, не заваливайте их тонной видео с котиками и забавными малышами, которые и так все давно видели. Фильтруйте поток информации, которую несете другим пользователям. Отвечайте на сообщения и комментарии своевременно (в идеале – в течение 24 часов) – чтобы не нервировать людей или не заставлять их ставить на вас крест'),
                    TextSpan(
                        text:
                            'Если для вас важны сроки ответа – всегда прописывайте их в сообщении, чтобы человек знал, на что вы рассчитываете и как он может перераспределить свое время, чтобы дать вам нужную информацию \n\n'),
                    TextSpan(
                        text:
                            '5. Уделяйте внимание правописанию и редактированию ваших сообщений\n\n',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'Друзья, конечно, простят ваши ошибки и опечатки, чего не скажешь о клиентах и работодателях, которые судят гораздо строже. Есть высокая вероятность, что вы наткнетесь на граммар-наци, для которого ошибка в слове – смертный грех, и райских кущей вам тогда не видать, даже если вы разобьетесь в лепешку'),
                  ],
                )),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
