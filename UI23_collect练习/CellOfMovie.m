//
//  CellOfMovie.m
//  UI23_collect练习
//
//  Created by dllo on 16/1/13.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CellOfMovie.h"
#import "ModelOfMovies.h"
#import "UIImageView+WebCache.h"

@implementation CellOfMovie


- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self createSubview];
    }
    return self;
}


- (void)createSubview{

    self.pic = [[UIImageView alloc]init];
    self.tittle =[[UILabel alloc] init];
    self.tittle.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview: self.pic];
    [self.contentView addSubview:self.tittle];

}

- (void)passModel:(ModelOfMovies *) model{

    //self.pic.image = [UIImage imageNamed:model.normal];
    self.tittle.text = model.title;
   [self.pic sd_setImageWithURL:[NSURL URLWithString:model.normal]];

}




- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{

    self.pic.frame = self.contentView.frame;
    self.tittle.frame = CGRectMake(0, self.contentView.frame.size.height +10, self.contentView.frame.size.width, 20);

}









@end
