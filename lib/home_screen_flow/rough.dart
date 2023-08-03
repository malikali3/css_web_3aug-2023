import 'package:flutter/material.dart';



class ScrollIndicatorsExample extends StatefulWidget {
  @override
  _ScrollIndicatorsExampleState createState() => _ScrollIndicatorsExampleState();
}

class _ScrollIndicatorsExampleState extends State<ScrollIndicatorsExample> {
  ScrollController _scrollController = ScrollController();
  bool _showLeftIndicator = false;
  bool _showRightIndicator = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        _showLeftIndicator =
            _scrollController.position.pixels > _scrollController.position.minScrollExtent;
        _showRightIndicator =
            _scrollController.position.pixels < _scrollController.position.maxScrollExtent;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Indicators Example'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Stack(
          children: [
            Row(
              children: [
                SizedBox(width: 16), // Some padding to prevent the left indicator from being hidden
                ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true, // Important for the horizontal scrolling
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      margin: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Text('Item $index'),
                    );
                  },
                ),
                SizedBox(width: 16), // Some padding to prevent the right indicator from being hidden
              ],
            ),
            if (_showLeftIndicator)
              Positioned(
                left: 16,
                top: MediaQuery.of(context).size.height / 2 - 20,
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
            if (_showRightIndicator)
              Positioned(
                right: 16,
                top: MediaQuery.of(context).size.height / 2 - 20,
                child: Icon(Icons.arrow_forward, color: Colors.black),
              ),
          ],
        ),
      ),
    );
  }
}
