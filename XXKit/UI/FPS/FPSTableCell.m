//
//  FPSTableCell.m
//  XXKit
//
//  Created by tomxiang on 16/2/27.
//  Copyright © 2016年 tomxiang. All rights reserved.
//

#import "FPSTableCell.h"

@interface FPSTableCell()
@property(nonatomic,strong) UILabel  *dataTitleLabel;
@property(nonatomic,strong) UILabel  *dataDetailLabel;
@end

@implementation FPSTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        UIFont *fontTitle = [UIFont systemFontOfSize:16.f];
        _dataTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _dataTitleLabel.backgroundColor = [UIColor clearColor];
        _dataTitleLabel.highlightedTextColor = [UIColor whiteColor];
        _dataTitleLabel.font = fontTitle;
        [self.contentView addSubview:_dataTitleLabel];
        
        UIFont *fontDetail = [UIFont systemFontOfSize:12.f];
        _dataDetailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _dataDetailLabel.backgroundColor = [UIColor clearColor];
        _dataDetailLabel.highlightedTextColor = [UIColor whiteColor];
        _dataDetailLabel.font = fontDetail;
        
        [self.contentView addSubview:_dataDetailLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize labelSizeTitle = [self string:_dataTitleLabel.text safeSizeWithFont:_dataTitleLabel.font];
    _dataTitleLabel.frame = CGRectMake(10, 0, labelSizeTitle.width, XXTableCellHeight);
    
    CGSize labelSizeDetail = [self string:_dataDetailLabel.text safeSizeWithFont:_dataDetailLabel.font];
    _dataDetailLabel.frame = CGRectMake(_dataTitleLabel.frame.origin.x + _dataTitleLabel.frame.size.width + 10, 0, labelSizeDetail.width, XXTableCellHeight);
}


- (void)configureForData:(NSInteger) row
{
    _dataTitleLabel.text = [NSString stringWithFormat:@"%ld的标题",row];
    _dataDetailLabel.text = [NSString stringWithFormat:@"%ld的内容",row];
    
    [self setNeedsLayout];
}

- (CGSize)string:(NSString*)str safeSizeWithFont:(UIFont*)font
{
    if (str == nil || [str length] <= 0 || font == nil) {
        return CGSizeZero;
    }
    return [str boundingRectWithSize:CGSizeMake(NSIntegerMax, NSIntegerMax)
                             options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                          attributes:@{NSFontAttributeName:font}
                             context:nil].size;
}


@end
