//
//  ViewController.m
//  UI23_collect练习
//
//  Created by dllo on 16/1/13.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "CellOfMovie.h"
#import "ModelOfMovies.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, retain)UICollectionView *collection;
@property (nonatomic, retain)UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, retain)NSMutableArray *arrayOfModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self handleData];
    [self createSegment];
    [self createCollectionView];

}

- (void)handleData{
    
    self.arrayOfModel = [[NSMutableArray alloc]init];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"douban_yingyuan" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *arry = [result objectForKey:@"subjects"];

    for (NSDictionary * dic in arry) {
        
        ModelOfMovies *modelOfM = [[ModelOfMovies alloc]init];
        
        [modelOfM setValuesForKeysWithDictionary:dic];
        
        NSDictionary *dicPic = [dic objectForKey:@"pic"];
        [modelOfM setValuesForKeysWithDictionary:dicPic];
        
        [self.arrayOfModel addObject:modelOfM];

    }
    
}



- (void)createCollectionView{
    
    [self createFlowlayout];

    /** 搜索 */
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];

    
    self.collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 115, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:self.flowLayout];
    
    self.collection.showsVerticalScrollIndicator = NO;
    self.collection.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collection];
    
    self.collection.dataSource = self;
    self.collection.delegate = self;
    
    [self.collection registerClass:[CellOfMovie class] forCellWithReuseIdentifier:@"pool"];
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"poolForHeader"];
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"poolForFooter"];

}

- (void)createFlowlayout{
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    self.flowLayout.minimumLineSpacing = 60;
    self.flowLayout.minimumInteritemSpacing = 10;
    
    self.flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    self.flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 80) / 3, (self.view.frame.size.width - 80) / 3 *1.5);
    
    self.flowLayout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 0);
    self.flowLayout.footerReferenceSize = CGSizeMake(self.view.frame.size.width, 200);
    
    
}

//创建 segment

- (void)createSegment{

    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"上映",@"影院",@"我看",@"热门",@"活动"]];
   
    seg.frame = CGRectMake(0, 64, self.view.frame.size.width, 50);
    
    //选择后不滞留
    seg.momentary = YES;
    seg.tintColor = [UIColor blackColor];
    
    [seg addTarget:self action:@selector(chouseActionOfSegment:) forControlEvents:UIControlEventTouchUpInside];

    seg.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:seg];
    
}

- (void)chouseActionOfSegment:(UISegmentedControl *)seg{

    NSLog(@"选择成功");
}


#pragma mark -- dataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 18;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CellOfMovie *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pool" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
    
    ModelOfMovies *model = [self.arrayOfModel objectAtIndex:indexPath.item];
    [cell passModel:model];
    
    return cell;

}

#pragma mark -- 区头区尾系统重用池类

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{


    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"poolForHeader" forIndexPath:indexPath];
        
        header.backgroundColor = [UIColor yellowColor];
        
        return header;
        
    }else {
    
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"poolForFooter" forIndexPath:indexPath];
        footer.backgroundColor = [UIColor clearColor];
        
        return footer;

    }

}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
