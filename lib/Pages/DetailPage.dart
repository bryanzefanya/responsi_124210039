import 'package:flutter/material.dart';
import 'package:responsi_124210039/Model/Meals_model.dart';
import 'package:responsi_124210039/api_source.dart';
import 'package:responsi_124210039/Model/categories_model.dart';
import 'package:html/parser.dart' show parse;

class DetailHero extends StatefulWidget {
  final String idHero;

  const DetailHero({super.key, required this.idHero});

  @override
  _DetailHeroState createState() => _DetailHeroState();
}

class _DetailHeroState extends State<DetailHero> {
  late Detail? heroDetail;

  @override
  void initState() {
    super.initState();
    fetchDetail(widget.idMeal);
    print(widget.idHero);
  }

  Future<void> fetchDetail(String idHero) async {
    try {
      var data = await ApiClient.getDetail(idHero);

      if (data != null && data['code'] == 2000) {
        var heroData = data['data'];

        setState(() {
           = Detail.fromJson(heroData);
        });
      } else {
        print('Error: Hero data is null or invalid response');
      }
    } catch (e) {
      print('Error fetching hero data: $e');
    }
  }

  // Function to show the skill description dialog
  void _showSkillDescription(String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var skillDesc = parse(description);
        String Desc = parse(skillDesc.body!.text).documentElement!.text;
        return AlertDialog(
          title: Text('Skill Description'),
          content: Text(Desc),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showItemDescription(String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var skillDesc = parse(description);
        String Desc = parse(skillDesc.body!.text).documentElement!.text;
        return AlertDialog(
          title: Text('Item Description'),
          content: Text(Desc),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${heroDetail?.name}'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[700],
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                '${heroDetail?.coverPicture}',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                '${heroDetail?.name}',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Text(
                    'Role',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '${heroDetail?.type}',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Best Mates',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ClipOval(
                          child: Image.network(
                            'https://${(heroDetail?.counters?.best?.icon)?.substring(2)}',
                            height: 45,
                            width: 45,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        '${heroDetail?.counters?.best?.name}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Counters',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ClipOval(
                          child: Image.network(
                            'https://${(heroDetail?.counters?.counters?.icon)?.substring(2)}',
                            height: 45,
                            width: 45,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        '${heroDetail?.counters?.counters?.name}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Countered By',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ClipOval(
                          child: Image.network(
                            'https://${(heroDetail?.counters?.countered?.icon)?.substring(2)}',
                            height: 45,
                            width: 45,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        '${heroDetail?.counters?.countered?.name}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Skill',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 100, // Set a specific height for the inner ListView
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: heroDetail?.skill1?.skill?.length,
                        itemBuilder: (context, index) {
                          var skill = heroDetail?.skill1?.skill?[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: GestureDetector(
                              onTap: () {
                                _showSkillDescription('${skill?.des}');
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    index == 3 ? 'Passive' : 'Skill ${index+1}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w600
                                    ), // Adjust the font size as needed
                                  ),
                                  ClipOval(
                                    child: Image.network(
                                      '${skill?.icon}',
                                      height: 45,
                                      width: 45,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    '${skill?.name}',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w600
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Build',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: heroDetail?.gear?.outPack?.length ?? 0,
                        itemBuilder: (context, index) {
                          var item = heroDetail?.gear?.outPack?[index].equip;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: GestureDetector(
                              onTap: () {
                                _showItemDescription('${item?.des}');
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Item ${index + 1}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  ClipOval(
                                    child: Image.network(
                                      '${item?.icon}',
                                      height: 45,
                                      width: 45,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    '${item?.name}',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w600
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
