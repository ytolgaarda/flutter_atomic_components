enum InputValidatorType {
  email(
    regex: r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    noMatchMessage: 'Geçerli bir e-posta adresi giriniz.',
  ),
  password(
    regex: r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
    noMatchMessage:
        'Şifre en az 8 karakter olmalı ve en az 1 harf, 1 rakam içermelidir.',
  ),
  name(
    regex: r'^[a-zA-ZğüşıöçĞÜŞİÖÇ\s]{2,}$',
    noMatchMessage: 'Geçerli bir isim giriniz.',
  ),
  phone(
    regex: r'^\+?[0-9]{10,15}$',
    noMatchMessage: 'Geçerli bir telefon numarası giriniz.',
  ),
  description(
    regex: r'^(?!\s*$).{10,100}$',
    noMatchMessage: 'Açıklama 10 ile 100 karakter arasında olmalıdır.',
  ),

  price(
    regex: r'^(?!\s*$)\d+(\.\d{1,2})?$',
    noMatchMessage: 'Geçerli bir fiyat giriniz.',
  ),
  alphanumeric(
    regex: r'^[a-zA-Z0-9]+$',
    noMatchMessage: 'Sadece harf ve rakam kullanabilirsiniz.',
  ),
  date(
    regex: r'^\d{2}/\d{2}/\d{4}$',
    noMatchMessage: 'Geçerli bir tarih giriniz (GG/AA/YYYY).',
  ),
  custom(
    regex: null,
    noMatchMessage: 'Geçersiz giriş.',
  );

  final String? regex;
  final String noMatchMessage;

  const InputValidatorType({
    required this.regex,
    required this.noMatchMessage,
  });
}
