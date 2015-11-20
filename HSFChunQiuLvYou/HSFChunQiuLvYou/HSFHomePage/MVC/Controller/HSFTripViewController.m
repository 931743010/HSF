//
//  HSFTripViewController.m
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HSFTripViewController.h"
#import "Abbreviation.h"
#import "UIColor+MyColor.h"

#import "HSFCollectionViewCell.h"
#import "HSFHomePageTool.h"

#import "HSFTripCollectionViewCell.h"


@interface HSFTripViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UICollectionView *collectionView;

@end
static int HEADHIGHT = 64;

static int TLABLEX = 153;
static int TLABLEY = 31;
static int TLABLEWEIGHT = 68;
static int TLABLEHEIGHT = 21;

static NSString *resuseIdentifier = @"CtCell";

@implementation HSFTripViewController

#pragma mark- ---initWithFrame
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
        self.collectionView.delegate = self;
        self.collectionView.dataSource =self;
        
        UINib *nib = [UINib nibWithNibName:@"HSFTripCollectionViewCell" bundle:nil];
        [self.collectionView registerNib:nib forCellWithReuseIdentifier:resuseIdentifier];
        
        [self addSubview:self.titleView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.collectionView];
    }
    return self;
}

#pragma mark- ---懒加载titleView/titleLabel
- (UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, LScreenWidth, HEADHIGHT)];
        _titleView.backgroundColor = [UIColor getColor:@"006400"];
    }
    return _titleView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(TLABLEX, TLABLEY, TLABLEWEIGHT, TLABLEHEIGHT)];
        _titleLabel.text = @"行程服务";
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}


#pragma mark- ---懒加载collectionView
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayou = [UICollectionViewFlowLayout new];
        [flowLayou setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, HEADHIGHT, LScreenWidth, LScreenHeight - HEADHIGHT - 49) collectionViewLayout:flowLayou];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:resuseIdentifier];
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _collectionView;
}


#pragma mark- ---懒加载UICollectionViewDelegate
//几个分区
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//几个格子
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 5) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:resuseIdentifier forIndexPath:indexPath];
        return cell;
    }
    HSFTripCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:resuseIdentifier forIndexPath:indexPath];
    NSArray *cellArray = [HSFHomePageTool TripCellArray];
    HSFCollectionViewCell *CellObj = cellArray[indexPath.row];
    
    cell.name.text = CellObj.name;
    cell.imageName.image = [UIImage imageNamed:CellObj.imageNamge];
    
    return cell;
}


//定义每个UICollectionView 的大小（返回CGSize：宽度和高度）
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(LScreenWidth/3 - 1, LScreenWidth/3 - 1);
}

//定义每个UICollectionView 的间距（返回UIEdgeInsets：上、左、下、右）
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//定义每个UICollectionView 纵向的间距

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0.5;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
    
}


@end
