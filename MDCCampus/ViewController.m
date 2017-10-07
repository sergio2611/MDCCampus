//
//  ViewController.m
//  MDCCampus
//
//  Created by admin on 10/6/17.
//  Copyright © 2017 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray* Images;
    NSArray* Text;
    
}
@property (weak, nonatomic) IBOutlet UILabel *lbLabel;
@property (weak, nonatomic) IBOutlet UIImageView *Image;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UIButton *btnPrev;

@property (getter=getPos,setter=setPos:) int Pos;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.lbLabel.layer.borderColor= [UIColor blackColor].CGColor;
    self.lbLabel.layer.borderWidth = 2.0;
    
    Images = [NSArray array];
    Images = @[@"hialeah.jpg",@"homestead.jpg",@"iac.jpg",@"kendall.jpg",@"medical.jpg",@"meec.jpg",@"north.jpg",@"west-campus.jpg",@"wolfson.jpg"];
    Text = [NSArray array];
    Text = @[@"Hialeah Campus 1780 W 49th Street Hialeah, Florida 33012",
              @"Homestead Campus 500 College Terrace Homestead, Florida 33030"
             ,@"InterAmerican Campus  627 SW 27th Ave. Miami, FL 33135"
             ,@"Kendall Campus  11011 SW 104 Street Miami, FL 33176-3393"
             ,@"Medical Campus  950 NW 20th St. Miami, FL 33127"
             ,@"North Campus  11380 NW 27th Ave. Miami, FL 33167-3495"
             ,@"Entrepreneurial Education Center  6300 NW Seventh Ave. Miami, FL 33150"
             ,@"West Campus  3800 NW 115th Ave. Doral, FL 33178"
             ,@"Wolfson Campus  300 NE Second Ave. Miami, FL 33132"];
    
    self.Pos = 0;
    [self.lbLabel setText:[Text objectAtIndex:self.Pos]];
    [self.btnPrev setEnabled:false];}


- (void) applicationDidFinishLaunching:(UIApplication*)application
{
    [NSThread sleepForTimeInterval:6.0];
}

- (IBAction)PrevClick:(id)sender {
    
    self.Pos--;
    [self ToogleButtons];
    int number = self.Pos;
    UIImage* im = [UIImage imageNamed:[Images objectAtIndex:number]];
    //UIImage* ime = [UIImage imageNamed:@"homestead.jpg"];
    [self.lbLabel setText:[Text objectAtIndex:number]];
    [self.Image setImage:im];
}

- (IBAction)NextClick:(id)sender {
    
    self.Pos++;
    [self ToogleButtons];
    int number = self.Pos;
    UIImage* im = [UIImage imageNamed:[Images objectAtIndex:number]];
    [self.lbLabel setText:[Text objectAtIndex:number]];
    //UIImage* ime = [UIImage imageNamed:@"homestead.jpg"];
    [self.Image setImage:im];
}

-(void) ToogleButtons{
    if(self.Pos == 0)
        [self.btnPrev setEnabled:false];
    else if (self.Pos == 8)
        [self.btnNext setEnabled:false];
    else
    {
        [self.btnPrev setEnabled:true];
        [self.btnNext setEnabled:true];
    }
}

@end
