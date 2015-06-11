//
//  IndexCell.m
//  
//
//  Created by FLY on 15/6/11.
//
//

#import "IndexCell.h"
#import "IndexViewController.h"

@implementation IndexCell

-(UIImage *)getImageFromURL:(NSString *)fileURL{
    NSLog(@"下载图片");
    UIImage * result;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    return result;
}

+(UIImage *)fitSmallImage:(UIImage *)image {
    if(nil == image){
        return nil;
    }
    CGSize size = [self fitSize:image.size];
    UIGraphicsBeginImageContext(size);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    [image drawInRect:rect];
    UIImage *newing = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newing;
}

+(CGSize)fitSize : (CGSize) thisSize{
    if(thisSize.width == 0 && thisSize.height == 0)
        return CGSizeMake(0, 0);
    CGFloat wscale = thisSize.width/[UIScreen mainScreen].bounds.origin.x;
    CGFloat hscale = thisSize.height/[UIScreen mainScreen].bounds.origin.y;
    CGFloat scale = (wscale>hscale)?wscale:hscale;
    CGSize newSize = CGSizeMake(thisSize.width/scale, thisSize.height/scale);
    return newSize;
}

-(void) IndexShow{
    CGFloat imageHeight =[IndexCell fitSmallImage:[self getImageFromURL:self.url]].size.height;
    _articleBg  = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, [UIScreen mainScreen].bounds.origin.x, imageHeight)];
    _title = [[UILabel alloc]initWithFrame:CGRectMake(5, imageHeight, [UIScreen mainScreen].bounds.origin.x, 20)];
    _title.backgroundColor = [UIColor whiteColor];
    
    [_articleBg setImage:[self getImageFromURL:self.url]];
    NSLog(@"设置背景");
    
    [self addSubview:_articleBg];
    [self addSubview:_title];
    
}

@end
