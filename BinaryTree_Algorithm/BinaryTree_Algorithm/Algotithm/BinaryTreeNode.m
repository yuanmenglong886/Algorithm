//
//  BinaryTreeNode.m
//  BinaryTree_Algorithm
//
//  Created by 58 on 2017/9/26.
//  Copyright © 2017年 yuanmenglong. All rights reserved.
//

#import "BinaryTreeNode.h"
#define  GETMAX(a,b)    (a>b?a:b)


@implementation TreeNodeProperty

@end
@implementation BinaryTreeNode
- (instancetype)initWithValue:(NSInteger)value
{
    if(self = [super init])
    {
         self.value = value;
    }
    return self;
}
+ (BinaryTreeNode *)createTreeWithValues:(NSArray *)values
{
   BinaryTreeNode *root = nil;
   for(NSInteger i = 0; i < values.count;i++)
   {
       NSInteger value = [[values objectAtIndex:i] integerValue];
       root = [BinaryTreeNode insertBinaryTree:root value:value];
   }
   return root;
}
+ (BinaryTreeNode *)insertBinaryTree:(BinaryTreeNode *)rootNode value:(NSInteger )value
{
    if(!rootNode)
    {
         rootNode = [BinaryTreeNode new];
         rootNode.value = value;
         // 小于根节点 ，插入左子树
    }else if(value <= rootNode.value)
    {
         rootNode.leftNode = [BinaryTreeNode insertBinaryTree:rootNode.leftNode value:value];
    }else
    {
       //  大于根节点 ，插入右子树
        rootNode.rightNode = [BinaryTreeNode insertBinaryTree:rootNode.rightNode value:value];
    }
    return rootNode;
}
//   找出二叉树中某个索引出的结点
+ (BinaryTreeNode *)treeNodeAtIndex:(NSInteger)index inTree:(BinaryTreeNode *)rootNode
{
      if(index < 0|| !rootNode)
      {
           return nil;
      }
      //  使用队列来辅助 查找
      NSMutableArray *queue = [NSMutableArray array];
      [queue addObject:rootNode];
      while(queue.count > 0)
      {
          BinaryTreeNode *node = [queue firstObject];
          if(index == 0)
          {
               return node;
          }
         [queue removeObjectAtIndex:0];
          index--;
          if(node.leftNode)
          {
           [queue addObject:node.leftNode];
          }
          if(node.rightNode)
          {
             [queue addObject:node.rightNode];
          }
      }
      return  nil;
}
+ (void)levelPrintBinaryTreeNode:(BinaryTreeNode *)rootNode handler:(void (^)(BinaryTreeNode *))handler
{
       if(!rootNode)
       {
          return;
       }
       NSMutableArray *queue = [NSMutableArray array];
       [queue addObject:rootNode];
       while (queue.count > 0) {
             BinaryTreeNode *node = [queue firstObject];
             if(!node)
             {
                 break;
             }
             if(handler)
             {
                handler(node);
             }
             [queue removeObjectAtIndex:0];
             if(node.leftNode)
             {
                 [queue addObject:node.leftNode];
             }
             if(node.rightNode)
             {
                [queue addObject:node.rightNode];
             }
        }
}
+ (void)preOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void (^)(BinaryTreeNode *))handelr
{
      if(!rootNode)
      {
          return;
      }
      if(handelr)
      {
         handelr(rootNode);
      }
      if(rootNode.leftNode)
      {
           [BinaryTreeNode preOrderTraverseTree:rootNode.leftNode handler:handelr];
      }
      if(rootNode.rightNode)
      {
           [BinaryTreeNode preOrderTraverseTree:rootNode.rightNode handler:handelr];
      }
}
+ (void)inOderOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void (^)(BinaryTreeNode *))handelr
{
      if(!rootNode)
      {
          return;
      }
      if(rootNode.leftNode)
      {
           [BinaryTreeNode inOderOrderTraverseTree:rootNode.leftNode handler:handelr];
      }
      if(handelr)
      {
         handelr(rootNode);
      }

      if(rootNode.rightNode)
      {
           [BinaryTreeNode inOderOrderTraverseTree:rootNode.rightNode handler:handelr];
      }
}
+ (void)lastOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void (^)(BinaryTreeNode *))handelr
{
    if(!rootNode)
    {
        return;
    }
    if(rootNode.leftNode)
    {
        [BinaryTreeNode lastOrderTraverseTree:rootNode.leftNode handler:handelr];
    }
    if(rootNode.rightNode)
    {
        [BinaryTreeNode lastOrderTraverseTree:rootNode.rightNode handler:handelr];
    }
    if(handelr)
    {
      handelr(rootNode);
    }
}
+ (NSInteger )depthOfTree:(BinaryTreeNode *)rootNode
{
      if(!rootNode)
      {
         return 0;
      }
      if(!rootNode.leftNode&&!rootNode.rightNode)
      {
           return 1;
      }
      NSInteger max = [BinaryTreeNode depthOfTree:rootNode.leftNode]>[BinaryTreeNode depthOfTree:rootNode.rightNode]?[BinaryTreeNode depthOfTree:rootNode.leftNode]:[BinaryTreeNode depthOfTree:rootNode.rightNode];
      return GETMAX([BinaryTreeNode depthOfTree:rootNode.leftNode] ,[BinaryTreeNode depthOfTree:rootNode.rightNode])+1;
}
+ (NSInteger)widthOfTree:(BinaryTreeNode *)rootNode {
    if (!rootNode) {
        return 0;
    }
    
    NSMutableArray *queueArray = [NSMutableArray array]; //数组当成队列
    [queueArray addObject:rootNode]; //压入根节点
    NSInteger maxWidth = 1; //最大的宽度，初始化为1（因为已经有根节点）
    NSInteger curWidth = 0; //当前层的宽度
    
    while (queueArray.count > 0) {
        
        curWidth = queueArray.count;
        //依次弹出当前层的节点
        for (NSInteger i=0; i<curWidth; i++) {
            BinaryTreeNode *node = [queueArray firstObject];
            [queueArray removeObjectAtIndex:0]; //弹出最前面的节点，仿照队列先进先出原则
            //压入子节点
            if (node.leftNode) {
                [queueArray addObject:node.leftNode];
            }
            if (node.rightNode) {
                [queueArray addObject:node.rightNode];
            }
        }
        //宽度 = 当前层节点数
        maxWidth = MAX(maxWidth, queueArray.count);
    }
    
    return maxWidth;
//    if (!rootNode) {
//        return 0;
//    }
//
//    //  队列存放树的结点
//    NSMutableArray *queueArray = [NSMutableArray array];
//
//    [queueArray addObject:rootNode];
//    NSInteger level = 1;
//    NSInteger maxWidth = 1; //最大的宽度，初始化为1（因为已经有根节点）
//    NSInteger curWidth = 0; //当前层的宽度
//    BinaryTreeNode *tagNode = [BinaryTreeNode new];
//       tagNode.value = MAXFLOAT;
//   [queueArray addObject:tagNode];
//    while (queueArray.count>0)
//    {
//        NSInteger count = queueArray.count;
//          for(int i = 0; i < count;i++)
//          {
//                  BinaryTreeNode *node = [queueArray firstObject];
//                  [queueArray removeObjectAtIndex:0];
//                  if(node.value == tagNode.value)
//                  {
//                        break;
//                  }
//                  if(node.leftNode)
//                  {
//                      [queueArray addObject:node.leftNode];
//                  }
//                  if(node.rightNode)
//                  {
//                      [queueArray addObject:node.rightNode];
//                  }
//          }
//          if(queueArray.count != 0)
//          {
//            [queueArray addObject:tagNode];
//          }
//          curWidth = queueArray.count-1;
//          maxWidth = GETMAX(maxWidth, curWidth);
//    }
//    return maxWidth;
}
+ (NSInteger )numberOfNodesInTree:(BinaryTreeNode *)rootNode
{
    if(!rootNode)
    {
        return 0;
    }
    return [BinaryTreeNode numberOfNodesInTree:rootNode.leftNode]+[BinaryTreeNode numberOfNodesInTree:rootNode.rightNode]+1;
}
+ (NSInteger )numberOfNodesOnLevel:(NSInteger)level inTree:(BinaryTreeNode *)rootNode
{
      if(level < 1 || !rootNode)
      {
          return 0;
      }
      if(level ==1)
      {
          return 1;
      }
      return [self numberOfNodesOnLevel:level-1 inTree:rootNode.leftNode]+[self numberOfNodesOnLevel:level-1 inTree:rootNode.rightNode];
}
// 叶子结点的满足条件是 左子树和右子树都为空
+ (NSInteger)numberOfLeafsInTree:(BinaryTreeNode *)rootNode
{
      if(!rootNode)
      {
         return 0;
      }
      if(!rootNode.leftNode && !rootNode.rightNode)
      {
           return 1;
      }
      return [self numberOfLeafsInTree:rootNode.leftNode]+[self numberOfLeafsInTree:rootNode.rightNode];
    
}
+ (NSInteger )maxDistanceOfTree:(BinaryTreeNode *)rootNode
{

//    第一种实现方案

        if(!rootNode)
        {
            return 0;
        }
        // 1. 最远距离经过根节点： 距离= 左子树深度+ 右子树深度
        NSInteger distance = [self depthOfTree:rootNode.leftNode]+[self depthOfTree:rootNode.rightNode];
       //  2. 最远距离在根节点左子树上，计算左子树最远距离
       NSInteger  disLeft = [self maxDistanceOfTree:rootNode.leftNode];
       //  3. 最远距离在根节点右子树上，计算右子树最远距离
       NSInteger disRight = [self maxDistanceOfTree:rootNode.rightNode];
       return GETMAX(distance, GETMAX(disLeft, disRight));
 
 
//    return [self propertyOfTreeNode:rootNode].distance;
}
+ (TreeNodeProperty *)propertyOfTreeNode:(BinaryTreeNode *)rootNode
{
    if(!rootNode)
    {
        return nil;
    }
    TreeNodeProperty *left = [self propertyOfTreeNode:rootNode.leftNode];
    TreeNodeProperty *right = [self propertyOfTreeNode:rootNode.rightNode];
    TreeNodeProperty *p = [TreeNodeProperty new];
    p.depth = MAX(left.depth,+right.depth)+1;
    p.distance = MAX(MAX(left.distance,right.distance),left.depth+right.depth);
    return p;
}

+ (NSArray *)pathOfTreeNode:(BinaryTreeNode *)treeNode inTree:(BinaryTreeNode *)rootNode handler:(BOOL (^)(BinaryTreeNode *treeNode,BinaryTreeNode *rootNode))handler
{
       NSMutableArray *array = [NSMutableArray array];
      [self isFoundTreeNode:treeNode inTree:rootNode routePath:array handler:handler];
      return array;
}
+ (BOOL)isFoundTreeNode:(BinaryTreeNode *)treeNode inTree:(BinaryTreeNode *)rootNode routePath:(NSMutableArray *)path handler:(BOOL(^)(BinaryTreeNode *treeNode,BinaryTreeNode *rootNode))handler
{
      if(!treeNode||!rootNode)
      {
           return NO;
       }
       [path addObject:rootNode];
       BOOL result = handler(treeNode,rootNode);
       if(result)
       {
           return YES;
       }
       BOOL isFind = [self isFoundTreeNode:treeNode inTree:rootNode.leftNode routePath:path handler:handler];
       if(!isFind)
       {
         isFind = [self isFoundTreeNode:treeNode inTree:rootNode.rightNode routePath:path handler:handler];
       }
       if(!isFind)
       {
          [path removeObject:rootNode];
       }
       return isFind;
}
+ (BinaryTreeNode *)parentOfNode:(BinaryTreeNode *)nodeA andNode:(BinaryTreeNode *)nodeB inTree:(BinaryTreeNode *)rootNode handler:(BOOL (^)(BinaryTreeNode *, BinaryTreeNode *))handler
{
     if(!nodeA || !nodeB || !rootNode)
     {
          return nil;
     }
     if(nodeB == nodeA)
     {
        return nodeA;
     }
     NSArray *pathA = [self pathOfTreeNode:nodeA inTree:rootNode handler:handler];
     NSArray *pathB = [self pathOfTreeNode:nodeB inTree:rootNode handler:handler];
     if(pathA.count == 0||pathB.count == 0)
     {
         return nil;
     }
     for(NSInteger i = pathA.count-1;i>= 0;i--)
     {
                   BinaryTreeNode *nodePA = [pathA objectAtIndex:i];
          for(NSInteger j = pathB.count-1;j>=0;j--)
          {
               BinaryTreeNode *nodePB = [pathB objectAtIndex:j];
               BOOL result = handler(nodePA,nodePB);
                if(result)
                {
                      return nodePA;
                }
          }
     }
     return nil;
}
+ (NSArray *)pathFromNode:(BinaryTreeNode *)nodeA toNode:(BinaryTreeNode *)nodeB inTree:(BinaryTreeNode *)rootNode handler:(BOOL (^)(BinaryTreeNode *, BinaryTreeNode *))handler
{
     NSMutableArray *array = [NSMutableArray array];
     if(!nodeB || !nodeA ||!rootNode)
     {
         return nil;
     }
     NSArray *pathA = [self pathOfTreeNode:nodeA inTree:rootNode handler:handler];
     NSArray *pathB = [self pathOfTreeNode:nodeB inTree:rootNode handler:handler];
     if(pathA.count == 0|| pathB.count == 0)
     {
         return nil;
     }

     for(NSInteger i = pathA.count-1;i >= 0;i--)
     {
         BinaryTreeNode *nodePA = [pathA objectAtIndex:i];
              [array addObject:nodePA];
         for(int j = pathB.count-1;j >= 0;j--)
         {
          

               BinaryTreeNode *nodePB = [pathB objectAtIndex:j];
               BOOL result = handler(nodePA,nodePB);
                if(result)
                {
                    while(++j < pathB.count)
                    {
                          [array addObject:[pathB objectAtIndex:j]];
                    }
                    break;
                }
         }
     }
     return array;
}
+ (NSInteger )distanceFromNode:(BinaryTreeNode *)nodeA toNode:(BinaryTreeNode *)nodeB inTree:(BinaryTreeNode *)rootNode handler:(BOOL (^)(BinaryTreeNode *, BinaryTreeNode *))handler
{
      if(!nodeA || !nodeB || !rootNode)
      {
           return -1;
      }
      NSArray *pathA = [self pathOfTreeNode:nodeA inTree:rootNode handler:handler];
      NSArray *pathB = [self pathOfTreeNode:nodeB inTree:rootNode handler:handler];
      if(pathA.count == 0||pathB.count == 0)
      {
           return -1;
      }
      for(NSInteger i = pathA.count-1;i>= 0;i-- )
      {
        BinaryTreeNode *nodePA = [pathA objectAtIndex:i];
            for(NSInteger j = pathB.count-1;j >= 0;j--)
            {
                  BinaryTreeNode *nodePB = [pathB objectAtIndex:j];
                  BOOL result = handler(nodePA,nodePB);
                  if(result)
                  {
                       return pathA.count-i+pathB.count-j-2;
                  }
            }
      }
      return -1;
}
+ (BinaryTreeNode *)invertBinaryTree:(BinaryTreeNode *)rootNode
{
     if(!rootNode)
     {
         return nil;
     }
     if(!rootNode.leftNode&&!rootNode.rightNode)
     {
          return rootNode;
     }
    BinaryTreeNode *leftNode = [self invertBinaryTree:rootNode.leftNode];
    BinaryTreeNode *rightNode = [self invertBinaryTree:rootNode.rightNode];
    rootNode.leftNode = rightNode;
    rootNode.rightNode = leftNode;
     return  rootNode;
}
+ (BOOL)isCompleteBinaryTree:(BinaryTreeNode *)rootNode
{
     if(!rootNode)
     {
          return NO;
     }
     //  左子树和右子树都为空，则是完全二叉树
     if(!rootNode.leftNode&&!rootNode.rightNode)
     {
          return YES;
     }
     //  左子树为空，右子树不为空，则不是完全二叉树
     if(!rootNode.leftNode&&rootNode.rightNode)
     {
           return NO;
     }
     NSMutableArray *queue = [NSMutableArray array];
     [queue addObject:rootNode];
     BOOL isComplete  = NO;
     while(queue.count>0)
     {
         BinaryTreeNode *node = [queue firstObject];
         [queue removeObjectAtIndex:0];
         if(!node.leftNode&&node.rightNode)
         {
               return NO;
         }
         if(isComplete&&(node.leftNode || node.rightNode))
         {
            return NO;
         }
         
         
         if(!node.rightNode)
         {
               isComplete = YES;
         }
         
         if(node.leftNode)
         {
             [queue addObject:node.leftNode];
         }
         if(node.rightNode)
         {
             [queue addObject:node.rightNode];
         }
     }
     return isComplete;
}
+ (BOOL)isFullBinaryTree:(BinaryTreeNode *)rootNode
{
        if(!rootNode)
        {
           return NO;
        }
        NSInteger depth = [self depthOfTree:rootNode];
        NSInteger leafs = [self numberOfLeafsInTree:rootNode];
        if(leafs == pow(2, (depth-1)))
        {
            return YES;
        }
        return NO;
        
}
+ (BOOL)isAVLBinaryTree:(BinaryTreeNode *)rootNode
{
    static NSInteger height;
    if(!rootNode)
    {
        height = 0;
        return YES;
    }
    if(!rootNode.leftNode&&!rootNode.rightNode)
    {
       height = 1;
       return YES;
    }
    BOOL isAVLLeft = [self isAVLBinaryTree:rootNode.leftNode];
    
    NSInteger heightLeft = height;
    BOOL isAVLRight = [self isAVLBinaryTree:rootNode.rightNode];
    NSInteger heightRight = height;
    height = MAX(heightLeft, heightRight)+1;
    if(isAVLLeft&&isAVLRight&&ABS(heightLeft-heightRight)<=1)
    {
         return YES;
    }
    return NO;
}
- (NSString *)description
{
        return [NSString stringWithFormat:@"%lu",self.value];
}
@end


