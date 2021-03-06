//
//  MyTabBarViewController.m
//  Yddworkspace
//
//  Created by ispeak on 2017/11/1.
//  Copyright © 2017年 QH. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "ViewController.h"
#import "MainViewController.h"
#import "BaseNavigationViewController.h"

@interface MyTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation MyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initItem];
    
}

- (void)initItem
{
    ViewController *vc = [[ViewController alloc] init];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:nil selectedImage:nil];
    vc.title = @"练习";

    
    BaseNavigationViewController *navig1 = [[BaseNavigationViewController alloc] initWithRootViewController:vc];
    navig1.title = @"目录";
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    mainVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:nil selectedImage:nil];
    BaseNavigationViewController *navig2 = [[BaseNavigationViewController alloc] initWithRootViewController:mainVC];
    mainVC.title = @"首页";
    navig2.title = @"主页";

    self.viewControllers = @[navig1, navig2];
    self.selectedIndex = 1;
  self.delegate = self;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
  if (viewController) {
    if ([viewController isKindOfClass:[BaseNavigationViewController class]]) {
      [WeChatWindow shareWeChatWindow].navController = (BaseNavigationViewController *)viewController;
    } else if (viewController.navigationController) {
      [WeChatWindow shareWeChatWindow].navController = viewController.navigationController;
    } else {
      [WeChatWindow shareWeChatWindow].hidden = YES;
    }
  }
  
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
