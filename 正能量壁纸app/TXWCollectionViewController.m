//
//  TXWCollectionViewController.m
//  正能量壁纸app
//
//  Created by Mac on 14/11/5.
//  Copyright (c) 2014年 Alvin Tang Love Xie Han Ya (in your heart). All rights reserved.
//

#import "TXWCollectionViewController.h"
#import "TXWCollectionViewCell.h"
#import "TXWContentViewController.h"

#define WIDTH 320
#define HEIGHT 568
#define INSET 5
// 宏定义各频道的数量 循环做数据
#define NUM_01 10
#define NUM_02 10
#define NUM_03 2
#define NUM_04 1
#define NUM_05 1
#define NUM_06 1
#define NUM_07 1
#define NUM_08 1
#define NUM_09 1
#define NUM_10 1
@interface TXWCollectionViewController ()
@property (nonatomic ,strong) UICollectionView *collection;
// 声明各个频道的数组
@property (nonatomic ,strong) NSMutableArray *classArray01;
@property (nonatomic ,strong) NSMutableArray *classArray02;
@property (nonatomic ,strong) NSMutableArray *classArray03;
@property (nonatomic ,strong) NSMutableArray *classArray04;
@property (nonatomic ,strong) NSMutableArray *classArray05;
@property (nonatomic ,strong) NSMutableArray *classArray06;
@property (nonatomic ,strong) NSMutableArray *classArray07;
@property (nonatomic ,strong) NSMutableArray *classArray08;
@property (nonatomic ,strong) NSMutableArray *classArray09;
@property (nonatomic ,strong) NSMutableArray *classArray10;
// 所有图片
@property (nonatomic ,strong) NSArray *allClassArray;
@end

@implementation TXWCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建UICollectionView布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    // 设置滚动视图
    //    UICollectionViewScrollDirectionVertical,
    //    UICollectionViewScrollDirectionHorizontal
    
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    // 设置cell的尺寸
    flowLayout.itemSize = CGSizeMake((WIDTH-INSET*3)/2, (WIDTH-INSET*3)/2*HEIGHT/WIDTH);
    // cell间隔高
    flowLayout.minimumLineSpacing = 5.0;
    // cell间隔宽
    flowLayout.minimumInteritemSpacing = 1.0;
    flowLayout.footerReferenceSize = CGSizeMake(100, 100);
    // 实例化
    self.collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 320, 568) collectionViewLayout:flowLayout];
    // 向系统注册
    [self.collection registerClass:[TXWCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // 设置委托
    self.collection.dataSource = self;
    self.collection.delegate = self;
    // 添加到父视图
    [self.view addSubview:self.collection];
    self.collection.backgroundColor = [UIColor whiteColor];
    
    // =====创建各频道图片资源======
    //    // 实例化对象
    //    [self.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    //        if ([obj isKindOfClass:[NSMutableArray class]]) {
    //            obj = [[NSMutableArray alloc]init];
    //        }
    //    }];
    
    [self createPicArray];
    
    _allClassArray = [[NSArray alloc]init];
    _allClassArray = @[_classArray01,_classArray02,_classArray03,_classArray04,_classArray05,_classArray06,_classArray07,_classArray08,_classArray09,_classArray10];

    // Do any additional setup after loading the view.
}

#pragma mark - 创建频道图片数据
- (void)createPicArray
{
    // 实例化对象
    _classArray01 = [NSMutableArray new];
    _classArray02 = [NSMutableArray new];
    _classArray03 = [NSMutableArray new];
    _classArray04 = [NSMutableArray new];
    _classArray05 = [NSMutableArray new];
    _classArray06 = [NSMutableArray new];
    _classArray07 = [NSMutableArray new];
    _classArray08 = [NSMutableArray new];
    _classArray09 = [NSMutableArray new];
    _classArray10 = [NSMutableArray new];
    
    for (int i = 1; i < NUM_01+1; i++)
    {
        [_classArray01 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"class01_%.2d.jpg",i]]];
    }
    for (int i = 1; i < NUM_02+1; i++)
    {
        [_classArray02 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"class02_%.2d.jpg",i]]];
    }
    for (int i = 1; i < NUM_03+1; i++)
    {
        [_classArray03 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"class03_%.2d.jpg",i]]];
    }
    for (int i = 1; i < NUM_04+1; i++)
    {
        [_classArray04 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"class04_%.2d.jpg",i]]];
    }
    for (int i = 1; i < NUM_05+1; i++)
    {
        [_classArray05 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"class05_%.2d.jpg",i]]];
    }
    for (int i = 1; i < NUM_06+1; i++)
    {
        [_classArray06 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"class06_%.2d.jpg",i]]];
    }
    for (int i = 1; i < NUM_07+1; i++)
    {
        [_classArray07 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"class07_%.2d.jpg",i]]];
    }
    for (int i = 1; i < NUM_08+1; i++)
    {
        [_classArray08 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"class08_%.2d.jpg",i]]];
    }
    for (int i = 1; i < NUM_09+1; i++)
    {
        [_classArray09 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"class09_%.2d.jpg",i]]];
    }
    for (int i = 1; i < NUM_10+1; i++)
    {
        [_classArray10 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"class10_%.2d.jpg",i]]];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [[_allClassArray objectAtIndex:self.num] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TXWCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //cell.imgView.image = [UIImage imageNamed:@"class01_02.jpg"];
    cell.imgView.image = [[_allClassArray objectAtIndex:self.num] objectAtIndex:indexPath.row];
    // 设置背景黑色
    cell.backgroundColor = [UIColor colorWithRed:((0 * indexPath.row) / 255.0) green:((0 * indexPath.row)/255.0) blue:((0 * indexPath.row)/255.0) alpha:0.8f];
    return cell;
}

#pragma mark - 设置cell边界
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 0, 5);
}

#pragma mark - 点击cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TXWContentViewController *tccv = [[TXWContentViewController alloc]init];
    tccv.image = [[_allClassArray objectAtIndex:self.num] objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:tccv animated:NO];
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
