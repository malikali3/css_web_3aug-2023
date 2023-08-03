import 'package:flutter/material.dart';
import '../showing_css_subjects/search_subjects.dart';

class css_subjects_searc extends SearchDelegate<String> {

    String get searchFieldLabel => 'Search Subjects';

  final List<Map<String, dynamic>> searchResults =


  [
    {'title':'English Essay', 'marks': 100, 'code': 'EE'},
    {'title':'English Precis', 'marks': 100, 'code': 'EPnC'},
    {'title':'General Science', 'marks': 100,'code': 'GSnA'},
    {'title':'Current Affairs', 'marks': 100,'code': 'CA'},
    {'title':'Pakistan Affairs', 'marks': 100,'code': 'PaA'},
    {'title':'Islamic Studies', 'marks': 100,'code': 'IS'},
    {'title':'Comparative study of Religions','marks': 100,'code': 'CSoMR'},
    {'title':'Accountancy & Auditing', 'marks':200, 'code': 'AnA'},
    {'title':'Economics',  'marks':200,'code': 'Economics'},
    {'title':'Computer Science', 'marks':200,'code': 'CS'},
    {'title':'Political Science', 'marks':200,'code': 'PS'},
    {'title':'International Relations',  'marks':200,'code': 'IR'},
    {'title':'Physics','marks':200,'code': 'Physics'},
    {'title':'Chemistry','marks':200,'code': 'Chemistry'},
    {'title':'Applied Maths','marks':100,'code': 'AM'},
    {'title':'Pure Maths','marks':100,'code': 'PM'},
    {'title':'Statistics','marks':100,'code': 'Statistics'},
    {'title':'Geology','marks':100,'code': 'Geology'},
    {'title':'Business Administration','marks':100, 'code': 'BA'},
    {'title':'Public Administration','marks':100,'code': 'PuA'},
    {'title':'Governance & Public Policies','marks':100, 'code': 'GnPP'},
    {'title':'Town Planning & Urban Management','marks':100,'code': 'TPnUM'},
    {'title':'History of Pakistan & India', 'marks':100,'code': 'HoPnI'},
    {'title':'Islamic History and Culture',  'marks':100,'code': 'IHnC'},
    {'title':'British History',  'marks':100,'code': 'BH'},
    {'title':'European History',  'marks':100,'code': 'EH'},
    {'title':'History of USA', 'marks':100,'code': 'HoUS'},
    {'title':'Gender Studies',  'marks':100,'code': 'GS'},
    {'title':'Environmental Sciences', 'marks':100,'code': 'ES'},
    {'title':'Agriculture & Forestry','marks':100,'code': 'AnF'},
    {'title':'Botany', 'marks':100,'code': 'Botany'},
    {'title':'Zoology', 'marks':100,'code': 'Zoology'},
    {'title':'English Literature','marks':100,'code': 'EL'},
    {'title':'Urdu Literature','marks':100,'code': 'UL'},
    {'title':'Law','marks':100,'code': 'Law'},
    {'title':'Constitutional Law', 'marks':100,'code': 'CL'},
    {'title':'International Law', 'marks':100,'code': 'IL'},
    {'title':'Muslim Law & Jurisprudence', 'marks':100,'code': 'MLnJ'},
    {'title':'Mercantile Law',  'marks':100,'code': 'ML'},
    {'title':'Criminology',  'marks':100,'code': 'Criminology'},
    {'title':'Philosophy',  'marks':100,'code': 'Philosophy'},
    {'title':'Journalism & Mass Communication', 'marks':100,'code': 'JnMC'},
    {'title':'Psychology', 'marks':100,'code': 'Psychology'},
    {'title':'Geography',  'marks':100,'code': 'Geography'},
    {'title':'Sociology', 'marks':100,'code': 'Sociology'},
    {'title':'Anthropology', 'marks':100,'code': 'Anthropology'},
    {'title':'Punjabi',  'marks':100,'code': 'Punjabi'},
    {'title':'Sindhi',  'marks':100,'code': 'Sindhi'},
    {'title':'Pashto',  'marks':100,'code': 'Pashto'},
    {'title':'Balochi', 'marks':100,'code': 'Balochi'},
    {'title':'Persian', 'marks':100,'code': 'Persian'},
    {'title':'Arabic',  'marks':100,'code': 'Arabic'},
  ];




  //CustomSearchDelegate(this.searchResults);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }



  @override
  Widget buildResults(BuildContext context) {
    // Implement your search results here (if needed)
    return Center(
      child: Text('Search Results for "$query"'),
    );
  }
    @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: ()=>close(context, ''),
      icon: Icon(Icons.arrow_back));

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Map<String, dynamic>> suggestionList = query.isEmpty
        ? searchResults
        : searchResults
        .where((result) =>
        result['title'].toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]['title']),
          onTap: () {
            query = suggestionList[index]['title'];

            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  searchSubjects(subjectTitle:suggestionList[index]['title'], subjectMarks: suggestionList[index]['marks'].toString(), subjectCode: suggestionList[index]['code'])),
                  );

          },
        );
      },
    );
  }}


class pms_subjects_search extends SearchDelegate<String> {
   String get searchFieldLabel => 'Search Subjects';

  final List<Map<String, dynamic>> searchResults =


[

  {'title':'English', 'marks': 100, 'code': 'Eng'},
  {'title':'English Essay', 'marks': 100, 'code': 'EE'},
  {'title':'Urdu', 'marks': 100,'code': 'Urdu'},
  {'title':'Islamic Studies', 'marks': 100,'code': 'IS'},
  {'title':'Ethics', 'marks': 100,'code': 'Ethics'},
  {'title':'Pakistan Studies', 'marks': 100,'code': 'PakS'},
  {'title':'General Knowledge','marks': 100,'code': 'GK'},
  {'title':'Economics', 'marks':200, 'code': 'Economics'},
  {'title':'Commerce',  'marks':200,'code': 'Commerce'},
  {'title':'Business Administration', 'marks':200,'code': 'BA'},
  {'title':'Public Administration', 'marks':200,'code': 'PA'},
  {'title':'Agriculture','marks':200,'code': 'Agriculture'},
  {'title':'Veterinary','marks':200,'code': 'VS'},
  {'title':'Botany','marks':200,'code': 'Botany'},
  {'title':'Zoology','marks':200,'code': 'Zoology'},
  {'title':'Mathematics','marks':200, 'code': 'Mathematics'},
  {'title':'Computer Science','marks':200,'code': 'CS'},
  {'title':'Statistics','marks':200,'code': 'Statistics'},
  {'title':'Principle of Engineering','marks':200, 'code': 'PE'},
  {'title':'Physics', 'marks':200,'code': 'Physics'},
  {'title':'Chemistry',  'marks':200,'code': 'Chemistry'},
  {'title':'Geology',  'marks':200,'code': 'Geology'},
  {'title':'Geography',  'marks':200,'code': 'Geography'},
  {'title':'Political Science',  'marks':200,'code': 'PS'},
  {'title':'History', 'marks':200,'code': 'History'},
  {'title':'Law','marks':200,'code': 'Law'},
  {'title':'Mass Communication', 'marks':200,'code': 'MC'},
  {'title':'Philosophy','marks':200,'code': 'Philosophy'},
  {'title':'Psychology', 'marks':200,'code': 'Psychology'},
  {'title':'Sociology', 'marks':200,'code': 'Sociology'},
  {'title':'Social Work', 'marks':200,'code': 'SW'},
  {'title':'English Literature', 'marks':200,'code': 'EL'},
  {'title':'Urdu', 'marks':200,'code': 'UrduOptional'},
  {'title':'Arabic',  'marks':200,'code': 'Arabic'},
  {'title':'Education', 'marks':200,'code': 'Education'},
  {'title':'Persian', 'marks':200,'code': 'Persian'},
  {'title':'Punjabi',  'marks':200,'code': 'Punjabi'},

];




  //CustomSearchDelegate(this.searchResults);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }



  @override
  Widget buildResults(BuildContext context) {
    // Implement your search results here (if needed)
    return Center(
      child: Text('Search Results for "$query"'),
    );
  }
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: ()=>close(context, ''),
      icon: Icon(Icons.arrow_back));

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Map<String, dynamic>> suggestionList = query.isEmpty
        ? searchResults
        : searchResults
        .where((result) =>
        result['title'].toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]['title']),
          onTap: () {
            query = suggestionList[index]['title'];

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  searchSubjects(subjectTitle:suggestionList[index]['title'], subjectMarks: suggestionList[index]['marks'].toString(), subjectCode: suggestionList[index]['code'])),
            );

          },
        );
      },
    );
  }}