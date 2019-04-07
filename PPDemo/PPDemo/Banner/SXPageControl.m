//
//  SXPageControl.m
//  SXBannerViewDemo
//
//  Created by zsx on 2019/4/6.
//  Copyright © 2019年 zsx. All rights reserved.
//

#import "SXPageControl.h"

@implementation SXPageControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        _alignment = Center;
        _shape = Dot;
        
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    
    [self updateDots];
}

-(void)updateDots{
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
        CGFloat x = 0;
        CGFloat y = 0;
        CGFloat w = 0;
        CGFloat h = 0;
        CGFloat r = 0;
        
        if (_shape == Dot) {
            w = subview.frame.size.width;
            h = subview.frame.size.height;
            r = subview.layer.cornerRadius;
            y = subview.frame.origin.y;
        }else {
            w = 20;
            h = 5;
            r = 1;
            y = (self.frame.size.height - h) / 2;
        }
        
        if (_alignment == Left) {
            x = 20 + (w + 15) * subviewIndex;
        }else if (_alignment == Right) {
            x = self.frame.size.width - (w + 15) * self.subviews.count - 5  + (w + 15) * subviewIndex;
        }else{
            x = subview.frame.origin.x;
        }
    
        [subview setFrame:CGRectMake(x, y, w, h)];
        subview.layer.cornerRadius = r;
        
    }
}
@end
