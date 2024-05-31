#!/bin/bash
i=`expr $RANDOM % 100`
echo -e "数当てゲームの始まり！\n\nコンピュータが考えた数値を当てましょう(10回のチャンス)"

count=0
while [ $count -ne "10" ];do
count=`expr $count + 1`
read -p "0~99の数値を入力してください:" num
if [ $i -lt $num ];then
    echo "もっと小さい"
elif [ $i -gt $num ];then
    echo "もっと大きい"
elif [ $i -eq $num ];then
    echo "あなたの勝ち！" $count "回入力で" $num "でした"
    count=10
    break
fi
if [ $count -eq "10" ];then
    echo "10回入力しました。あなたの負けです"
fi
done