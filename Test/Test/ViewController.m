//
//  ViewController.m
//  Test
//
//  Created by keloopA on 2024/3/1.
//

#import "ViewController.h"
#import <SwiftUI/SwiftUI.h>
#import "Test-Swift.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property(nonatomic,strong)Config* config;

@end

@implementation ViewController
- (IBAction)btClick:(UIButton *)sender {
    
    UIViewController* vc = [[AddCountViewVC new] makeCountVCWithStr:@"666" with:_config];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _config = [[Config alloc] init];
    _label.text = _config.name;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _label.text = _config.name;
}


@end
