//
//  FanKuiViewController.m
//  YYL
//
//  Created by admin on 15/5/27.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "FanKuiViewController.h"

@interface FanKuiViewController ()

@end

@implementation FanKuiViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=false;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"反馈";
    UIBarButtonItem *rightbar=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(sendFankui)];
    self.navigationItem.rightBarButtonItem=rightbar;
    [self initTheView];
}
-(void)initTheView
{
    UITextView *textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200)];
    [textview setBackgroundColor:[UIColor lightGrayColor]];
    [textview setScrollEnabled:true];
    [textview setScrollsToTop:false];
    [self.view addSubview:textview];
    
    self.addButton=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-90, 400, 180, 180)];
    [self.addButton setBackgroundImage:[UIImage imageNamed:@"addimage.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.addButton];
    [self.addButton addTarget:self action:@selector(imagefun) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)imagefun
{
    UIImagePickerController *pick=[[UIImagePickerController alloc]init];
    //判断相册是否可用
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        pick.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        pick.allowsEditing=true;
        pick.delegate=self;
        [self presentViewController:pick animated:true completion:nil];
    }
    else
    {
        NSLog(@"相册不可用");
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"xuanze");
    NSString *type=[info objectForKey:UIImagePickerControllerMediaType];
    //判断选择的是否是图片,这个 public.image和public.movie是固定的字段.
    if ([type isEqualToString:@"public.image"])
    {
        //其实这样就已经实现了设置图片的功能
        UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
        //这一步主要是判断当是用相机拍摄的时候，保存到相册
        if (picker.sourceType==UIImagePickerControllerSourceTypeCamera) {
            UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
        }
        [self.addButton setBackgroundImage:image forState:UIControlStateNormal];
        //这里再加个写入到本地的方案
        //获取写入的文件夹
        NSString *documents=[NSHomeDirectory() stringByAppendingString:@"/Documents"];
        //也可以用下面这个,区别就是加不加/
        //NSString *documents=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        //将 image 转换为 data
        NSData *data;
        if (UIImagePNGRepresentation(image)) {
            data=UIImagePNGRepresentation(image);
        }
        else
            data=UIImageJPEGRepresentation(image, 1.0);
        NSFileManager *filemanager=[NSFileManager defaultManager];
        //避免覆盖
        static int i=0;
        i++;
        [filemanager createFileAtPath:[documents  stringByAppendingFormat:@"/%d.png",i] contents:data attributes:nil];
        
    }
    [picker dismissViewControllerAnimated:false completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"取消");
    [picker dismissViewControllerAnimated:false completion:nil];
}
-(void)sendFankui
{
    NSLog(@"完成");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
