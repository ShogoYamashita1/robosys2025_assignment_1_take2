#!/bin/bash
# SPDX-FileCopyrightText: 2025 Shogo Yamashita
# SPDX-License-Identifier: MIT


### 異常終了関数 ###
# テスト終了時にも表示できるようng_lineで失敗した行を記録
ng () {
    if [ "${1}" != 0 ]; then
        echo ${1}行目で失敗しました
        res=1
    fi
}

### 行数チェック関数 ###
# 指定ロール回数と同じ出力行数になっているか確認
row_checker () {
    out_row=$(echo ${2} | tr ' ' '\n' | wc -l)

    if [ "${1}" = "$out_row" ]; then
        :
    else
        echo "[Failed] row_checker failed"
        return 1
    fi

    return 0
}

### 出目チェック関数 ###
# 出力結果が指定した出目の最大値を超えていないか確認
roll_checker () {
    for k in ${2}; do
        if [ $k -gt ${1} ];then
            echo "[Failed] roll_checker failed"
            return 1
        fi
    done

    return 0
}


res=0
ng_line=0
row_test_upper_limit=100
roll_test_upper_limit=100


### 通常入力 ###
# 1~test_upper_limitまでダイスロール
for ((i=1; i < $row_test_upper_limit; i++)); do
    for ((j=1; j < $roll_test_upper_limit; j++)); do
        echo ${i}d${j}
        out=$(echo ${i}d${j} | ./dice_roll)
        [ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
        row_checker $i "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }
        roll_checker $j "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }
        if [ $ng_line == 0 ];then
            echo -e "\e[32mpassed\e[0m"
        fi
    done
done



### テスト結果 ###
ng "$ng_line"
if [ "${res}" = 0 ]; then
    echo -e "\e[32mAll test cases passed successfully.\e[0m"
else
    echo -e "\e[31mTest failed\e[0m"
fi

exit $res
