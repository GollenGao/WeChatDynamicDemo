//
//  DynamicCell.m
//  WeChatDynamicDemo
//
//  Created by lenwave_IOS02 on 16/12/29.
//  Copyright © 2016年 高砚祥. All rights reserved.
//

#import "DynamicCell.h"
#import "MWPhotoBrowser.h"


@interface PhotoView ()<MWPhotoBrowserDelegate>


@end

@implementation PhotoView



- (void)setImageAry:(NSArray *)imageAry
{
   _imageAry = imageAry;
    while (self.subviews.count) {
        UIView *view = self.subviews.lastObject;
        [view removeFromSuperview];
    }
    
    if (imageAry.count==1) {
        UIImage *image = [UIImage imageNamed:imageAry.firstObject];

        UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        button.tag = 0;
        [button addTarget:self action:@selector(imageClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [button setImage:image forState:(UIControlStateNormal)];
        CGFloat imageMax = MAX(image.size.width, image.size.height);
        CGFloat imageMin = MIN(image.size.width, image.size.height);
        CGFloat blockMax =  MIN(imageMax/2, CellPhotoMax);
        CGFloat blockMin;
        if (imageMax == image.size.width) {
            blockMin = MAX(cellPhotoMin, blockMax/imageMax*image.size.height);
            button.frame = CGRectMake(0, 0, blockMax, blockMin);
        }else{
            blockMin = MAX(cellPhotoMin, blockMax/imageMax*image.size.width);
            button.frame = CGRectMake(0, 0, blockMin,blockMax);
        }
        button.imageView.transform = CGAffineTransformMakeScale(blockMin/imageMin, blockMin/imageMin);

    button.imageView.contentMode = UIViewContentModeCenter;
       [self addSubview:button];
        return;
    }
    
    for (int i = 0; i< imageAry.count; i++) {
        UIImage *image = [UIImage imageNamed:imageAry[i]];
        CGFloat imageMin = MIN(image.size.width, image.size.height);
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        button.tag = i;
        [button addTarget:self action:@selector(imageClick:) forControlEvents:(UIControlEventTouchUpInside)];
        CGFloat  block2 = PHOTO_SIZE_80+TEXT_MARGIN, block3 = PHOTO_SIZE_80*2+TEXT_MARGIN*2;
        [button setImage:[UIImage imageNamed:imageAry[i]] forState:(UIControlStateNormal)];
        switch (i) {
            case 0:
                button.frame = CGRectMake(0, 0, PHOTO_SIZE_80, PHOTO_SIZE_80);
                break;
            case 1:
                button.frame = CGRectMake(block2, 0, PHOTO_SIZE_80, PHOTO_SIZE_80);
                break;
            case 2:
                button.frame = CGRectMake(0, block2, PHOTO_SIZE_80, PHOTO_SIZE_80);
                break;
            case 3:
                button.frame = CGRectMake(block2, block2, PHOTO_SIZE_80, PHOTO_SIZE_80);
                break;
            case 4:
                button.frame = CGRectMake(block3, 0, PHOTO_SIZE_80, PHOTO_SIZE_80);
                break;
            case 5:
                button.frame = CGRectMake(block3, block2, PHOTO_SIZE_80, PHOTO_SIZE_80);
                break;
            case 6:
                button.frame = CGRectMake(0, block3, PHOTO_SIZE_80, PHOTO_SIZE_80);
                break;
            case 7:
                button.frame = CGRectMake(block2, block3, PHOTO_SIZE_80, PHOTO_SIZE_80);
                break;
            case 8:
                button.frame = CGRectMake(block3, block3, PHOTO_SIZE_80, PHOTO_SIZE_80);
                break;
            default:
                break;
        }

        button.imageView.transform = CGAffineTransformMakeScale(PHOTO_SIZE_80/imageMin, PHOTO_SIZE_80/imageMin);
        button.imageView.contentMode = UIViewContentModeCenter;
        [self addSubview:button];
    }
  
}

- (void)imageClick:(UIButton *)sender
{
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    

    //底部滑动的小箭头 default NO
    //        [browser setDisplayNavArrows:YES];
    //图片放大展示 default YES
    browser.zoomPhotosToFill = false;
    //分享按钮 default YES
    //    browser. displayActionButton = false;
    //右上角选择按钮
    browser.displaySelectionButtons = true;
    //    browser.alwaysShowControls = true;
    [browser setCurrentPhotoIndex:sender.tag];
    //必须加navigation
    UINavigationController *browserNAV = [[UINavigationController alloc] initWithRootViewController:browser];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:browserNAV animated:YES completion:nil];
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.imageAry.count;
}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    return [MWPhoto photoWithImage:[UIImage imageNamed:self.imageAry[index]]];
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index
{
    return [MWPhoto photoWithImage:[UIImage imageNamed:self.imageAry[index]]];
}


@end




@interface DynamicCell ()


@property (nonatomic, strong) UIImageView *headIcon;
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *contentLB;
@property (nonatomic, strong)  PhotoView * iconView;
@property (nonatomic, strong) UIButton *openBT;



@end

@implementation DynamicCell






- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self   = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.headIcon = [[UIImageView alloc] init];
        
        self.titleLB = [[UILabel alloc] init];
        self.titleLB.font  = [UIFont systemFontOfSize:14];

        
        self.contentLB = [[UILabel alloc] init];
        self.contentLB.numberOfLines = 3;
        self.contentLB.font  = [UIFont systemFontOfSize:14];

        
        
        self.iconView  = [[PhotoView alloc] init];
        
        self.openBT = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.openBT.titleLabel.font = [UIFont systemFontOfSize:12];
    

        [self.openBT addTarget:self action:@selector(openBTAction) forControlEvents:(UIControlEventTouchUpInside)];
        
        
        [self.contentView addSubview:self.headIcon];
        [self.contentView addSubview:self.titleLB];
        [self.contentView addSubview:self.contentLB];
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.openBT];
        
    }
    return self;
    
}


- (void)setFramModel:(DynamicFramModel *)framModel
{
    _framModel = framModel;
    DynamicModel *model = framModel.model;
    
    
    self.headIcon.image = [UIImage imageNamed:model.headIcon];
    self.titleLB.text = model.titleStr;
    self.contentLB.text = model.content;
    
    self.iconView.imageAry = model.imageAry;
    
    
    //fram
    self.headIcon.frame =framModel.headerFram;
    self.headIcon.layer.cornerRadius =framModel.headerFram.size.width/2;
    self.headIcon.clipsToBounds = YES;

    self.titleLB.frame = framModel.titleFram;
    
    self.contentLB.frame = framModel.contentFram;

    self.iconView.frame = framModel.imageViewFrame;
    
    if (framModel.show) {
        self.contentLB.numberOfLines = 0;
        self.openBT.hidden = NO;
        self.openBT.frame = framModel.showBTFram;
    }else{
        self.openBT.hidden = YES;
        self.contentLB.numberOfLines = 3;
    }
    [self.openBT setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    if (framModel.open) {
        [self.openBT setTitle:@"收起" forState:UIControlStateNormal];
    }else{
        [self.openBT setTitle:@"全文" forState:UIControlStateNormal];
    }
   
    
}


#pragma  mark --- show all text
- (void)openBTAction
{
    if (self.OpenBlock) {
        self.OpenBlock(self.framModel,self.indexPath);
    }
}









- (void)layoutSubviews
{
    [super layoutSubviews];
    

    
    
}
























@end
