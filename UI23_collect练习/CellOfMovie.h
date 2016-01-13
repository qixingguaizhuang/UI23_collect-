//
//  CellOfMovie.h
//  UI23_collect练习
//
//  Created by dllo on 16/1/13.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModelOfMovies;

@interface CellOfMovie : UICollectionViewCell
@property (nonatomic, retain) UIImageView *pic;
@property (nonatomic, retain) UILabel *tittle;
- (void)passModel:(ModelOfMovies *) model;

@end
