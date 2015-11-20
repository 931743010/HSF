//
//  HSFHeadScrollView.m
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/4.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "HSFHeadScrollView.h"
#import "Abbreviation.h"
#import "HSFHomePageTool.h"
#import "UIImageView+WebCache.h"

//#import "NSURLSessionConfiguration.h"

@interface HSFHeadScrollView()<UIScrollViewDelegate>
//滑动界面
@property (nonatomic, strong) UIScrollView *headScrollView;
//添加页数指示
@property (nonatomic, strong) UIPageControl *pageControl;
//图片数据组
@property (nonatomic, strong) NSArray *imageArray;
//定时器
@property (nonatomic, strong) NSTimer *timer;

@end
@implementation HSFHeadScrollView
#pragma mark --- 成员变量懒加载
- (NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(doSomething) userInfo:nil repeats:YES];
    }
    return _timer;
}
- (void)doSomething{
    CGPoint Scrollpoint = self.headScrollView.contentOffset;
    Scrollpoint.x = Scrollpoint.x + LScreenWidth;
    [self.headScrollView setContentOffset:Scrollpoint];
    [self scrollViewDidScroll:self.headScrollView];
}

- (NSArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [NSArray arrayWithArray:[HSFHomePageTool headImageArray]];
    }
    return _imageArray;
}

//添加页数指示懒加载
-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [UIPageControl new];
        _pageControl.numberOfPages = self.imageArray.count - 2;
        //设置位置
        _pageControl.center = CGPointMake(self.center.x, self.frame.size.height - 8);
    }
    return _pageControl;
}

//滑动界面懒加载
- (UIScrollView *)headScrollView{
    if (!_headScrollView) {
        _headScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, LScreenWidth, 155)];
        _headScrollView.delegate = self;
        _headScrollView.pagingEnabled = YES;
        _headScrollView.bounces = YES;
        _headScrollView.contentSize = CGSizeMake(self.imageArray.count*LScreenWidth, 0);
        
        for (int i = 0; i < self.imageArray.count; i++) {

            UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.imageArray[i]]];
            [imageView sd_setImageWithURL:[NSURL URLWithString:self.imageArray[i]]
                              placeholderImage:[UIImage imageNamed:@"valuables_non_info_tips"]];
            CGRect rect = CGRectMake(0, 0, LScreenWidth, 155);
            rect.origin.x = i * LScreenWidth;
            imageView.frame = rect;
            [_headScrollView addSubview:imageView];
            [_headScrollView setContentOffset:CGPointMake(LScreenWidth, 0) animated:NO];
        }
    }
    return _headScrollView;
}
#pragma mark- ---initWithFrame:
- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        self.frame = frame;
        [self addSubview:self.headScrollView];
        [self addSubview:self.pageControl];
        [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSDefaultRunLoopMode];

    }
    return self;
}
#pragma mark --- scroolViewDidScroll:
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    NSInteger count = self.imageArray.count ;
    CGPoint offSet = self.headScrollView.contentOffset;
    NSInteger index = round(offSet.x/LScreenWidth);
    
    self.pageControl.currentPage = index -1;
    
    if (index == 0) {
       [self.headScrollView setContentOffset:CGPointMake(LScreenWidth * (count - 2),0) animated:NO];
    }
    
    if (index == self.imageArray.count - 1) {
        [self.headScrollView setContentOffset:CGPointMake(LScreenWidth,0) animated:NO];
    }
}


@end
