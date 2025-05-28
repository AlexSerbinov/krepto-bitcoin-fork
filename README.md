# Krepto - Standalone Cryptocurrency Client

![Krepto Logo](share/pixmaps/krepto128.png)

**Krepto** - це повністю автономний криптовалютний клієнт з вбудованим майнінгом. Форк Bitcoin Core з власною мережею та простим GUI інтерфейсом.

## 🚀 Швидкий Старт

### Запуск GUI Клієнта (Рекомендовано)

```bash
# Запуск standalone GUI клієнта
./src/qt/bitcoin-qt -datadir=/Users/serbinov/.krepto
```

**Це все!** GUI автоматично:
- Запустить власний демон
- Підключиться до Krepto мережі  
- Буде готовий до майнінгу

### Майнінг через GUI

1. Відкрийте **Tools** → **Mining Console**
2. Натисніть **Start Mining**
3. Спостерігайте за статистикою в реальному часі

## 📊 Характеристики Мережі

- **Тікер**: KREPTO
- **Порт P2P**: 12345
- **Порт RPC**: 12347
- **Magic Bytes**: KREP (0x4b524550)
- **Genesis Hash**: `00000d2843e19d3f61aaf31f1f919a1be17fc1b814d43117f8f8a4b602a559f2`
- **SegWit**: Активний з genesis блоку

## 🎮 Функції

### ✅ Standalone GUI
- Повністю автономний клієнт
- Не потребує окремого демона
- Вбудований майнінг
- Реальний час статистика

### ✅ Майнінг Система
- Інтегрований в GUI
- Автоматичне створення адрес
- Рандомізація параметрів
- Детальне логування

### ✅ Мережа
- Власна Krepto мережа
- Стабільна робота 24/7
- Автоматичне підключення
- Висока швидкість транзакцій

## 🔧 Альтернативні Способи Запуску

### CLI Демон (Для досвідчених користувачів)

```bash
# Запуск демона
./src/bitcoind -datadir=/Users/serbinov/.krepto -daemon

# Перевірка статусу
./src/bitcoin-cli -datadir=/Users/serbinov/.krepto -rpcport=12347 getblockchaininfo

# Майнінг через CLI
./src/bitcoin-cli -datadir=/Users/serbinov/.krepto -rpcport=12347 generatetoaddress 1 $(./src/bitcoin-cli -datadir=/Users/serbinov/.krepto -rpcport=12347 getnewaddress)

# Зупинка демона
./src/bitcoin-cli -datadir=/Users/serbinov/.krepto -rpcport=12347 stop
```

## 📁 Структура Файлів

```
krepto/
├── src/
│   ├── qt/bitcoin-qt          # GUI клієнт (рекомендовано)
│   ├── bitcoind               # Демон
│   ├── bitcoin-cli            # CLI інтерфейс
│   └── bitcoin-tx             # Утиліта транзакцій
├── share/                     # Ресурси та іконки
└── README.md                  # Цей файл
```

## 🎯 Для Користувачів

### Простий Спосіб (GUI)
1. Запустіть `./src/qt/bitcoin-qt -datadir=/Users/serbinov/.krepto`
2. Дочекайтеся синхронізації
3. Відкрийте **Tools** → **Mining Console**
4. Натисніть **Start Mining**

### Що Відбувається
- GUI автоматично запускає демон
- Підключається до Krepto мережі
- Синхронізує blockchain
- Готовий до майнінгу та транзакцій

## 📈 Статистика Мережі

- **Поточна висота**: ~4760+ блоків
- **Активні вузли**: Стабільна мережа
- **Час блоку**: ~10 хвилин (як Bitcoin)
- **Difficulty**: Автоматичне налаштування

## 🔒 Безпека

- Базується на Bitcoin Core
- Перевірений код
- SegWit підтримка
- Захищені транзакції

## 🆘 Підтримка

### Часті Проблеми

**Q: GUI не запускається**
A: Переконайтеся що скомпільований проєкт: `make -j8`

**Q: Майнінг не працює**
A: Перевірте що демон запущений та синхронізований

**Q: Немає підключень**
A: Мережа автоматично підключиться, зачекайте 1-2 хвилини

### Логи

GUI логи знаходяться в:
- macOS: `~/Library/Application Support/Krepto/debug.log`
- Linux: `~/.krepto/debug.log`

## 🏗️ Збірка з Вихідного Коду

```bash
# Встановлення залежностей (macOS)
brew install autoconf automake libtool pkg-config

# Компіляція
./autogen.sh
./configure
make -j8

# Запуск
./src/qt/bitcoin-qt -datadir=/Users/serbinov/.krepto
```

## 📄 Ліцензія

MIT License - дивіться файл COPYING для деталей.

## 🌟 Особливості Krepto

- **Простота**: Один клік для запуску майнінгу
- **Автономність**: Не потребує зовнішніх сервісів
- **Стабільність**: Базується на Bitcoin Core
- **Швидкість**: Оптимізований для продуктивності
- **Безпека**: Enterprise-grade захист

---

**Krepto - Майбутнє Криптовалют Сьогодні! 🚀**
