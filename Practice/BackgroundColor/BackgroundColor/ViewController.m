//
//  ViewController.m
//  BackgroundColor
//
//  Created by 王文博 on 15-5-1.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
@property (weak, nonatomic) IBOutlet UISlider *hueSlider;
@end

@implementation ViewController

- (IBAction)setBackgroundHueValue:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:self.toggleSwitch.on forKey:@"onOff"];
    [userDefaults setFloat:self.hueSlider.value forKey:@"hue"];
    [userDefaults synchronize];
    if(self.toggleSwitch.on)
    {
        self.view.backgroundColor = [UIColor colorWithHue:self.hueSlider.value
                                               saturation:0.75
                                               brightness:0.75
                                                    alpha:1.0];
    }else{
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.hueSlider.value = [userDefaults floatForKey:@"hue"];
    self.toggleSwitch.on = [userDefaults boolForKey:@"onOff"];
    if(self.toggleSwitch.on)
    {
        self.view.backgroundColor = [UIColor colorWithHue:self.hueSlider.value
                                               saturation:0.75
                                               brightness:0.75
                                                    alpha:1.0];
    }else{
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

@end
