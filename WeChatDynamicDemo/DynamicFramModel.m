//
//  DynamicFramModel.m
//  WeChatDynamicDemo
//
//  Created by lenwave_IOS02 on 16/12/29.
//  Copyright © 2016年 高砚祥. All rights reserved.
//

#import "DynamicFramModel.h"

@implementation DynamicModel



@end



@interface DynamicFramModel ()

@property (nonatomic) BOOL open;

@property (nonatomic, strong) DynamicModel *model;

@end
@implementation DynamicFramModel





+ (DynamicFramModel *)getDynamicFramModel:(DynamicModel *)dynamic{
    DynamicFramModel *framModel = [[DynamicFramModel alloc] init];
    framModel.model = dynamic;
    framModel.open = NO;
    [framModel resetDynamicFrame:dynamic];
    return framModel;
}
+ (DynamicFramModel *)getOpenDynamicFramModel:(DynamicModel *)dynamic{
    DynamicFramModel *framModel = [[DynamicFramModel alloc] init];
    framModel.model = dynamic;
    framModel.open = YES;
    [framModel resetDynamicFrame:dynamic];
    return framModel;
}






- (void)resetDynamicFrame:(DynamicModel *)dynamicModel
{
    
    
    
    UIFont *font = [UIFont systemFontOfSize:14];

    //headicon
    self.headerFram = CGRectMake(BLOCK_MARGIN, BLOCK_MARGIN, PHOTO_SIZE_X3, PHOTO_SIZE_X3);
    
    CGFloat left = CGRectGetMaxX(self.headerFram)+BLOCK_MARGIN;
    CGFloat width = KScreenWidth-left-BLOCK_MARGIN*2;
    
    //
    self.titleFram = CGRectMake(left, BLOCK_MARGIN_X2, width, font.lineHeight);
    
    self.cellHeight = CGRectGetMidY(self.headerFram) + BLOCK_MARGIN;
    
    //content
    /**
     *    (づ￣3￣)づ╭❤～ : content 文字自适应
     */

    CGSize contentSize = [dynamicModel.content boundingRectWithSize:CGSizeMake(width, 0) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:font} context:nil].size;
    
    
    if (self.open) {
        self.contentFram = (CGRect){left, self.cellHeight, contentSize};
    }else{
        self.contentFram = (CGRect){left, self.cellHeight, contentSize.width,font.lineHeight*3};
     }
    self.cellHeight = CGRectGetMaxY(self.contentFram)+BLOCK_MARGIN;
    if (contentSize.height > font.lineHeight*3) {
        self.show = YES;
        self.showBTFram =  CGRectMake(left,self.cellHeight-TEXT_MARGIN, BLOCK_Hight_40, BLOCK_MARGIN_X2);
        self.cellHeight = CGRectGetMaxY(self.showBTFram)+TEXT_MARGIN;
    }else{
        self.show = NO;
    }
    
    //imageView
    /**
     *    (づ￣3￣)づ╭❤～ : 
     *     1.控制三张图片时候 放在同排 dynamicModel.imageAry.count>2 搞成 3 就可以
     *     2.当图片只有一张的时候, 一般后台会把图片的大小或者比例直接返回过来, (此处用了imageSize的一般) 
     *     3. 为了展示长图方便, 加了个最大尺寸 PHOTO_SIZE_80*3
     */
    
    
    CGFloat photoH;
    if (dynamicModel.imageAry.count == 1) {
        UIImage *image = [UIImage imageNamed:dynamicModel.imageAry.firstObject];
        CGFloat imageMax = MAX(image.size.width, image.size.height);
       
        CGFloat blockH =  MIN(imageMax/2, CellPhotoMax);
        
        if (imageMax == image.size.width) {
            photoH = blockH/imageMax*image.size.height;
        }else{
            photoH =  blockH;
        }
    }else if (dynamicModel.imageAry.count>6){
        photoH =  PHOTO_SIZE_80*3+TEXT_MARGIN*2;
    }else if (dynamicModel.imageAry.count>2){
        photoH =  PHOTO_SIZE_80*2+TEXT_MARGIN*1;
    }else{
        photoH =  PHOTO_SIZE_80;
    }
    
    self.imageViewFrame = CGRectMake(left, self.cellHeight, width, photoH);
    
    self.cellHeight = CGRectGetMaxY(self.imageViewFrame)+BLOCK_Hight_24;
}



















@end






