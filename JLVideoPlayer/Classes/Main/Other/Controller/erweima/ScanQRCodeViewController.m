//
//  ScanQRCodeViewController.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/11/14.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "ScanQRCodeViewController.h"

@interface ScanQRCodeViewController ()

@end

@implementation ScanQRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"读取本地" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(locationClickAction) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 100, kScreenWidth, 100);
    //    btn.backgroundColor = RandomColor;
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"扫描二维码" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(creatScanQRCorn) forControlEvents:UIControlEventTouchUpInside];
    btn1.frame = CGRectMake(0, 200, kScreenWidth, 100);
    //    btn.backgroundColor = RandomColor;
    [self.view addSubview:btn1];
    
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - 读取本地相册
- (void)locationClickAction{
    
    // 1.判断相册是否可以打开
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        return;
    }
    
    // 2. 创建图片选择控制器
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    /**
     typedef NS_ENUM(NSInteger, UIImagePickerControllerSourceType) {
     UIImagePickerControllerSourceTypePhotoLibrary, // 相册
     UIImagePickerControllerSourceTypeCamera, // 用相机拍摄获取
     UIImagePickerControllerSourceTypeSavedPhotosAlbum // 相簿
     }
     */
    // 3. 设置打开照片相册类型(显示所有相簿)
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    // ipc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    // 照相机
    // ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    // 4.设置代理
    ipc.delegate = self;
    //是否允许编辑
    ipc.allowsEditing = YES;
    ipc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

    // 5.modal出这个控制器
    [self presentViewController:ipc animated:YES completion:nil];
    
}

#pragma mark -- <UIImagePickerControllerDelegate>--
// 获取图片后的操作
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    // 销毁控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
//    // 设置图片
//    self.imageView.image = info[UIImagePickerControllerOriginalImage];
}

#pragma mark - 扫描
- (void)creatScanQRCorn{

    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];

    
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        //授权
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"没有相机权限" message:@"请去设置-隐私-相机中对爱儿邦授权" preferredStyle:UIAlertControllerStyleAlert];
        //创建按钮
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        }];
        //将按钮放到UIAlertController
        [alertController addAction:cancelAction];
        //跳转
        [self presentViewController:alertController animated:YES completion:nil];
        
        return;
    }
    
    UIImageView *scanView = [[UIImageView alloc]initWithFrame:CGRectMake(345, 152, 333, 333)];
    [self.view addSubview:scanView];

    
    UIImageView *scanViewBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [scanViewBg setImage:[UIImage imageNamed:@"扫一扫bg.png"]];
    [self.view addSubview:scanViewBg];

    UILabel * labIntroudction= [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2-150, 500, 300, 30)];
    labIntroudction.backgroundColor = [UIColor clearColor];
    labIntroudction.textColor=[UIColor blackColor];
    labIntroudction.textAlignment = NSTextAlignmentCenter;
    labIntroudction.text=@"将取景框对准二维码，即自动扫描";
    [self.view addSubview:labIntroudction];
    
    [self setupCamera];
}


- (void)setupCamera{
 
    //使用AVMediaTypeVideo 指明self.device代表视频，默认使用后置摄像头进行初始化
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    //使用设备初始化输入
    self.input = [[AVCaptureDeviceInput alloc] initWithDevice:self.device error:nil];
    
    //生成输出对象
    self.output = [[AVCaptureMetadataOutput alloc] init];
    
    //设置代理，一旦扫描到指定类型的数据，就会通过代理输出
    //在扫描的过程中，会分析扫描的内容，分析成功后就会调用代理方法在队列中输出
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //生成回话
    self.session = [[AVCaptureSession alloc] init];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];

    if ([self.session canAddInput:self.input]) {
        [self.session addInput:self.input];
    }
    if ([self.session canAddOutput:self.output]) {
        [self.session addOutput:self.output];
    }
    
    //指定当扫描到二维码的时候，产生输出
    //AVMetadataObjectTypeQRCode 指定二维码
    //指定识别类型一定要放到添加到session之后
    [self.output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode,  //条形码
                                          AVMetadataObjectTypeEAN13Code,
                                          AVMetadataObjectTypeEAN8Code,
                                          AVMetadataObjectTypeCode128Code]];
    
    //设置扫描信息的识别区域，左上角为(0,0),右下角为(1,1),不设的话全屏都可以识别。设置过之后可以缩小信息扫描面积加快识别速度。
    //这个属性并不好设置，整了半天也没太搞明白，到底x,y,width,height,怎么是对应的，这是我一点一点试的扫描区域，看不到只能调一下，扫一扫试试
    [self.output setRectOfInterest:CGRectMake(0.1 ,0.3 , 0.4, 0.4)];
    
    //使用self.session，初始化预览层，self.session负责驱动input进行信息的采集，layer负责把图像渲染显示
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:self.session];
    self.previewLayer.frame = CGRectMake(345, 152, 333, 333);
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:self.previewLayer];
    
    //开始启动
    [self.session startRunning];
    
}

#pragma mark - 扫码的输出
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{

    //停止扫描
    [self.session stopRunning];
    
    if ([metadataObjects count] > 0) {
        //数组中包含的都是AVMetadataMachineReadableCodeObject 类型的对象，该对象中包含解码后的数据
        AVMetadataMachineReadableCodeObject *qrObject = [metadataObjects lastObject];
        //拿到扫描内容在这里进行个性化处理
        NSString *strValue = qrObject.stringValue;
        NSLog(@"识别成功%@",strValue);
     }
}












@end
