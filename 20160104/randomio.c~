#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>
#include <stdlib.h>

int main(void)
{
    
    FILE *fp;
    fp = fopen("/Users/qingyun/Desktop/some.txt", "r");
    if (fp == NULL) {
        perror("open file");
        exit(1);
    }

    char ch;
    long position;

    // FILE *fp 是文件指针，用来找到整个文件
    // 但是文件在进行操作时，使用内部操作指针来操作内容（因为文件都是驻留在磁盘上有序的数据集）
    // 打开文件时，文件内部操作指针就停留在文件内容的首地址
    ch = fgetc(fp);
    printf("ch ===== %c\n", ch);
    position = ftell(fp); // ftell 可以告诉我们现在文件内部操作指针的位置
    printf("pos ===== %ld\n", position);
    ch = fgetc(fp);
    printf("ch ===== %c\n", ch);
    position = ftell(fp);
    printf("pos ===== %ld\n", position);
    printf("ch ===== %c\n", ch);
    ch = fgetc(fp);
    position = ftell(fp);
    printf("pos ===== %ld\n", position);
    printf("ch ===== %c\n", ch);
    ch = fgetc(fp);
    position = ftell(fp);
    printf("pos ===== %ld\n", position);

    printf("回到开始>>>>>>>>>>>>>>>>>>>>>>>>\n");
    rewind(fp); // rewind 可以把文件内部操作指针移回到文件内容的开始
    ch = fgetc(fp);
    printf("ch ===== %c\n", ch);
    position = ftell(fp);
    printf("pos ===== %ld\n", position);
            
    // fseek
    //SEEK_SET 文件开始
    //SEEK_CUR(rent) 当前文件内部操作指针的位置
    //SEEK_END 文件末尾
    printf("往后偏移2>>>>>>>>>>>>>>>>>>>>>>>>\n");
    fseek(fp, 2, SEEK_CUR);

    ch = fgetc(fp);
    printf("ch ===== %c\n", ch);
    position = ftell(fp);
    printf("pos ===== %ld\n", position);

    printf("往前偏移-10>>>>>>>>>>>>>>>>>>>>>>>>\n");
    fseek(fp, -10, SEEK_END);
    ch = fgetc(fp);
    printf("ch ===== %c\n", ch);
    position = ftell(fp);
    printf("pos ===== %ld\n", position);


   


    fclose(fp);

    return 0; 
}
