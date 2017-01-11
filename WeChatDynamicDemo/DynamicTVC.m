//
//  DynamicTVC.m
//  WeChatDynamicDemo
//
//  Created by lenwave_IOS02 on 16/12/29.
//  Copyright © 2016年 高砚祥. All rights reserved.
//

#import "DynamicTVC.h"
#import "DynamicFramModel.h"
#import "DynamicCell.h"


@interface DynamicTVC ()

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation DynamicTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [NSMutableArray array];
    
    [self getModel];
}


- (void)getModel{
    
    NSArray *iconImageNamesArray = @[@"icon0.jpg",
                                     @"icon1.jpg",
                                     @"icon2.jpg",
                                     @"icon3.jpg",
                                     @"icon4.jpg",
                                     ];
    
    NSArray *namesArray = @[@"GSD_iOS",
                            @"风口上的猪",
                            @"当今世界网名都不好起了",
                            @"我叫郭德纲",
                            @"Hello Kitty"];
    
    NSArray *textArray = @[@"当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，https://github.com/gsdios/SDAutoLayout大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，https://github.com/gsdios/SDAutoLayout等于把小屏完全拉伸。",
                           @"当你的 app 没有提供 3x 的 LaunchImage 时屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。屏幕宽度返回 320；https://github.com/gsdios/SDAutoLayout然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。",
                           @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"屏幕宽度返回 320；https://github.com/gsdios/SDAutoLayout然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。"
                           ];
    

    NSArray *picImageNamesArray = @[ @"pic0.jpg",
                                     @"pic1.jpg",
                                     @"pic2.jpg",
                                     @"pic0.jpg",
                                     @"pic4.jpg",
                                     @"pic5.jpg",
                                     @"pic6.jpg",
                                     @"pic7.jpg",
                                     @"pic8.jpg"
                                     ];
    
    for (int i = 1; i<50; i++) {
        DynamicModel *dynamic = [[DynamicModel alloc] init];
        dynamic.headIcon = iconImageNamesArray[arc4random_uniform(4)];
        dynamic.titleStr = namesArray[arc4random_uniform(4)];
        dynamic.content = textArray[arc4random_uniform(4)];
        
        NSMutableArray *temp = [NSMutableArray new];
        for (int i = 0; i < arc4random_uniform(8)+1; i++) {
            int randomIndex = arc4random_uniform(9);
            [temp addObject:picImageNamesArray[randomIndex]];
        }
        dynamic.imageAry  = temp;
        [self.dataSource addObject:[DynamicFramModel getDynamicFramModel:dynamic]];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSource.count;
}






- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell_id";//不能一样, 否则重加载
    DynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[DynamicCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.OpenBlock = ^(DynamicFramModel *framModel, NSIndexPath *index){
        DynamicFramModel *model;
        if (framModel.open) {
            model = [DynamicFramModel getDynamicFramModel:framModel.model];
        }else{
            model = [DynamicFramModel getOpenDynamicFramModel:framModel.model];
        }
        [self.dataSource replaceObjectAtIndex:indexPath.row withObject:model];
        [tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:(UITableViewRowAnimationNone)];
    };
    
    cell.indexPath = indexPath;
    cell.framModel = self.dataSource[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  ((DynamicFramModel *)self.dataSource[indexPath.row]).cellHeight;
}




@end
