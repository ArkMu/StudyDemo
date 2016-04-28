#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>
#include <stdlib.h>

int main(void)
{
#if 0 // 输出缓冲区
    //stdout stdin 标准输入输出文件的缓冲都是行缓冲 
    //默认行缓冲的大小是 4096 个字节，可以通过通过 \n 强制 刷新缓冲区
    //stderr 是无缓冲
    fprintf(stderr, "zzzzzzzz");
    printf("hello,everyone: weiziqi  konglinghui\n");
    
    for (int i=0; i<4097; i++) {
        if (i < 4096) {
            printf("x");
        } else {
            printf("y\n");
        }
    }

    sleep(10); 
#else// 输入缓冲区 
    char ch = 0;
    printf("please input\n");
    scanf("%c", &ch);
    printf("ch ===== %c\n", ch);
    
    //getchar();// 取走输入缓冲区里的 回车符
    //fflush(stdin);
    fpurge(stdin);

    printf("please input\n");
    scanf("%c", &ch);
    printf("ch ===== %c\n", ch);

    fpurge(stdin);

    printf("please input\n");
    scanf("%c", &ch);
    printf("ch ===== %c\n", ch);

    int a = 0;
    scanf("%d", &a);
    printf("a >>>> %d\n", a);
    scanf("%d", &a);
    printf("a >>>> %d\n", a);

    char name[10] = {0};
    scanf("%s", name);
    //fgets(name, 10, stdin);
    printf("name >>>> %s\n", name);

#endif
   

    return 0; 
}
