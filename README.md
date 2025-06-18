# 🎭 Çocuk Kişilik Analizi

Çocukların karakter seçimleri ve takım oluşturma tercihlerine dayalı olarak kişilik analizlerinin yapıldığı interaktif Flutter uygulaması.

## 📱 Uygulama Hakkında

Bu uygulama, 3-10 yaş arası çocukların avatar seçimleri ve takım oluşturma sürecindeki tercihleri kullanarak kişilik analizleri yapar. Çocuklar oyunlaştırılmış bir ortamda karakterlerini seçer, takımlarını oluşturur ve AI destekli kişilik analizi alırlar.

## ✨ Özellikler

- **🎨 Avatar Seçimi**: 52 farklı karakter arasından seçim yapabilme
- **👥 Takım Oluşturma**: Seçilen karakterlerle özel takım kurma
- **🧠 AI Destekli Analiz**: OpenAI entegrasyonu ile kişilik analizi
- **🎮 Oyunlaştırılmış Deneyim**: Çocuk dostu arayüz ve animasyonlar
- **📊 Detaylı Raporlama**: Kişilik özellikleri, duygusal durum ve öneriler
- **🎭 Karakter Çeşitliliği**: Farklı fiziksel özellik ve duygusal durumlara sahip karakterler

## 🏗️ Teknoloji Stack

### Framework & UI

- **Flutter 3.6+** - Çapraz platform uygulama geliştirme
- **GetX** - State management ve navigation
- **Flutter ScreenUtil** - Responsive tasarım

### Animasyon & Görsel

- **Lottie** - JSON tabanlı animasyonlar
- **Flutter Animate** - UI animasyonları
- **Confetti** - Başarı animasyonları
- **Flutter SVG** - Vektör grafikleri

### AI & API

- **OpenAI API** - Kişilik analizi için yapay zeka
- **HTTPS** - API iletişimi

### Tipografi & İkonlar

- **Google Fonts** - Quicksand font ailesi
- **Material Icons** - UI ikonları

### Veri Yönetimi

- **SharedPreferences** - Yerel veri depolama
- **JSON** - Avatar verileri formatı

## 📁 Proje Yapısı

```
lib/
├── main.dart                    # Uygulama giriş noktası
├── core/                        # Temel servisler ve modeller
│   ├── models/                  # Veri modelleri
│   ├── services/                # API ve veri servisleri
│   ├── theme/                   # Tema ve renk tanımları
│   └── data/                    # Avatar verileri
├── features/                    # Özellik bazlı modüller
│   ├── welcome_page/            # Karşılama ekranı
│   ├── avatar_selection/        # Avatar seçim modülü
│   ├── create_team_page/        # Takım oluşturma modülü
│   ├── analysis/                # Kişilik analizi modülü
│   └── result_page/             # Sonuç gösterimi
└── shared/                      # Paylaşılan widget'lar
```

## 🚀 Kurulum ve Çalıştırma

### Ön Gereksinimler

- Flutter SDK 3.6.0 veya üzeri
- Dart SDK
- Android Studio / VS Code
- OpenAI API anahtarı

### 1. Projeyi Klonlayın

```bash
git clone [repository-url]
cd child_personality_analysis
```

### 2. Bağımlılıkları Yükleyin

```bash
flutter pub get
```

### 3. API Anahtarını Yapılandırın

OpenAI API anahtarınızı `lib/core/services/openai_service.dart` dosyasına ekleyin.

### 4. Uygulamayı Çalıştırın

```bash
flutter run
```

## 🎯 Kullanım Akışı

1. **Karşılama**: Kullanıcı uygulama ile tanışır
2. **Avatar Seçimi**: 5 karakter seçimi yapılır (52 avatar arasından)
3. **Takım Oluşturma**: Takım ismi belirlenir ve karakterlere isim verilir
4. **Analiz**: AI tabanlı kişilik analizi gerçekleştirilir
5. **Sonuçlar**: Detaylı analiz raporu görüntülenir

## 🔧 Geliştirme

### Test Çalıştırma

```bash
flutter test
```

### Build Alma

```bash
# Android
flutter build apk

# iOS
flutter build ios
```

## 📚 Avatar Sistemi

Uygulama 52 farklı avatar içerir ve her avatar şu özelliklere sahiptir:

- **Fiziksel Özellikler**: Yaş, cinsiyet, görünüm özellikleri
- **Duygusal Durum**: Mutlu, üzgün, öfkeli, sakin vb.
- **Ekstra Özellikler**: Özel yetenekler ve karakteristikler

## 🤖 AI Analizi

Kişilik analizi şu bölümlerden oluşur:

1. **Kişilik Analizi**: Seçilen karakterlere dayalı kişilik özellikleri
2. **Duygu Durumu**: Çocuğun duygusal durumu değerlendirmesi
3. **Öneriler**: Gelişim için öneriler ve rehberlik

## 📱 Desteklenen Platformlar

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ macOS
- ✅ Windows
- ✅ Linux

## 🤝 Katkıda Bulunma

1. Fork edin
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## 📄 Lisans

Bu proje MIT lisansı altında lisanslanmıştır.



### 🔗 Faydalı Linkler

- [Flutter Dokümantasyonu](https://docs.flutter.dev/)
- [GetX Dokümantasyonu](https://pub.dev/packages/get)
- [OpenAI API Dokümantasyonu](https://platform.openai.com/docs)
