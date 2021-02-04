//
//  GroupViewController.m
//  YueWei
//
//  Created by 李群 on 2021/1/26.
//

#import "GroupViewController.h"
#import "XLChannelControl.h"

@interface GroupViewController ()

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavBar];
//    [self addSubViews];
    [self buildUI];
    [self buildData];
}

- (void)createNavBar{
    self.titleLabel.text = @"分类";
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
    self.lineLabel.hidden = YES;
    [self initWithLeftButtonWithImage:[UIImage imageNamed:@"navBarReturn"] name:@" 返回" isHorizon:NO];
    [self.leftButton addTarget:self action:@selector(leftButtonOnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self initWithRightButtonWithImage:[UIImage imageNamed:@"navigator_add"] name:@"" isHorizon:NO];
    [self.rightButton addTarget:self action:@selector(showChannelControl) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addSubViews{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 100, 100);
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.center = self.view.center;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buildUI{
    self.title = @"XLChannelControl";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showChannelControl)];
}


//初始化数据
-(void)buildData{
    if ([XLChannelControl shareControl].inUseItems.count) {return;}
    NSMutableArray *arr1 = [[NSMutableArray alloc] initWithObjects:@"要闻",@"河北",@"财经",@"娱乐",@"体育",@"社会",@"NBA",@"视频",@"汽车",@"图片",@"科技",@"军事",@"国际",@"数码",@"星座",@"电影",@"时尚",@"文化",@"游戏",@"教育",@"动漫",@"政务",@"纪录片",@"房产",@"佛学",@"股票",@"理财", nil];
    NSMutableArray *itemArr1 = [NSMutableArray new];
    for (NSString *str in arr1) {
        XLChannelModel *item = [XLChannelModel new];
        item.title = str;
        [itemArr1 addObject:item];
    }
    
    NSMutableArray *arr2 = [[NSMutableArray alloc] initWithObjects:@"有声",@"家居",@"电竞",@"美容",@"电视剧",@"搏击",@"健康",@"摄影",@"生活",@"旅游",@"韩流",@"探索",@"综艺",@"美食",@"育儿", nil];
    NSMutableArray *itemArr2 = [NSMutableArray new];
    for (NSString *str in arr2) {
        XLChannelModel *item = [XLChannelModel new];
        item.title = str;
        [itemArr2 addObject:item];
    }
    [XLChannelControl shareControl].inUseItems = itemArr1;
    [XLChannelControl shareControl].unUseItems = itemArr2;
    
}

-(void)showChannelControl{
    [[XLChannelControl shareControl] showInViewController:self completion:^(NSArray *channels) {
        NSLog(@"频道管理结束：%@",channels);
    }];
}


- (void)buttonClicked:(UIButton *)button{
    GroupViewController *groupVC = [[GroupViewController alloc]init];
    [self.navigationController pushViewController:groupVC animated:YES];
}

- (void)leftButtonOnClick{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
