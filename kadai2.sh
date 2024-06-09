#!/bin/bash
echo 借り手は地獄の闇金計算!
echo "作成者 0113"
while :
do
read -p "元金を入力 : " num1
    case $num1 in
        [Ee][Nn][Dd])
            echo 逃げます
            break ;;
        *[!0-9]*)
            echo 整数のみを入力してください
            continue ;;
        [0-9]*)
            while :
            do
            read -p "借入期間を10日単位で入力 : " num2
            case $num2 in
                [Ee][Nn][Dd])
                    echo 逃げます
                    break 2;;
                *[!0-9]*)
                    echo 整数のみを入力してください
                    continue ;;
                [0-9]*)
                    num3=$(( $num2 / 10 ))
                    num4=`echo "scale=3 ; 1.1 ^ $num3" | bc`
                    sum=`echo "$num4 * $num1" | bc`
                    sum2=`echo $sum | awk '{printf("%d\n",$1)}'`
                    echo -e "返済合計額は \e[0;31m $sum2 \e[0m 円です" 
                    break ;;
            esac 
            done ;;
    esac
done
