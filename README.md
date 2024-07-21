
# Teklifim Gelsin Case
### Requirements: 

> environment:
> sdk: >=3.1.0 <4.0.0

> App yalnızca IOS Simulator'da test edildi. 


## Yapılanlar
- İstenilen Kredi tuturı ve Vade aralığındaki teklifleri getirme
- Sponsorlu teklif detaylarını işleme
- Gelen tekliflerin detaylı kredi tablosuda dahil olmak üzere tüm detaylarını listeme
- Arayüzü orijinal app + web arayüzüne benzetme  
- Teklif kartlarının animasyonu
- **100.000 TL 36 Ay vade dahil olmak üzere tüm durumların işlenmesi**



## Case durumu nasıl işlendi ? 

> İlk olarak 3 adet kredi türünü baz alarak bir enum oluşturdum.
> Burada enum üstünde o krediye ait minimum ve maksimum (vade-tutar)limit eşiklerini ve bu eşik değerleri arasındaki sabit farkı belirledim.

```
enum LoanTypeEnum {
  personalFinanceLoan
  (value: 0,
   text: 'İhtiyaç Kredisi',
   upperAmountLimit: 300000,
   lowerAmountLimit: 1000,
   stepAmount: 1000,
   upperExpiryLimit: 36,
   lowerExpiryLimit: 1,
   stepExpiry: 12),
  
  houseLoan
  (value: 1,
  text: 'Konut Kredisi',
  upperAmountLimit: 5000000,
  lowerAmountLimit: 100000,
  stepAmount: 50000,
  upperExpiryLimit: 240,
  lowerExpiryLimit: 1,
  stepExpiry: 24),

  vehicleLoan
  (value: 2,
  text: 'Taşıt Kredisi',
  upperAmountLimit: 400000,
  lowerAmountLimit: 50000,
  stepAmount: 10000,
  upperExpiryLimit: 48,
  lowerExpiryLimit: 1,
  stepExpiry: 12),;

  const LoanTypeEnum({
    required this.value,
    required this.text,
    required this.upperAmountLimit,
    required this.lowerAmountLimit,
    required this.stepAmount,
    required this.upperExpiryLimit,
    required this.lowerExpiryLimit,
    required this.stepExpiry,
  });
  final int value;
  final String text;
  final double upperAmountLimit;
  final double lowerAmountLimit;
  final double stepAmount;
  final int upperExpiryLimit;
  final int lowerExpiryLimit;
  final int stepExpiry;
}

```

> Ardından kullanıcının slider veya text üzerinden kredi tutarı veya vade değişikliğinde seçili değerler üzerinden 
> mümkün olabilecek tüm istek versiyonlarını oluşturdum.
> Örnek olarak kullanıcı  **100.000 TL - 36 Ay - İhtiyaç Kredisi** gibi bir değer aralığı seçtiğinde :
> 
> 1- Seçili kredi tipinin limitleri içerisinde seçili ay dahil olmak üzere tüm vade seçeneklerini bul.
> 
> 2- Bu seçenekler **[12,24,36]** olarak bulunuyor çünkü ihtiyaç kredisinin değer aralığı **12**, bu yüzden mevcut vadeyi 12 eksilte eksilte ve minimum değere ulaşana kadar vade aralığı hesaplanıyor. Eğer **26** ay seçilmiş olsaydı **[12,24,26]** olacaktı.
> 
> 3- Vadeler bulunduktan sonra seçili kredi tutarı ile birlikte bu 3 seçenek içinde birer istek atılıyor. **Bu istekler eşzamanlı atılıyor teker teker değil**
> 
> 4- Bu isteklerin sonuçları döndüğünde eğer sonuçlar içerisinde hatalı response var ise bu değeri bir hata modeli ile viewModel'daki yerine yazıyoruz.
Geri kalan başarılı istekleri ise vade tutarının en büyük olanını seçip onuda successModele atıyoruz. Bu sayede elimizde bir hata modeli birde success modeli oluyor.
> 
> 5- Başarılı olan sonuç değerlerini slider ve textField değerlerine yansıtıyoruz. (Yani 24 ay'a izin veriliyorsa slider ve text 24 ay olarak güncelleniyor).
> 
> 6- Hata modeli varsada arayüzde hata mesajını basacak widget viewModel'dan bu mesajı alıp kullanıcıya gösteriyor.
```
Future<({OffersResponseModel? successOfferResponse, OfferLimitFailure? limitFailure})> checkResponsesForNewParams({required SearchParamsModel localSearchParams}) async {
    ///
    /// Olası SearchParamsModel'leri bir liste olarak alır
    ///
    final availableSearchParams = getAvailableSearchParams(localSearchParams: localSearchParams);

    /// Başarılı olan istek sonuçları için
    final List<OffersResponseModel> availableOfferResponseList = List<OffersResponseModel>.empty(growable: true);

    /// Başarısız olan istek sonuçları için
    final List<OfferLimitFailure> offerLimitFailureList = List<OfferLimitFailure>.empty(growable: true);

    ///
    /// Her bir SearchParamsModel için kredi tekliflerini getirir
    ///
    await Future.wait(availableSearchParams.map((e) => _offerRepository.getLoanOffers(searchParams: e)).toList()).then((value) {
      clearLimitError();
      for (final element in value) {
        element.fold(
          (l) {
            if (l is OfferLimitFailure) {
              offerLimitFailureList.add(l);
            } else {
              setError(l.getErrorMessage);
            }
          },
          availableOfferResponseList.add,
        );
      }
    });

    final OffersResponseModel? nearestOfferResponse = availableOfferResponseList.isEmpty
        ? null
        : availableOfferResponseList.max((a, b) => (a.maturity ?? localSearchParams.loanType.lowerExpiryLimit).compareTo(b.maturity ?? localSearchParams.loanType.lowerExpiryLimit));

    final OfferLimitFailure? nearestOfferLimitFailure = offerLimitFailureList.firstWhereOrNull((element) => element.errorAmountValue == localSearchParams.amount);

    return (successOfferResponse: nearestOfferResponse, limitFailure: nearestOfferLimitFailure);
  }

```



## Uygulama görselleri

![ss](https://github.com/mrasityilmaz/teklifimgelsin-case/blob/main/preview.png)



https://github.com/mrasityilmaz/teklifimgelsin-case/assets/81583706/0eb34c99-e4bb-4c55-be51-e9c1a3ecfd8b




<img width="340" heigth="680" alt="fi" src="https://github.com/mrasityilmaz/teklifimgelsin-case/assets/81583706/65b48647-95cb-46f1-9f82-9aca5d3adc31">
<img width="340" heigth="680" alt="fi" src="https://github.com/mrasityilmaz/teklifimgelsin-case/assets/81583706/b77eeb4e-a0d7-47e0-9184-eb3c37e25107">
<img width="340" heigth="680" alt="fi" src="https://github.com/mrasityilmaz/teklifimgelsin-case/assets/81583706/b0cbe61d-dbf4-490b-8fe5-60692c67506b">
<img width="340" heigth="680" alt="fi" src="https://github.com/mrasityilmaz/teklifimgelsin-case/assets/81583706/ec070802-2bbf-42fa-9d60-a353ec50d0aa">
<img width="340" heigth="680" alt="fi" src="https://github.com/mrasityilmaz/teklifimgelsin-case/assets/81583706/f40f518a-80a6-4f89-9c7c-90a528316f3a">
<img width="340" heigth="680" alt="fi" src="https://github.com/mrasityilmaz/teklifimgelsin-case/assets/81583706/846597a5-0da6-4172-998f-4121d058d6b0">
<img width="340" heigth="680" alt="fi" src="https://github.com/mrasityilmaz/teklifimgelsin-case/assets/81583706/560ef2dc-cca7-492e-a597-e06c3ac72b15">
<img width="340" heigth="680" alt="fi" src="https://github.com/mrasityilmaz/teklifimgelsin-case/assets/81583706/4e166cd5-3c16-4b1a-bb63-d9b3569d1c98">
<img width="340" heigth="680" alt="fi" src="https://github.com/mrasityilmaz/teklifimgelsin-case/assets/81583706/1511b5c1-908b-4cb8-bfef-8795d62fa783">

