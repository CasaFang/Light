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
    NSLog(@"nsurl %@",fileURL);
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
    CGFloat wscale = thisSize.width/[[UIScreen mainScreen] bounds].size.width;
    CGFloat hscale = thisSize.height/[[UIScreen mainScreen] bounds].size.height;
    CGFloat scale = (wscale>hscale)?wscale:hscale;
    CGSize newSize = CGSizeMake(thisSize.width/scale, thisSize.height/scale);
    return newSize;
}

-(void)Init {
    CGFloat imageHeight =[IndexCell fitSmallImage:[self getImageFromURL:_url]].size.height;
    CGFloat imageWidth =[IndexCell fitSmallImage:[self getImageFromURL:_url]].size.width;
    
    self.articleBg  = [[UIImageView alloc] initWithImage:[IndexCell fitSmallImage:[self getImageFromURL:_url]]];
    self.titleBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, imageHeight, imageWidth, 25)];
    self.titleBg.backgroundColor = [UIColor grayColor];
    
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(10, imageHeight, imageWidth,20)];
    [self.title setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:13.0]];
    [self.title setTextColor:[UIColor whiteColor]];

}

-(void) IndexShow{
    
    [self addSubview:_articleBg];
    [self addSubview:_titleBg];
    [self addSubview:_title];
}
@end
