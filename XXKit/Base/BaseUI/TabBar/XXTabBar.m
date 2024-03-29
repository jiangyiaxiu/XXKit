//
//  XXTabBar.m
//  XXKit
//
//  Created by tomxiang on 16/3/3.
//  Copyright © 2016年 tomxiang. All rights reserved.
//

#import "XXTabBar.h"
#import "foundationex/UIScreenEx.h"
#import "uikit/XXButton.h"
#import "UIViewController+SwizzleMethod.h"
#import "XXTabBarItem.h"


@implementation XXTabBar

- (void)setViewControllers:(NSArray*)viewControllers
{
    
    int itemW = SCREEN_WIDTH / [viewControllers count];
    int itemH = XXVIEW_CONTROLLER_TOOLBAR_HEIGHT;
    
    for (int i = 0; i < viewControllers.count; ++i)
    {
        UIViewController *viewController = viewControllers[i];
        
        XXTabBarItem* item = (XXTabBarItem*)viewController.tabBarItem;
        XXButton *button = [[XXButton alloc] initWithFrame:CGRectMake(i * itemW, 0, itemW, itemH)];
        
        button.tag = item.tag;
        [button setImage:[UIImage imageNamed:item.normalImageName] selectImage:[UIImage imageNamed:item.hiImageName] withTitle:item.title];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];

        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
    }
}

-(void) buttonClick:(id) sender
{
    for (UIView* subView in self.subviews) {
        if([subView isKindOfClass:[UIButton class]]){
            ((UIButton*)subView).selected = NO;
        }
    }
    
    UIButton *button = (UIButton *)sender;
    button.selected = !button.selected;
    
    if([self.delegate respondsToSelector:@selector(XXTabBar:singleClickItemAtIndex:)]){
        [self.delegate XXTabBar:self singleClickItemAtIndex:button.tag];
    }
}

@end
