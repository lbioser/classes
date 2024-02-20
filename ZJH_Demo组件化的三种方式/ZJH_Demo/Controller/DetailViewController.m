//
//  DetailViewController.m
//  ZJH_Demo
//
//  Created by keloopA on 2024/2/20.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property(nonatomic,strong)UIColor* color;
@end

@implementation DetailViewController
//- (instancetype)initWithParms:(NSDictionary*)dict{
//    self = [super init];
//    if(self){
//        self.color = dict[@"color"];
//    }
//    return self;
//}
//+ (void)load{
//    [Meditor registerSchme:@"detail://" WithHandler:^{
//        DetailViewController* vc = [self new];
//        [((UINavigationController*)UIApplication.sharedApplication.keyWindow.rootViewController) pushViewController:vc animated:YES];
//    }];
//}
+ (void)showDetail{
    DetailViewController* vc = [self new];
    [((UINavigationController*)UIApplication.sharedApplication.keyWindow.rootViewController) pushViewController:vc animated:YES];
}
+ (void)load{
    [Meditor registerProtocol:@protocol(DetailViewControllerProtocol) andClass:self.class];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.grayColor;
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
