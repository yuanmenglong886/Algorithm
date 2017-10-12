//
//  SortAlgorithm.m
//  BinaryTree_Algorithm
//
//  Created by 58 on 2017/9/26.
//  Copyright © 2017年 yuanmenglong. All rights reserved.
//

#import "SortAlgorithm.h"

@implementation SortAlgorithm
+ (void)binaryInsertionSort:(NSMutableArray *)list
{

    
    if (list.count <= 1) {
        return;
    }
    for(int i = 1; i < list.count;i++)
    {
      int  left = 0;
      int right = i-1;
      int middle;
      NSInteger temp = [[list objectAtIndex:i] integerValue];
      while(left <= right)
      {
           middle = (right+left)/2;
           if([[list objectAtIndex:middle] integerValue] == temp)
           {
                 left = middle;
                 break;
           }
           else if([[list objectAtIndex:middle] integerValue] < temp)
           {
                  left = middle+1;
           }
           else
           {
                  right = middle-1;
           }
      }
      for(NSInteger j = i; j > left;j--)
      {
          [list replaceObjectAtIndex:j withObject:[list objectAtIndex:j-1]];
      }
       [list replaceObjectAtIndex:left withObject:@(temp)];
      
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    //从第1位开始，依次将数组分成2部分：前一部分可以视为已经排好序的，后一部分是未排序的
//    //对后一部分的数据依次遍历，插入到前一部分中的合适位置
//    for (int i=1; i<list.count; i++) {
//        int left = 0;
//        int right = i-1;
//        int middle;
//        //待排序的数（是未排序部分的第1个数，它的上一位数就是已经排序的部分的最后一位数）
//        NSInteger temp = [[list objectAtIndex:i] integerValue];
//
//        while (left <= right) {
//            //每次从已经排序的部分中取中间位置的数进行比较
//            middle = (left+right)/2;
//            //如果跟待排序数相等，则直接插入到此位置即可
//            if ([[list objectAtIndex:middle]integerValue] == temp){
//                left = middle;
//                break;
//            }
//            //如果比待排序数大，则从中间位置左边范围内再次取中间数查找（下一循环）
//            else if ([[list objectAtIndex:middle]integerValue] > temp) {
//                right = middle-1;
//            }
//            //如果比待排序数小，则从中间位置右边范围再次取中间数查找（下一循环）
//            else{
//                left = middle+1;
//            }
//        }
//        //循环结束，找到待插入位置left
//        //依次将left右边（比left位置数据都大）的数据向右移动一位
//        for (int j=i; j>left; j--) {
//            [list replaceObjectAtIndex:j withObject:[list objectAtIndex:j-1]];
//        }
//        //在left位置插入待排序数
//        [list replaceObjectAtIndex:left withObject:@(temp)];
//    }
}
+ (NSMutableArray *)quickSort:(NSMutableArray *)list
{
    if(list.count <=1)
    {
        return nil;
    }
    [self quickSort:list startIndex:0 endIndex:list.count-1];
    return list;
}
+ (void)quickSort:(NSMutableArray *)list startIndex:(NSInteger)start endIndex:(NSInteger)end
{
     if(start >= end)
     {
         return;
     }
     NSInteger low = start;
     NSInteger high = end;
     NSInteger  key = [[list objectAtIndex:low] integerValue];
     while(low < high)
     {
           while(([[list objectAtIndex:high] integerValue] >key)&&(low<high))
           {
                high--;
           }
           [list exchangeObjectAtIndex:low withObjectAtIndex:high];
           while ([[list objectAtIndex:low] integerValue] < key)
           {
               low++;
           }
           [list exchangeObjectAtIndex:low withObjectAtIndex:high];
     }
     [self quickSort:list startIndex:start endIndex:low-1];
     [self quickSort:list startIndex:low+1 endIndex:end];
    
//         if(start >= end)
//     {
//          return;
//     }
//     NSInteger low = start;
//     NSInteger high = end;
//     NSInteger key = [[list objectAtIndex:start] integerValue];
//     while(low < high)
//     {
//           while([[list objectAtIndex:high] integerValue] >= key && low < high)
//           {
//                  high--;
//           }
//           [list exchangeObjectAtIndex:low withObjectAtIndex:high];
//           while([[list objectAtIndex:low] integerValue] <= key && low<high)
//           {
//                 low++;
//           }
//           [list exchangeObjectAtIndex:high withObjectAtIndex:low];
//     }
//     [self quickSort:list startIndex:start endIndex:low-1];
//     [self quickSort:list startIndex:low+1 endIndex:end];
}
+ (NSMutableArray *)heapSort:(NSMutableArray *)array
{
     if(array.count <= 1)
     {
         return nil;
     }
     NSInteger i = 0;
   //  lenght = 2*i+1;  length = 2*(i+1);
     for(i = array.count/2-1;i >=0;i--)
     {
         [self heapAdjust:array withIndex:i length:array.count];
     }
     for(i = array.count-1; i> 0;i--)
     {
         [array exchangeObjectAtIndex:0 withObjectAtIndex:i];
         [self heapAdjust:array withIndex:0 length:i];
     }
     return array;
}
+ (void)heapAdjust:(NSMutableArray *)list withIndex:(NSInteger)index length:(NSInteger)length
{
         NSInteger lchild = index*2+1;
         while (lchild < length)
         {
             if((lchild +1 < length)&&([[list objectAtIndex:lchild+1] integerValue] > [[list objectAtIndex:lchild] integerValue]))
             {
                   lchild++;
             }
             if([[list objectAtIndex:lchild] integerValue] < [[list objectAtIndex:index] integerValue])
             {
                 break;
             }
             [list exchangeObjectAtIndex:lchild withObjectAtIndex:index];
             index = lchild;
             lchild = 2*index+1;
         }
}

+ (void)insertSort:(NSInteger [])a length:(NSInteger)length
{
   for(int i = 1; i < length;i++)
   {
         int  pre = i-1;
       
        if(a[i]<a[pre])
        {
            NSInteger tag = a[i];

            while(tag < a[pre]&&pre>=0)
            {
                 a[pre+1] = a[pre];
                 pre--;
            }
            a[pre+1] = tag;
        }
        [self print:a length:length];
   }
}
+ (void)shellSort:(NSInteger [])a length:(NSInteger)length
{
      NSInteger dk = length/2;
    while(dk>=1)
    {
         [self shellInsertSort:a length:length dk:dk];
         dk = dk/2;
    }
}
+ (void)shellInsertSort:(NSInteger [])arr length:(NSInteger)length dk:(NSInteger)dk
{
    
    for(NSInteger i= dk;i < length;i++)
    {
         NSInteger pre = i-dk;
       if(arr[i] < arr[pre])
       {
           NSInteger tag = arr[i];
           while (tag < arr[pre]&&pre>=0) {
                 arr[pre+dk] = arr[pre];
                 pre -= dk;
           }
           arr[pre+dk] = tag;
       }
//             [self print:arr length:length];
    }
        for(int i = 0;i < length;i++)
    {
         printf("%ld ",(long)arr[i]);
    }
    printf("\n");
}
+ (void)print:(NSInteger [])a  length:(NSInteger)length;
{
    for(int i = 0;i < length;i++)
    {
         printf("%ld ",(long)a[i]);
    }
    printf("\n");
}
//+ (NSMutableArray *)heapSort:(NSMutableArray *)array
//{
//     if(array.count <= 1)
//     {
//          return nil;
//     }
//     NSInteger i ;
//     for(i = array.count/2-1;i >= 0;i--)
//     {
//          [self heapAdjust:array withIndex:i andLength:array.count];
//     }
//     for(i = array.count-1;i >0;i--)
//     {
//          [array exchangeObjectAtIndex:0 withObjectAtIndex:i];
//          [self heapAdjust:array withIndex:0 andLength:i];
//     }
//     return array;
//}
//+ (void)heapAdjust:(NSMutableArray *)list withIndex:(NSInteger) index andLength:(NSInteger )length
//{
//      NSInteger lchild = index*2+1;
//      while(lchild < length)
//      {
//         if(lchild+1< length&&[[list objectAtIndex:lchild+1] integerValue] > [[list objectAtIndex:lchild] integerValue])
//         {
//               lchild++;
//         }
//         if([[list objectAtIndex:lchild] integerValue] < [[list objectAtIndex:index]integerValue])
//         {
//             break;
//         }
//         [list exchangeObjectAtIndex:lchild withObjectAtIndex:index];
//         index = lchild;
//         lchild = index*2+1;
//      }
//}
@end
