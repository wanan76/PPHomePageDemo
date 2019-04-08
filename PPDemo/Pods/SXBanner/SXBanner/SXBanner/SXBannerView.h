//
//  SXBanner.h
//  SXBannerViewDemo
//
//  Created by zsx on 2019/4/6.
//  Copyright © 2019年 zsx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SXBannerEnum.h"
NS_ASSUME_NONNULL_BEGIN

@interface SXBannerView : UIView
/**
 设置banner图片数组
 元素可以是:
 UIImage
 NSString，包含http为网络图片，不包含，为本地图片名称
 */
@property(nonatomic,copy) NSArray * __nonnull images;

/**
 点击回调
 */
@property(nonatomic,copy) void(^__nullable clickBannerBlock)(int index);

/**
 设置显示第几张
 */
@property(nonatomic,assign) int index;

/**
 自动播放间隔时间
 */
@property(nonatomic,assign) float playTimeInterval;

/**
 pageControl对齐方式
 */
@property(nonatomic,assign)SXPageControlAlignment pageControlAlignment;

/**
 pageControl对齐方式
 */
@property(nonatomic,assign)SXPageControlShape pageControlShape;

/**
 开启播放
 */
-(void)startPlay;

/**
 关闭播放
 如果有开启自动播放，页面退出后，必须调用stopPlay，才能关闭定时器
 */
-(void)stopPlay;
@end

NS_ASSUME_NONNULL_END
