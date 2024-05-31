#!/bin/bash
#-eはファイルが存在するかをチェック
if [ -e $1 ];then
    #-fはファイルかをチェック。ちがければディレクトリってことなのでtypeにDirectoryを入れる
    if [ -f $1 ];then
        type="File"
    else
        type="Directory"
    fi

    #-rは読み取り権限があるかをチェック。wは書き込み、xは実行権限チェック
    if [ -r $1 ];then
        r="Read"
    fi
    if [ -w $1 ];then
        w="Write"
    fi
    if [ -x $1 ];then
        x="Execute"
    fi

    #-nは文字列が0より大きいかチェック。r,w,xにそれぞれ文字があるかをチェックさせている。3種類の権限があるか無いかの組み合わせなので!3=6通りの分岐が考えられる。
    if [ -n $r ];then
        if [ -n $w ];then
            if [ -n $x ];then
                echo $1"は"$type"です。アクセス権は"$r $w $x"です。"
            else
                echo $1"は"$type"です。アクセス権は"$r $w"です。"
            fi
        else
            echo $1"は"$type"です。アクセス権は"$r"です。"
        fi
    else
        if [ -n $w ];then
            if [ -n $x ];then
                echo $1"は"$type"です。アクセス権は"$w $x"です。"
            else
                echo $1"は"$type"です。アクセス権は"$w"です。"
            fi
        else
            if [ -n $x ];then
                echo $1"は"$type"です。アクセス権は"$x"です。"
            else
                echo $1"は"$type"です。アクセス権はありません。"
            fi
    fi

else
    read -p "作成しますか？:" num1
    case $num1 in
        [Yy][Ee][Ss]|[Yy])read -p "File ot Dir:" num2; case $num2 in
                [Ff]ile) touch $1 ; ls -l $1 ;;
                [Dd]ir) mkdir $1 ; echo ls -ld $1 ;;
            esac
    esac
fi

#参考サイト "https://qiita.com/kakkie/items/766e72b659a5b8a51991"