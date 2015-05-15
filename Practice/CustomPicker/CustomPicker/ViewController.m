//
//  ViewController.m
//  CustomPicker
//
//  Created by 王文博 on 15-4-30.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;

@end

@implementation ViewController

- (void)displayAnimal:(NSString *)chosenAnimal
            withSound:(NSString *)chosenSound
        fromComponent:(NSString *)chosenComponent
{
    NSString *animalSoundString;
    animalSoundString = [NSString stringWithFormat:@"You changed %@ (%@ and the sound %@)",chosenComponent,chosenAnimal,chosenSound];
    self.outputLabel.text = animalSoundString;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ((AnimalChooserViewController *)segue.destinationViewController).delegate = self;
}

- (IBAction)showAnimalChooser:(id)sender {
    if(self.animalChooserVisible != YES)
    {
        [self performSegueWithIdentifier:@"toAnimalChooser" sender:sender];
        self.animalChooserVisible = YES;
    }
}

@end
