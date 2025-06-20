#!/bin/bash

# Krepto Network Monitoring Script
echo "🚀 Krepto Network Status Monitor"
echo "=================================="

# Check if bitcoind is running
if ! pgrep -f "bitcoind" > /dev/null; then
    echo "❌ bitcoind is not running!"
    echo "Start with: ./src/bitcoind"
    exit 1
fi

echo "✅ bitcoind is running"
echo ""

# Get blockchain info
echo "📊 Blockchain Information:"
echo "-------------------------"
BLOCKCHAIN_INFO=$(./src/bitcoin-cli getblockchaininfo)
BLOCKS=$(echo "$BLOCKCHAIN_INFO" | grep -o '"blocks": [0-9]*' | grep -o '[0-9]*')
HEADERS=$(echo "$BLOCKCHAIN_INFO" | grep -o '"headers": [0-9]*' | grep -o '[0-9]*')
BEST_HASH=$(echo "$BLOCKCHAIN_INFO" | grep -o '"bestblockhash": "[^"]*"' | grep -o '[0-9a-f]*')
DIFFICULTY=$(echo "$BLOCKCHAIN_INFO" | grep -o '"difficulty": [0-9e.-]*' | grep -o '[0-9e.-]*')

echo "📦 Current height: $BLOCKS blocks"
echo "📨 Headers: $HEADERS"
echo "🔑 Best block: $BEST_HASH"
echo "⚡ Difficulty: $DIFFICULTY"
echo ""

# Get network info
echo "🌐 Network Information:"
echo "----------------------"
NETWORK_INFO=$(./src/bitcoin-cli getnetworkinfo)
CONNECTIONS=$(echo "$NETWORK_INFO" | grep -o '"connections": [0-9]*' | grep -o '[0-9]*')
CONNECTIONS_IN=$(echo "$NETWORK_INFO" | grep -o '"connections_in": [0-9]*' | grep -o '[0-9]*')
CONNECTIONS_OUT=$(echo "$NETWORK_INFO" | grep -o '"connections_out": [0-9]*' | grep -o '[0-9]*')

echo "🔗 Total connections: $CONNECTIONS"
echo "📥 Incoming: $CONNECTIONS_IN"
echo "📤 Outgoing: $CONNECTIONS_OUT"
echo ""

# Show peers
echo "👥 Connected Peers:"
echo "------------------"
./src/bitcoin-cli getpeerinfo | grep -E '("addr"|"subver"|"synced_blocks")' | while read -r line; do
    if [[ $line == *"addr"* ]]; then
        ADDR=$(echo "$line" | grep -o '"[^"]*"' | tail -1 | tr -d '"')
        echo "🌍 Peer: $ADDR"
    elif [[ $line == *"subver"* ]]; then
        SUBVER=$(echo "$line" | grep -o '"[^"]*"' | tail -1 | tr -d '"')
        echo "   Version: $SUBVER"
    elif [[ $line == *"synced_blocks"* ]]; then
        SYNCED=$(echo "$line" | grep -o '[0-9]*')
        echo "   Synced blocks: $SYNCED"
        echo ""
    fi
done

echo "📈 Blockchain sync status:"
echo "-------------------------"
if [ "$BLOCKS" -eq "$HEADERS" ]; then
    echo "✅ Fully synchronized"
else
    echo "⏳ Syncing... ($BLOCKS/$HEADERS)"
fi

echo ""
echo "🔧 Quick Commands:"
echo "- Check status: ./monitor_krepto.sh"
echo "- View blocks: ./src/bitcoin-cli getblockchaininfo"
echo "- View peers: ./src/bitcoin-cli getpeerinfo"
echo "- Stop daemon: ./src/bitcoin-cli stop"
echo "- Start daemon: ./src/bitcoind" 