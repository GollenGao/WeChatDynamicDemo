//
//  AppStyles.h
//  YJTabBarPer
//
//  Created by apple on 15/12/22.
//  Copyright © 2015年 YJHou. All rights reserved.
//

#ifndef AppStyles_h
#define AppStyles_h

//宽高
#define KScreenWidth [UIScreen mainScreen].bounds.size.width

#define KScreenHeight [UIScreen mainScreen].bounds.size.height
/**
 *  屏幕比
 */
#define MainScreen_Scale KScreenWidth/KScreenHeight///宽:高

//字体加颜色



#define BUTTON_CORNERRADIUS 2
#define HEADIMAGE_CORNERRADIUS 5
#define BORDER_WIDTH 0.5



///名字的样式

#define NAME_STYLE_SIZE  TEXT_SIZE_16
#define NAME_STYLE_COLOR TEXT_COLOR_USER

/**
 * 文字边距
 */

#define TEXT_MARGIN 4

/**
 * 图片边距
 */
#define PHOTO_MARGIN 4


/**
 *  块与块之间的距离
 */

#define BLOCK_MARGIN 8
#define BLOCK_MARGIN_X2 16
#define BLOCK_MARGIN_X3  24
#define BLOCK_MARGIN_X4  32


/**
 *  屏幕比 设置 高度(以iphone为标准定的)
 *
 */


#define Screen_Hight_8 KScreenHeight/71
#define Screen_Hight_16 Screen_Hight_8*2
#define Screen_Hight_24 Screen_Hight_8*3
#define Screen_Hight_32 Screen_Hight_8*4
#define Screen_Hight_40 Screen_Hight_8*5
#define Screen_Hight_48 Screen_Hight_8*6
#define Screen_Hight_56 Screen_Hight_8*7
#define Screen_Hight_64 Screen_Hight_8*8





/**
 *  屏幕比 设置 宽度(以iphone 5为标准定的)
 *
 */

#define Screen_Width_8 KScreenWidth/40
#define Screen_Width_16 Screen_Width_8*2
#define Screen_Width_24 Screen_Width_8*3
#define Screen_Width_32 Screen_Width_8*4
#define Screen_Width_40 Screen_Width_8*5
#define Screen_Width_48 Screen_Width_8*6
#define Screen_Width_56 Screen_Width_8*7
#define Screen_Width_64 Screen_Width_8*8




/**
 *  块的高度
 */
#define BLOCK_Hight_5 5
#define BLOCK_Hight_6 6
#define BLOCK_Hight_9 9
#define BLOCK_Hight_10 10
#define BLOCK_Hight_15 15
#define BLOCK_Hight_16 16
#define BLOCK_Hight_20 20
#define BLOCK_Hight_24 24
#define BLOCK_Hight_30 30
#define BLOCK_Hight_32 32
#define BLOCK_Hight_36 36
#define BLOCK_Hight_38 38
#define BLOCK_Hight_40 40
#define BLOCK_Hight_50 50
#define BLOCK_Hight_44 44
#define BLOCK_Hight_48 48
#define BLOCK_Hight_56 56
#define BLOCK_Hight_60 60
#define BLOCK_Hight_64 64
#define BLOCK_Hight_70 70
#define BLOCK_Hight_80 80
#define BLOCK_Hight_100 100


/**
 *  距离边界的宽度
 */
#define BORDER_MARGIN 16
#define BORDER_MARGIN_X2 32


/**
 *  图片的尺寸
 */

#define PHOTO_SIZE_X2 32
#define PHOTO_SIZE_X3 48
#define PHOTO_SIZE_X4 64
#define PHOTO_SIZE_72 72
#define PHOTO_SIZE_80 80

#define PHOTO_SMALL_16 16
#define PHOTO_SMALL_18  18


//cell 最大图片大小
#define CellPhotoMax (PHOTO_SIZE_X3*3)
#define cellPhotoMin (PHOTO_SIZE_X3)



/**
 *  设置圆角
 */
 
#define CornerRadius_2 2
#define CornerRadius_4 4

/**
 *  邦邦侠技能cell高度
 */

#define BBX_skillCell_hight 240




/**
 *  小button的size
 */
#define Small_BT_Size CGSizeMake(75, 32)

/**
 *  首页中间6个自定义button
 */

#define First_BT_Size CGSizeMake(kscreenWidth/2, PHOTO_SIZE_X3+BLOCK_MARGIN_X2)

/**
 *   动态详情页 头像的大小
 *
 */
#define ICON_Size CGSizeMake((KScreenWidth-BLOCK_MARGIN_X2)/8-PHOTO_MARGIN, (KScreenWidth-BLOCK_MARGIN_X2)/8-PHOTO_MARGIN)


/**
 *   活动页,
 */


#define Active_Cell_Hight (KScreenWidth/2- Screen_Width_8*4)



#endif /* AppStyles_h */
