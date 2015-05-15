//
//  ViewController.h
//  CustomPicker
//
//  Created by 王文博 on 15-4-30.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimalChooserViewController.h"

@interface ViewController : UIViewController

@property (nonatomic) Boolean animalChooserVisible;

- (void)displayAnimal:(NSString *)chosenAnimal
            withSound:(NSString *)chosenSound
        fromComponent:(NSString *)chosenComponent;

@end
