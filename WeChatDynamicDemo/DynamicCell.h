//
//  DynamicCell.h
//  WeChatDynamicDemo
//
//  Created by lenwave_IOS02 on 16/12/29.
//  Copyright © 2016年 高砚祥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DynamicFramModel.h"


@interface PhotoView :UIView


@property (nonatomic, copy) NSArray * imageAry;



@end




@interface DynamicCell :UITableViewCell


@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) DynamicFramModel *framModel;



@property (nonatomic, copy) void (^OpenBlock) (DynamicFramModel *framModel, NSIndexPath *indexPath);









@end
