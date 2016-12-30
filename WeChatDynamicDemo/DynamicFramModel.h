//
//  DynamicFramModel.h
//  WeChatDynamicDemo
//
//  Created by lenwave_IOS02 on 16/12/29.
//  Copyright © 2016年 高砚祥. All rights reserved.
//









#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppStyles.h"


@interface DynamicModel:NSObject

@property (nonatomic, copy) NSString *headIcon;
@property (nonatomic, copy) NSString *titleStr;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSArray *imageAry;


@end








@interface DynamicFramModel : NSObject


@property (nonatomic, readonly) BOOL open;


/**
 *    (づ￣3￣)づ╭❤～   : 闭合时候的model
 *
 */
+ (DynamicFramModel *)getDynamicFramModel:(DynamicModel *)dynamic;



/**
 *    (づ￣3￣)づ╭❤～ : 打开时候的model
 */
+ (DynamicFramModel *)getOpenDynamicFramModel:(DynamicModel *)dynamic;


@property (nonatomic, assign) CGRect  headerFram;
@property (nonatomic, assign) CGRect  titleFram;
@property (nonatomic, assign) CGRect  contentFram;
@property (nonatomic, assign) CGRect  contentShowFram;

@property (nonatomic, assign) CGRect  imageViewFrame;
@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, assign) CGRect showBTFram;
/*是否包涵展开按钮*/
@property (nonatomic) BOOL show;


@property (nonatomic, readonly) DynamicModel *model;

















@end











