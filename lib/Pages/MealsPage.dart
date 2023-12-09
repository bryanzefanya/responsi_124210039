import 'package:flutter/material.dart';
// import 'package:fp_prak_mobile/Models/recipe.dart';
import 'package:responsi_124210039/Model/Meals_model.dart';
import 'package:responsi_124210039/api_source.dart';
// import 'package:fp_prak_mobile/Pages/widgets/recipe_card.dart';

class MealPages extends StatefulWidget {
  @override
  _MealPagesState createState() => _MealPagesState();
}

class _MealPagesState extends State<MealPages> {
  int _currentIndex = 0;

  Meals? mealslist;

  @override
  void initState() {
    super.initState();
    fetchList();
  }

  Future<void> fetchList() async {
    try {
      var data = await ApiClient.getMeal(idMeal);
      if (data != null) {
        setState(() {
          meals = Meals.fromJson(meals);
        });
      } else {
        print('Error: Weather data is null');
      }
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Meals List'),
       backgroundColor: Colors.blue[900],
       foregroundColor: Colors.white,
       centerTitle: true,
       automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListView.builder(
            itemCount: mealslist?.idMeal?.length,
            itemBuilder: (context, index) {
              final hero = heroList?.data?[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Meals(idHero: '${hero?.heroid}')
                      )
                  );
                },
                child: Container(
                  height: 80,
                  child: Center(
                    child: ListTile(
                      leading: ClipOval(
                        child: Image.network(
                          'https://${(hero?.key)?.substring(2)}',
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        '${hero?.name}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700]),
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
      ),
      ),
    );
  }