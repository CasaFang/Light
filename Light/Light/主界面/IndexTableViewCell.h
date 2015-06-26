//
//  IndexTableViewCell.h
//  
//
//  Created by FLY on 15/6/17.
//
//

#import <UIKit/UIKit.h>
#import "LightArticle.h"

@interface IndexTableViewCell : UITableViewCell

#pragma mark - 文章对象
@property (nonatomic,strong) LightArticle *article;

#pragma mark - 单元格高度
@property (nonatomic,assign) CGFloat height;

#pragma mark - UIImage处理函数
-(UIImage *)getImageFromURL:(NSString *)fileURL;
+(UIImage *)fitSmallImage:(UIImage *)image;

@end
