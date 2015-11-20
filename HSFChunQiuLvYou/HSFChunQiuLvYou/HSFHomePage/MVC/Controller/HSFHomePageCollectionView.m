//
//  HSFHomePageCollectionView.m
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/5.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "HSFHomePageCollectionView.h"
#import "HSFHeadScrollView.h"
#import "Abbreviation.h"
#import "HFSHomePageCollectionViewCell.h"
#import "HSFHomePageTool.h"
#import "NSFFlayCell.h"
#import "HSFCollectionViewCell.h"
#import "HSFFlayViewController.h"
#import "HSFFlayTabBarController.h"


static int HEADHEIGHT= 155;
static NSString * resuseIdentifier = @"CtCell";
@interface HSFHomePageCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@end
@implementation HSFHomePageCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if(self = [super initWithFrame:frame collectionViewLayout:layout]){
        self.dataSource = self;
        self.delegate = self;
        //必须先注册 resuseIdentifier
        UINib *nib = [UINib nibWithNibName:@"HFSHomePageCollectionViewCell" bundle:nil];
        [self registerNib:nib forCellWithReuseIdentifier:resuseIdentifier];
        
        UINib *nibf = [UINib nibWithNibName:@"NSFFlayCell" bundle:nil];
        [self registerNib:nibf forCellWithReuseIdentifier:@"Flay"];
        
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.alwaysBounceVertical = YES;
    }
    return self;
}


//几个分区
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//几个格子
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 1) {
        return 0;
    }
    return 11;
}

//每个item什么样
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HFSHomePageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:resuseIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        NSFFlayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Flay" forIndexPath:indexPath];
        cell.name.text = @"机票";
        cell.imageName.image = [UIImage imageNamed:@"air"];
        return cell;
    }
    NSArray *cellArray = [HSFHomePageTool collectionViewCellArray];
    HSFCollectionViewCell *CellObj = cellArray[indexPath.row - 1];
    
    cell.name.text = CellObj.name;
    cell.imageName.image = [UIImage imageNamed:CellObj.imageNamge];
    
    return cell;
}

//定义每个UICollectionView 的大小（返回CGSize：宽度和高度）
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return CGSizeMake(LScreenWidth/3*2 - 5, LScreenWidth/3 - 20);
    }
    return CGSizeMake(LScreenWidth/3 - 10, LScreenWidth/3 - 20);
}

//定义每个UICollectionView 的间距（返回UIEdgeInsets：上、左、下、右）
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10, 0, 0, 0);
}
//定义每个UICollectionView 纵向的间距

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 15;
}

//设置Header高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    return CGSizeMake(LScreenWidth, HEADHEIGHT);
}

//设置Header
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
    headerView.backgroundColor = [UIColor yellowColor];
    [headerView addSubview:self.headScrollView];//头部广告栏
    return headerView;
}


//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}


//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        HSFFlayTabBarController *view = [[HSFFlayTabBarController alloc]init];
        view.view.backgroundColor = [UIColor yellowColor];
        //A[self.tabBarController.tabBar removeFromSuperview];
        [self.navigationController pushViewController:view animated:YES];
    }
    
}

@end
