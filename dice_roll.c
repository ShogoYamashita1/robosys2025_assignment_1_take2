// SPDX-FileCopyrightText: 2025 Shogo Yamashita
// SPDX-License-Identifier: MIT

#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<ctype.h>


int GetRandom(int min, int max)
{
    return min + (int)(rand() * (max - min + 1.0) / (1.0 + RAND_MAX));
}


int main(void){
int input, dice_count = 0, face_count = 0, flag = 0;

// 入力処理
while((input = getchar()) != EOF){
    if(isdigit(input)){// 数値入力判定
        switch(flag){
            case 0:if(input == '0'){flag = -1;break;}// 0始まりならエラー
            case 1:if(flag != -1){// ロール数判定処理
                        flag = 1;
                        dice_count *= 10;
                        dice_count += (input - '0');
                   }break;

            case 2:if(input == '0'){flag = -1;break;}// 0始まりならエラー
            case 3:if(flag != -1){// 面数判定処理
                        flag = 3;
                        face_count *= 10;
                        face_count += (input - '0');
                   }break;

            default:break;
        }
    }

    else if(isalpha(input)){// 文字入力判定.dまたはDの時のみパス
        if( (input == 'd' || input == 'D') && flag == 1 ){
            flag = 2;
        }
        else{flag = -1;}
    }

    else if(input != '\n'){// その他の異常入力判定
        flag = -1;
    }
}



// 終了処理
if(flag == 3){// 正常終了
    srand((unsigned int)time(NULL));

    for(int i = 0; i < dice_count; i++){
        printf("%d\n", GetRandom(1, face_count));// ここでダイスロール
    }
    return 0;
}
else{// 異常終了
    fprintf(stderr, "\x1b[31merror: An invalid value was entered\x1b[0m\n");
    return 1;
}
}
