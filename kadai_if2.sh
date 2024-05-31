#!/bin/bash
i=`expr $RANDOM % 100`
echo -e "数当てゲームの始まり！\n\nコンピュータが考えた数値を当てましょう(10回のチャンス)"
count=0

#countが11でなければ処理を繰り返す。10じゃない理由は数字を比較した後にcountを+1しているので、「10回目が終わる→22行目でcountが10になる→
#8行目で11ではないので10行目のチェックに進む→countが10なのでechoを出力→if終了して8行目で判定→11なのでwhileから抜けて処理終了」という流れをとるため
while [ $count -ne 11 ];do
#処理を始めるごとにcountの数を1ずつ増やしておく
    if [ $count -eq 10 ];then
        echo "10回入力しました。あなたの負けです"
    else
        read -p "0~99の数値を入力してください:" num
        if [ $i -lt $num ];then
            echo "もっと小さい"
        elif [ $i -gt $num ];then
            echo "もっと大きい"
        elif [ $i -eq $num ];then
            echo "あなたの勝ち！" $count"回入力で"$num"でした"
            break
        fi
    fi
    count=`expr $count + 1`
done
