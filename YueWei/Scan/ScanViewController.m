//
//  ScanViewController.m
//  YueWei
//
//  Created by 李群 on 2021/1/26.
//

#import "ScanViewController.h"
#import "GroupViewController.h"
#import "PhotoViewController.h"
#import "CommUtils.h"
#import "ConstantUI.h"
#import <Masonry/Masonry.h>
#import "ScanViewModel.h"

@interface ScanViewController ()
@property (nonatomic,assign) BOOL isCanSideBack;/**< 是否可以侧滑 */

@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.titleLabel.text = @"浏览";
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
    self.lineLabel.hidden = YES;
    
    [self addSubViews];
}

- (void)addSubViews{
    UIScrollView *bottomView = [UIScrollView new];
    bottomView.backgroundColor = [CommUtils changeToColorWithHexAndRgbString:@"#f7f7f7"];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_offset(132);
    }];
    
    CGFloat edge = 16;
    CGFloat width = 100;
    CGFloat height = 100;
    NSArray *btnArray = @[@{@"title": @"生成",@"type":@(0)}, @{@"title": @"编辑", @"type":@(1)}, @{@"title": @"名称", @"type":@(2)},@{@"title": @"名称", @"type":@(3)},@{@"title": @"名称", @"type":@(4)},@{@"title": @"名称", @"type":@(5)},@{@"title": @"名称", @"type":@(6)},@{@"title": @"名称", @"type":@(7)},@{@"title": @"名称", @"type":@(8)},@{@"title": @"名称", @"type":@(9)}];
    for (int i = 0; i < btnArray.count; i++) {
        NSDictionary *dic = btnArray[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = i;
        [button setTitle:dic[@"title"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button.layer setBackgroundColor:[CommUtils changeToColorWithHexAndRgbString:kMainColorStr].CGColor];
        [bottomView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(edge + (edge + width) * i);
            if (i == btnArray.count - 1) {
                make.right.mas_offset(-edge);
            }
            make.centerY.mas_equalTo(bottomView);
            make.size.mas_offset(CGSizeMake(width, height));
        }];
    //    button1.center = self.view.center;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = width/2.0;
        button.layer.borderWidth = 5;
        button.layer.borderColor = [UIColor whiteColor].CGColor;
    }
//
//    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [button1 setTitle:@"生成" forState:UIControlStateNormal];
//    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [button1.layer setBackgroundColor:[CommUtils changeToColorWithHexAndRgbString:kMainColorStr].CGColor];
//    [bottomView addSubview:button1];
//    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_offset(edge);
//        make.top.mas_offset(edge);
//        make.size.mas_offset(CGSizeMake(width, height));
//    }];
////    button1.center = self.view.center;
//    [button1 addTarget:self action:@selector(button1Clicked:) forControlEvents:UIControlEventTouchUpInside];
//    button1.layer.masksToBounds = YES;
//    button1.layer.cornerRadius = width/2.0;
//    button1.layer.borderWidth = 5;
//    button1.layer.borderColor = [UIColor whiteColor].CGColor;
//
//    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
//    [button2 setTitle:@"编辑" forState:UIControlStateNormal];
//    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [button2.layer setBackgroundColor:[CommUtils changeToColorWithHexAndRgbString:kMainColorStr].CGColor];
//    [bottomView addSubview:button2];
//    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_offset(edge * 2 + width);
//        make.top.mas_offset(edge);
//        make.size.mas_offset(CGSizeMake(width, height));
//    }];
////    button2.center = self.view.center;
//    [button2 addTarget:self action:@selector(button2Clicked:) forControlEvents:UIControlEventTouchUpInside];
//    button2.layer.masksToBounds = YES;
//    button2.layer.cornerRadius = width/2.0;
//    button2.layer.borderWidth = 5;
//    button2.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)button1Clicked:(UIButton *)button{
    PhotoViewController *photoVC = [[PhotoViewController alloc]init];
    photoVC.hidesBottomBarWhenPushed = YES;
//    photoVC.isFromEditor = YES;
    [self.navigationController pushViewController:photoVC animated:YES];
    
//    GroupViewController *groupVC = [[GroupViewController alloc]init];
//    groupVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:groupVC animated:YES];
}

- (void)buttonClicked:(UIButton *)button{
    switch (button.tag) {
        case ImageActionTypeCreate:
        {
            PhotoViewController *photoVC = [[PhotoViewController alloc]init];
            photoVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:photoVC animated:YES];
        }
            break;
        case ImageActionTypeEdit:
        {
            PhotoViewController *photoVC = [[PhotoViewController alloc]init];
            photoVC.hidesBottomBarWhenPushed = YES;
            photoVC.isFromEditor = YES;
            photoVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:photoVC animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}

- (void)button2Clicked:(UIButton *)button{
    PhotoViewController *photoVC = [[PhotoViewController alloc]init];
    photoVC.hidesBottomBarWhenPushed = YES;
    photoVC.isFromEditor = YES;
    photoVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:photoVC animated:YES completion:nil];
}


//#pragma mark - 解决滑动返回卡死问题
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    if (self.navigationController.viewControllers.firstObject != self) {
//        [self disableSideBack];
//    }
//}
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    if (self.navigationController.viewControllers.firstObject != self) {
//        [self enableSideBack];
//    }
//}
///*!
// @abstract 禁用侧滑返回
// */
//- (void)disableSideBack{
//    self.isCanSideBack = NO;
//    // 关闭 侧滑返回
//    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
//    }
//}
///*!
// @abstract 启用 侧滑返回
// */
//- (void)enableSideBack{
//    self.isCanSideBack = YES;
//    // 开启 侧滑返回
//    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
//    }
//}
//#pragma mark - UIGestureRecognizerDelegate
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer {
//    return self.isCanSideBack;
//}

@end
