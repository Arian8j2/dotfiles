#!/bin/bash

COINS="solana,the-open-network,ethereum,bitcoin"

CACHE_FOLDER=/tmp/waybar-crypto-prices
CACHE_DATA_PATH="$CACHE_FOLDER/data"
CACHE_INVALID_PATH=$CACHE_FOLDER/invalid_time
CACHE_KEEP_TIME=5 # minute
CACHE_INVALID_TIME=$(cat $CACHE_INVALID_PATH 2>/dev/null || echo 0)

mkdir -p $CACHE_FOLDER

update_cache() {
    local api_query="https://api.coingecko.com/api/v3/simple/price?ids=$COINS&vs_currencies=usd"
    local api_result=$(curl -fSs -H 'Accpet: application/json' "$api_query") || return 1

    # local sol_price=$(echo "$api_result" | jq .solana.usd)
    # local eth_price=$(echo "$api_result" | jq .ethereum.usd)
    # local bitcoin_price=$(echo "$api_result" | jq .bitcoin.usd)
    #
    # # jq fails with keys that has dash in them, so we have to escape it
    # local ton_price=$(echo "$api_result" | jq ".[\"the-open-network\"].usd")

    ((CACHE_INVALID_TIME=$now_time + $CACHE_KEEP_TIME * 60))
    echo "$CACHE_INVALID_TIME" > "$CACHE_INVALID_PATH"
    echo "$api_result" > "$CACHE_DATA_PATH"
}



now_time=$EPOCHSECONDS
if [ $now_time -gt $CACHE_INVALID_TIME ]; then
    update_cache
fi
cat "$CACHE_DATA_PATH" | jq ".[\"$1\"].usd"
