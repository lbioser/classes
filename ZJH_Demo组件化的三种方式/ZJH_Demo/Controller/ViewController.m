//
//  ViewController.m
//  ZJH_Demo
//
//  Created by keloopA on 2024/2/20.
//

#import "ViewController.h"
#import "Meditor.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)jumpToDetail:(UIButton *)sender {
    
//    UIViewController* vc = [Meditor detailViewController];
//    [self.navigationController pushViewController:vc animated:YES];
    
//    [Meditor openDetailVCWithSchem:@"detail://"];
    
    Class cls = [Meditor getClassWithProtocol:@protocol(DetailViewControllerProtocol)];
    [cls showDetail];
    
}


@end
