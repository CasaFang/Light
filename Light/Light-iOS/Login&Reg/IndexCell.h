//
//  IndexCell.h
//  
//
//  Created by FLY on 15/6/11.
//
//

#import <UIKit/UIKit.h>

@interface IndexCell : UITableViewCell

//文章标题
@property (nonatomic,retain) UILabel *title;
@property (nonatomic,retain) UIImageView *titleBg;
//内容图片
@property (nonatomic,retain) UIImageView *articleBg;

@property (nonatomic,retain) NSString *url;

- (UIImage *)getImageFromURL:(NSString *)fileURL;
+ (UIImage *)fitSmallImage:(UIImage *)image;

- (void) Init;
- (void) IndexShow ;

@end
