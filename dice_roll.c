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
int input, dice_count = 0, face_count = 0, take = 0;
static int flag;

// 入力確認と数字分け
while((input = getchar()) != EOF){
    if(isalpha(input)){// 文字
        if( (input == 'd' || input == 'D') && flag != 2 && take != 0 ){
            flag = 1;
            take = 0;
        }
        else{flag = 2;}
    }
    else if(isdigit(input)){// 数字
        if(flag == 0){
            if( !(take == 0 && input == '0') ){
                dice_count *= 10;
                dice_count += (input - '0');
                take++;
            }
            else{
                flag = 2;
            }
        }
        else if(flag != 2){
            if( !(take == 0 && input == '0') ){
                face_count *= 10;
                face_count += (input - '0');
                take++;
                flag = 3;
            }
            else{flag = 2;}
        }
    }
    else if(input != '\n'){
        flag = 2;
    }
}


// 終了処理
if(flag == 3){
    srand((unsigned int)time(NULL));

    for(int i = 0; i < dice_count; i++){
        printf("%d\n", GetRandom(1, face_count));
    }
    return 0;
}
else{
    fprintf(stderr, "\x1b[31merror: An invalid value was entered\n");
    return 1;
}
}
