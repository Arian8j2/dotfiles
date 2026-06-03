#!/bin/bash

nobitex_result=$(timeout 10 curl -fSs --compressed 'https://api.nobitex.ir/v2/orderbook/USDTIRT') || exit 1
usdt_rial_price=$(echo "$nobitex_result" | jq '.bids.[0].[0] | tonumber')

# sometimes nobitex returns null
if [ -z "$usdt_rial_price" ]; then
    exit 1
fi

usdt_toman_price=$(($usdt_rial_price / 100))
echo "${usdt_toman_price:0:-2}.${usdt_toman_price: -2}"
