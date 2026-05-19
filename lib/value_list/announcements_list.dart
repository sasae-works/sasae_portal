enum CreatedAPP{
  HOMENIKKI,
  THREEGOODTHINGS,
  KOKORORESESEARCH,
  BAGNONAKAMI,
  YAKINIKU,
  
}

class ForAnounceApp{
  final CreatedAPP createdAPP;
  final String date;
  final String contents;
  ForAnounceApp({required this.createdAPP, required this.date, required this.contents});

}

List<ForAnounceApp> anounceAppList = [
  // ForAnounceApp(createdAPP: , date: date, contents: contents)
];