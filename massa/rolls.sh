#!/bin/bash
#Thank's for https://raw.githubusercontent.com/bobu4/massa/main/bal.sh

cd $HOME/massa/massa-client
massa_wallet_address=$(./massa-client --pwd $massa_pass wallet_info | grep Address | awk '{ print $2 }')
while true
do
        balance=$(./massa-client --pwd $massa_pass wallet_info | grep "Rolls" | awk '{ print $3 }' | sed 's/final=//;s/,//')
        int_balance=${balance%%.*}
        echo Current rolls balance : ${int_balance}
        if [ $int_balance -lt 1 ]; then
                echo "Less than 1 Final Roll"
                resp=$(./massa-client --pwd $massa_pass buy_rolls $massa_wallet_address 1 0)
                echo $resp
        elif [ $int_balance -gt 1 ]; then
                echo "More than 1 Final Roll"
        fi
        date=$(date +"%H:%M")
        echo Last Update: ${date}
        printf "sleep"
        for((m=0; m<1; m++))
        do
                printf "."
                sleep 1m
        done
        printf "\n"
done