//
//  TXWCollectionViewCell.m
//  正能量壁纸app
//
//  Created by Mac on 14/11/5.
//  Copyright (c) 2014年 Alvin Tang Love Xie Han Ya (in your heart). All rights reserved.
//

#import "TXWCollectionViewCell.h"

@implementation TXWCollectionViewCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(1, 1, frame.size.width-2, frame.size.height-2)];
        [self.contentView addSubview:self.imgView];
    }
    return self;
}
@end
