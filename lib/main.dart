import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ChatApp Arayüzü",
      debugShowCheckedModeBanner: false,
      home: Iskele(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: const Text("ChatApp Arayüzü"),
      ),
      body: AnaEkran(),
    );
  }
// uygulama çerçevesi
}

// ignore: use_key_in_widget_constructors
class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List<MesajBalonu> mesajListesi =
      []; //ürettiğimiz nesneleri koymak için liste oluşturduk

  listeyeEkle(String gonderilenMesaj) {
    setState(() {
      MesajBalonu mesajlar = MesajBalonu(mesaj: gonderilenMesaj);
      mesajListesi.insert(0, mesajlar); //başına ekliyor
      t1.clear(); //temizliyor
    });
  }

  Widget metinGirisAlani() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 75),
      child: Row(
        children: <Widget>[
          Flexible(
            //Flexible, ListView.builder'ın aşağıya şıkıştıracağı TextField'ın esnemesini sağlayacak, script hatası almamızı engeller.
            child: TextField(
              //TextFieldı Flexible ile sarıyorum
              controller: t1,
              onSubmitted: listeyeEkle,
            ),
          ),
          IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => listeyeEkle(t1.text)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(0),
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              //mesaj listesini ekranda gösterdik
              padding: const EdgeInsets.all(15),
              reverse:
                  true, //mesajları ekranın altından başlayarak yukarı doğru sıralıyor
              itemCount: mesajListesi
                  .length, //kaydırılabilir listenin eleman sayısını istiyor
              itemBuilder: (_, int indeksNumarasi) =>
                  mesajListesi[indeksNumarasi],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = "Kübra";

// ignore: must_be_immutable
class MesajBalonu extends StatelessWidget {
  String mesaj;

  // ignore: use_key_in_widget_constructors
  MesajBalonu({required this.mesaj});

  get color => null; //constructor(yapıcı/kurucu metot)

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.purple[300],
            //profil resmi için
            child: Text(isim[0]),
          ),
          Column(
            children: <Widget>[
              Text(isim), //kullanıcı adı göstermek için
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(mesaj), //mesajı göstermek için
              ),
            ],
          ),
        ],
      ),
    );
  }
}
