# 🌐 Підключення до Krepto Server

## 📊 Стан Сервера
- ✅ **Нода працює** та синхронізована
- 📦 **Блоків**: 148+ (постійно зростає)
- 🔗 **3+ підключення** активні
- 🌍 **IP**: 5.189.133.204

## 🔧 RPC Підключення

### Параметри підключення:
- **Host**: `5.189.133.204`
- **Port**: `12347` (RPC)
- **Username**: `krepto`
- **Password**: `krepto123`

### Тестування з командного рядка:
```bash
# Загальна інформація
curl -u krepto:krepto123 -X POST \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"1.0","id":"test","method":"getblockchaininfo","params":[]}' \
  http://5.189.133.204:12347/

# Кількість блоків
curl -u krepto:krepto123 -X POST \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"1.0","id":"test","method":"getblockcount","params":[]}' \
  http://5.189.133.204:12347/

# Інформація про мережу
curl -u krepto:krepto123 -X POST \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"1.0","id":"test","method":"getnetworkinfo","params":[]}' \
  http://5.189.133.204:12347/
```

## 🌐 P2P Підключення

### Параметри P2P:
- **Host**: `5.189.133.204`
- **Port**: `12345` (P2P)

### Підключення з інших нод:
```bash
# Додавання як seed node
bitcoin-cli addnode 5.189.133.204:12345 add

# Або в конфігурації:
addnode=5.189.133.204:12345
```

## 🔍 Моніторинг

### Локальні команди на сервері:
```bash
# Статус ноди
./monitor_krepto.sh

# Швидка перевірка
./src/bitcoin-cli -rpcuser=krepto -rpcpassword=krepto123 getblockchaininfo

# Список пірів
./src/bitcoin-cli -rpcuser=krepto -rpcpassword=krepto123 getpeerinfo
```

## 🚀 Приклади використання

### Python:
```python
import requests
import json

url = "http://5.189.133.204:12347/"
auth = ("krepto", "krepto123")
headers = {"Content-Type": "application/json"}

def rpc_call(method, params=[]):
    payload = {
        "jsonrpc": "1.0",
        "id": "python",
        "method": method,
        "params": params
    }
    response = requests.post(url, json=payload, auth=auth, headers=headers)
    return response.json()

# Отримання інфи про блокчейн
result = rpc_call("getblockchaininfo")
print(f"Blocks: {result['result']['blocks']}")
```

### JavaScript:
```javascript
const axios = require('axios');

const rpcCall = async (method, params = []) => {
  const auth = Buffer.from('krepto:krepto123').toString('base64');
  
  try {
    const response = await axios.post('http://5.189.133.204:12347/', {
      jsonrpc: '1.0',
      id: 'js',
      method: method,
      params: params
    }, {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Basic ${auth}`
      }
    });
    
    return response.data.result;
  } catch (error) {
    console.error('RPC Error:', error);
  }
};

// Використання
rpcCall('getblockchaininfo').then(info => {
  console.log('Blocks:', info.blocks);
});
```

## 🔒 Безпека

⚠️ **Важливо**: Для продакшену змініть RPC credentials!

```bash
# Згенерувати безпечний пароль
openssl rand -hex 32

# Оновити конфігурацію
nano ~/.krepto/krepto.conf
```

## 📈 Поточна Активність

- 🏃‍♂️ **Активний майнінг** з MacBook
- 🔄 **Реальна синхронізація** між нодами  
- 📊 **Зростання блокчейну** в реальному часі 