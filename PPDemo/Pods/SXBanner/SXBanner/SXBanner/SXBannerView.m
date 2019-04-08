//
//  SXBanner.m
//  SXBannerViewDemo
//
//  Created by zsx on 2019/4/6.
//  Copyright © 2019年 zsx. All rights reserved.
//

#import "SXBannerView.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import "SXPageControl.h"

@interface SXBannerView()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *mainSv;
@property(nonatomic,strong)SXPageControl *pageControl;

@property(nonatomic,strong)NSMutableArray *imageArr;

@property(nonatomic,strong)NSTimer *timer;
@end

@implementation SXBannerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.orangeColor;
    }
    return self;
}
-(void)clickImgAction:(UITapGestureRecognizer *)tap {
    if (_clickBannerBlock) {
        _clickBannerBlock((int)tap.view.tag - 1);
    }
}
-(void)stopPlay {
    [_timer invalidate];
    _timer = nil;
}
-(void)startPlay {
    [self stopPlay];
    if (_playTimeInterval == 0) {
        _playTimeInterval = 3;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:_playTimeInterval target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}
-(void)timerAction {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.mainSv.contentOffset = CGPointMake(self.mainSv.contentOffset.x + self.frame.size.width, 0);
    } completion:^(BOOL finished) {
        int i = self.mainSv.contentOffset.x / self.frame.size.width;
        [self setBannerState:i];
    }];
}
-(void)setImages:(NSArray *)images {
    _images = images;
    
    NSAssert(images.count > 0, @"the count of images must be greater than 0");
    BOOL condition = [images.firstObject isKindOfClass:[UIImage class]] || [images.firstObject isKindOfClass:[NSString class]];
    NSAssert(condition, @"the element of images must be UIImage or NSString");
    
    self.imageArr = [images mutableCopy];
    [self.imageArr insertObject:images.lastObject atIndex:0];
    [self.imageArr addObject:images.firstObject];
    
    [self createBanner];
    [self initConfigs];
}
-(void)setIndex:(int)index {
    _index = index;
    NSAssert(self.images, @"please set images before index");
    NSAssert(index < self.images.count, @"index must be smaller than the count of images");
    self.mainSv.contentOffset = CGPointMake(self.frame.size.width * (index + 1), 0);
    self.pageControl.currentPage = index;
}
-(void)setPlayTimeInterval:(float)playTimeInterval {
    _playTimeInterval = playTimeInterval;
    if (_timer) {
        [self startPlay];
    }
}
-(void)setPageControlAlignment:(SXPageControlAlignment)pageControlAlignment {
    _pageControlAlignment = pageControlAlignment;
    self.pageControl.alignment = pageControlAlignment;
}
-(void)setPageControlShape:(SXPageControlShape)pageControlShape {
    _pageControlShape = pageControlShape;
    self.pageControl.shape = pageControlShape;
}
-(void)createBanner {
    for (UIImageView *img in self.mainSv.subviews) {
        [img removeFromSuperview];
    }
    for (int i = 0; i < self.imageArr.count; i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width * i, 0, self.frame.size.width, self.frame.size.height)];
        img.contentMode = UIViewContentModeScaleAspectFill;
        img.layer.masksToBounds = YES;
        if ([self.imageArr[i] isKindOfClass:[UIImage class]]) {
            img.image = self.imageArr[i];
        }else if ([self.imageArr[i] isKindOfClass:[NSString class]]) {
            NSString *url = self.imageArr[i];
            if ([url containsString:@"http"]) {
                [img sd_setImageWithURL:[NSURL URLWithString:url]];
            }else{
                img.image = [UIImage imageNamed:url];
            }
        }
        
        img.tag = i;
        [self.mainSv addSubview:img];
        
        img.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImgAction:)];
        [img addGestureRecognizer:tap];
        
    }
}

-(void)initConfigs {
    self.mainSv.contentSize = CGSizeMake(self.frame.size.width * self.imageArr.count, self.frame.size.height);
    self.pageControl.numberOfPages = self.images.count;
    self.mainSv.contentOffset = CGPointMake(self.frame.size.width, 0);
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int i = scrollView.contentOffset.x / self.frame.size.width;
    [self setBannerState:i];
}
-(void)setBannerState:(int)i {
    if (i == 0) {
        self.mainSv.contentOffset = CGPointMake(self.frame.size.width * (self.imageArr.count - 2), 0);
    }else if (i == self.imageArr.count - 1) {
        self.mainSv.contentOffset = CGPointMake(self.frame.size.width, 0);
    }
    int page = self.mainSv.contentOffset.x / self.frame.size.width - 1;
    self.pageControl.currentPage = page;
    _index = page;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    
    [self addSubview:self.mainSv];
    
    [self addSubview:self.pageControl];
}
-(UIScrollView *)mainSv {
    if (!_mainSv) {
        _mainSv = [[UIScrollView alloc] init];
        _mainSv.frame = self.bounds;
        _mainSv.showsHorizontalScrollIndicator = NO;
        _mainSv.showsVerticalScrollIndicator = NO;
        _mainSv.delegate = self;
        _mainSv.pagingEnabled = YES;
        _mainSv.bounces = NO;
    }
    return _mainSv;
}
-(SXPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[SXPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 40, self.frame.size.width, 40)];
    }
    return _pageControl;
}
@end
