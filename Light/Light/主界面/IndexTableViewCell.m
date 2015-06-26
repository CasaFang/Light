//
//  IndexTableViewCell.m
//  
//
//  Created by FLY on 15/6/17.
//
//

#import "IndexTableViewCell.h"
#define IndexTableViewCellControlSpacing 10
#define IndexTableViewCellBackgroundColor LightColor(251,251,251)
#define IndexTableViewCellCreateAtFontSize 12

@interface IndexTableViewCell (){
    UIImageView *ArticleImg;
    UILabel *title;
    UIImageView *titleBg;
}

@end

@implementation IndexTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}

#pragma mark - 初始化视图
-(void)initSubView {
    ArticleImg = [[UIImageView alloc]init];
//    ArticleImg.image = [IndexTableViewCell fitSmallImage:[self getImageFromURL:_article.picUrl]];
    [self addSubview:ArticleImg];
    
    titleBg = [[UIImageView alloc]init];
    titleBg.backgroundColor =IndexTableViewCellBackgroundColor;
    [self addSubview:titleBg];
    
    title = [[UILabel alloc]init];
    [title setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:IndexTableViewCellCreateAtFontSize]];
    [title setTextColor:[UIColor whiteColor]];
//    title.text = _article.title;
    [self addSubview:title];
    
}

- (void) setIndexArticles:(LightArticle *)article {
    //设置图片大小
    ArticleImg.image = [IndexTableViewCell fitSmallImage:[self getImageFromURL:article.picUrl]];
    CGFloat imageHeight = ArticleImg.image.size.height;
    CGFloat imageWidth = ArticleImg.image.size.width;
    ArticleImg.frame = CGRectMake(0,0,imageHeight,imageWidth);
    
    //设置title文字的内容和大小
    title.text = article.title;
    title.frame = CGRectMake(10, imageHeight, imageWidth, 20);
    
    //设置titleBg大小
    titleBg.frame = CGRectMake(0, imageHeight, imageWidth, 25);
}

#pragma mark - 重写选择事件，取消选中
-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    
}


#pragma mark - 调整视图位置


#pragma mark - 下载图像
-(UIImage *)getImageFromURL:(NSString *)fileURL{
    UIImage *result;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    return result;
}
#pragma mark - 自适应图片
+(UIImage *)fitSmallImage:(UIImage *)image {
    if(nil == image){
        return nil;
    }
    CGSize size = [self fitSize:image.size];
    UIGraphicsBeginImageContext(size);
    CGRect rect = CGRectMake(0, 60, size.width, size.height);
    [image drawInRect:rect];
    UIImage *newing = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newing;
}

+(CGSize)fitSize : (CGSize) thisSize{
    if(thisSize.width == 0 && thisSize.height == 0)
        return CGSizeMake(0, 0);
    CGFloat wscale = thisSize.width/[[UIScreen mainScreen] bounds].size.width;
    CGFloat hscale = thisSize.height/[[UIScreen mainScreen] bounds].size.height;
    CGFloat scale = (wscale>hscale)?wscale:hscale;
    CGSize newSize = CGSizeMake(thisSize.width/scale, thisSize.height/scale);
    return newSize;
}

@end
