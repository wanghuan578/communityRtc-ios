

#import "ViewController.h"
#import "CallViewController.h"
#import "SignalClient.h"

@interface ViewController ()
{
    SignalClient *sigclient;
}

//@property (strong, nonatomic) UILabel* addrLabel;
//@property (strong, nonatomic) UITextField* addr;

@property (strong, nonatomic) UILabel* roomLabel;
@property (strong, nonatomic) UITextField* room;

@property (strong, nonatomic) UIButton* joinBtn;

@property (strong, nonatomic) CallViewController* call;

@end

@implementation ViewController

static NSString *const signal_server_addr = @"https://47.100.251.132";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    int base_position = 100;
    
    CGFloat width = self.view.bounds.size.width;
    
//    self.addrLabel = [[UILabel alloc] init];
//    [self.addrLabel setText:@"ADDR:"];
//    [self.addrLabel setFrame:CGRectMake(20, 100, 60, 40)];
//    [self.view addSubview:self.addrLabel];
    
//    self.addr = [[UITextField alloc] init];
//    [self.addr setText:@"https://47.100.251.132"];
//    [self.addr setFrame:CGRectMake(80, 100, width-100, 40)];
//    [self.addr setTextColor:[UIColor blackColor]];
//    [self.addr setBorderStyle:UITextBorderStyleRoundedRect];
//    [self.addr setEnabled:TRUE];
//    [self.view addSubview:self.addr];
    
    self.roomLabel = [[UILabel alloc] init];
    [self.roomLabel setText:@"ROOM:"];
    [self.roomLabel setFrame:CGRectMake(20, base_position, 60, 40)];
    [self.view addSubview:self.roomLabel];
    
    self.room = [[UITextField alloc] init];
    [self.room setText:@"1111"];
    [self.room setFrame:CGRectMake(80, base_position, width-100, 40)];
    [self.room setTextColor:[UIColor blackColor]];
    [self.room setBorderStyle:UITextBorderStyleRoundedRect];
    [self.room setEnabled:TRUE];
    [self.view addSubview:self.room];
    
    base_position += 70;
    
    self.joinBtn = [[UIButton alloc] init];
    [self.joinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.joinBtn setTintColor:[UIColor whiteColor]];
    [self.joinBtn setTitle:@"join" forState:UIControlStateNormal];
    [self.joinBtn setBackgroundColor:[UIColor grayColor]];
    [self.joinBtn setShowsTouchWhenHighlighted:YES];
    [self.joinBtn setFrame:CGRectMake(40, base_position, width-80, 40)];
    
    [self.joinBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.joinBtn];

}

/** 点击空白处回收键盘 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches   withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)btnClick:(UIButton*)sender{
    
    NSLog(@"on click!");

    //[self addLogToScreen: @"addr(%@), room(%@)", self.addr.text, self.room.text];
    
    self.call = [[CallViewController alloc] initAddr:signal_server_addr withRoom: self.room.text];
    [self.call.view setFrame:self.view.bounds];
    [self.call.view setBackgroundColor:[UIColor whiteColor]];

    [self addChildViewController:self.call];
    [self.call didMoveToParentViewController:self];
    
    [self.view addSubview:self.call.view];
    
    [[SignalClient getInstance] createConnect: signal_server_addr];
}

#pragma mark protocal EventNotify
- (void) leave {
//    [self.view removeFromSuperview];
    
}

@end
