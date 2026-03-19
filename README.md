# TRON Full Node Setup

## Overview

This project demonstrates how to run a TRON full node using the official Java-Tron implementation and expose a public RPC endpoint.

The node is running on mainnet and syncing with the TRON network. The node exposes RPC endpoints for querying blockchain data.

---

## Public RPC Endpoint

HTTP (Non-secure):
http://139.59.17.97:8090/wallet/getnowblock

HTTPS (Secure):
https://tron-node.duckdns.org/wallet/getnowblock

---

## Setup Steps

### 1. Update system

```bash
sudo apt update
sudo apt upgrade -y
```

---

### 2. Install Java

```bash
sudo apt install openjdk-8-jdk -y
java -version
```

Java 8 is required for Java-Tron.

---

### 3. Download node files

```bash
wget https://github.com/tronprotocol/java-tron/releases/latest/download/FullNode.jar
wget https://raw.githubusercontent.com/tronprotocol/tron-deployment/master/main_net_config.conf
```

---

### 4. Start the node

```bash
java -Xmx12g -jar FullNode.jar -c main_net_config.conf
```

After starting, the node begins syncing with the TRON network.

---

### 5. Monitor logs

```bash
tail -f logs/tron.log
```

Example output:

```
Success process block Num: 1210
```

This indicates the node is syncing and processing blocks.

---

### 6. Run in background (optional)

```bash
screen -S tron
java -Xmx12g -jar FullNode.jar -c main_net_config.conf
```

To detach:

```
Ctrl + A + D
```

---

### 7. Open port

```bash
sudo ufw allow 8090
```

---

## API Usage

### Get Latest Block

# HTTP
curl http://139.59.17.97:8090/wallet/getnowblock

# HTTPS
curl https://tron-node.duckdns.org/wallet/getnowblock

---

### Response

```json
{
  "blockID": "0000000000003d899165c59fc0254a08faeeb24a73f164186e33eb10475743db",
  "block_header": {
    "raw_data": {
      "number": 15753,
      "txTrieRoot": "0000000000000000000000000000000000000000000000000000000000000000",
      "witness_address": "417040583133e831953ea4f65a8196fcffcfbf0d80",
      "parentHash": "0000000000003d88ee40eb522a143fbbdb444eae64430b8a2a05648ea81dc901",
      "timestamp": 1529938809000
    },
    "witness_signature": "14228bbb8b581e1c35bf621102887600621d8662c6d8d1363edade6da21d31511a0fa6c76d8123f2b4802e08dc86ae1e3c2d0622d97154174e885c55490d84a401"
  }
}
```

---

### Get Block by Number

# HTTP (Non-secure)
curl -X POST "http://139.59.17.97:8090/wallet/getblockbynum" -H "Content-Type: application/json" -d '{"num":1000}'

# HTTPS (Secure)
curl -X POST https://tron-node.duckdns.org/wallet/getblockbynum -H "Content-Type: application/json" -d '{"num":1000}'

### Response

```json
{
  "blockID": "00000000000003e80824d16f666b61fab947b0565a46261c7ca5a1c19466ba38",
  "block_header": {
    "raw_data": {
      "number": 1000,
      "txTrieRoot": "0000000000000000000000000000000000000000000000000000000000000000",
      "witness_address": "41a8bb7680d85f9821b3d82505edc4663f6fbd8fde",
      "parentHash": "00000000000003e737d8e82c50f5384491c97b11237e3eaf43b714dbf5a4c220",
      "timestamp": 1529894538000
    },
    "witness_signature": "1d34615fa483cc767489fc9a01abc39ce98af85d4dcd8afbbc1733b3a407c7d66dcc33396cfa60b51133da4694518242f776966215b2cac0f829b7a80fcee72301"
  }
}
```

---

## Server Details

- OS: Ubuntu
- Java Version: OpenJDK 8
- Network: TRON Mainnet
- Port: 8090
- Storage: 200GB SSD

---

## Notes

- The node is currently syncing with TRON mainnet.
- Initial sync can take time depending on system resources.
- Java 8 is required to run Java-Tron.
- Port 8090 must be open to access the API externally.

---
