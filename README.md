<h1>Tablolar</h1>
<h1>
   <br>
events-> Bu tabloda sporcuların katıldığı etkinlikler/olayları yazmak istedim.Event adını ve zamanını tuttum.
  <br>
leagues->Bu tabloda futbol liglerini tuttum.Lig adı ve spor_id'si vb. bilgileri tuttum.
  <br>
players->Bu tabloda futbolcu bilgilerini tuttum. Oyuncu isimleri,takımları,pozisyonları,doğum tarihleri gibi.Sporcular ve Takımları foreign key ile bağladım.
  <br>
injuries->Bu tabloda sporcu sakatlanmaları, sakatlık tarihi,iyileşme tarihi, sporcu id gibi bilgileri tuttum.
  <br>
player_awards->player_id, ödül adı,ödül tarihi gibi bilgileri tuttum.Sporcuların aldıkları ödülleri gösterebilmek için yaptığım bir tabloydu.
  <br>
sports->Projemizde birden fazla spor dalı olması yoluyla çıktığım için sporlar diye bi tablo yaptım ancak sonradan kararımı değiştirip futbol üzerine yoğunlaştım.Vaktim olsaydı yazdığım üç spor için de eğlenceli bir platform düşünüyordum.
  <br>
news->Projemizde gerekli olduğu için bu tabloyu veri tabanından veri çekmek amacıyla yaptım  tabloda title ve content kısmı var bunları projemde kullandım.
  <br>
teams->Teams tablomda takımları isimleri ve spor id'si var sporcuları takımlarda gruplandırabilmek için yaptığım bir tablo.
  <br>
matches-> home team ve away team olarak takımları yazdım.Maç saati de ekledim maçlar kısmında olması gereken bilgilerin bunlar olduğuna inandım.
  <br>
match_details->Maç detaylarından bahsettiğim kısım için maç detayları tablosu oluşturdum içeriğinde penaltı,taç vb. maç pozisyonları hakkında bilgi barındıracak,yine home team ve away team bigisi içerecekti.
  <br>
match_results->match home team score ve away team score bilgilerini maç sonuçları kısmında göstermek için yaptığım bir tablo.
  <br>
player_statistics->Oyuncu performansını değerlendirebilmek amacıyla oyuncu istatistikleri adlı tablomda oyuncular, maçlar,goller,sarı kartlar,assistler,kırmızı kartlar gibi bilgileri buraya ekledim.
  <br>
sponsors-> takım id'sini foreign key ile bağlayıp takım sponsorlarını tuttum. Sponsorların hangi takımlara ait olduğunu belirtmek amacıyla foreign key kullandım.
  <br>
team_financials->profit,expenses,revenue gibi bilgileri tutması için bu tabloyu yaptım hangi takımın finansal durumu olduğunu belirtmek için team id2yi foreign key ile bağladım.
  <br>
transfers->karşı takıma geçtiğinde ne kadar ücret alacağını belirtmek için transfer_fee kullandım. Onun dışında Transfer tarihi, player id,hangi takımda olduğu ve hangi takıma gideceği bilgilerini tuttum.
  <br>
users->admin paneli için gerekli olduğundan dolayı kullanıcılar tablosu oluşturdum.
  <br>
event_participants->Event ve User id tuttum.
  <br>
fan_engagements->Fan etkileşimlerini yansıtacağım bir tablo oluşturdum.İçeriğinde fanların yorumları,isimleri vb. bilgiler tuttum.
  <br>
match_officials->Maç hakemlerinini tuttum.
  <br>
training_sessions->Bu kısmı halısaha skor vb. bi sayfa yapacaktım o yüzden ekledim. Halısaha sistemi yapmayı düşündüm.Randevu alabilmek için.
</h1>

