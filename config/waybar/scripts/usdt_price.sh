#!/bin/bash

wallex_result=$(timeout 10 curl -fSs --compressed 'https://api.wallex.ir/hector/web/v1/markets') || exit 1
usdt_rial_price=$(echo "$wallex_result" | jq -r '.result.markets[] | select(.symbol == "USDTTMN") | .price')
usdt_toman_price=$(($usdt_rial_price / 10))
echo "${usdt_toman_price:0:-2}.${usdt_toman_price: -2}"
