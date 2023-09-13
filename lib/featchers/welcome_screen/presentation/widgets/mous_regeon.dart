import 'package:flutter/material.dart';

class MousregionAllcategorie {
  mouseRegion1(bool isin) {
    return StatefulBuilder(
      builder: (context, setState) {
        setState(() {
          isin;
        });
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: isin ? Colors.amber : Colors.transparent,
              elevation: 0,
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: isin ? Colors.white : Colors.amber,
                  ),
                  Text(
                    'Hello World',
                    style: TextStyle(
                      color: isin ? Colors.white : Colors.amber,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ////
  mouseRegion2(bool isin) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Colors.amber,
              elevation: 0,
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.amber,
                  ),
                  Text(
                    'Hello World',
                    style: TextStyle(color: Colors.amberAccent),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //!
  mouseRegion3(bool isin) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Colors.amber,
              elevation: 0,
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.amber,
                  ),
                  Text(
                    'Hello World',
                    style: TextStyle(color: Colors.amberAccent),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //!
  mouseRegion4(bool isin) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Colors.amber,
              elevation: 0,
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.amber,
                  ),
                  Text(
                    'Hello World',
                    style: TextStyle(color: Colors.amberAccent),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //!
  mouseRegion5(bool isin) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Colors.amber,
              elevation: 0,
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.amber,
                  ),
                  Text(
                    'Hello World',
                    style: TextStyle(color: Colors.amberAccent),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //!
  mouseRegion7(bool isin) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Colors.amber,
              elevation: 0,
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.amber,
                  ),
                  Text(
                    'Hello World',
                    style: TextStyle(color: Colors.amberAccent),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //!
  mouseRegion6(bool isin) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isin = true;
            });
          },
          onExit: (_) {
            setState(() {
              isin = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Colors.amber,
              elevation: 0,
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.amber,
                  ),
                  Text(
                    'Hello World',
                    style: TextStyle(color: Colors.amberAccent),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
