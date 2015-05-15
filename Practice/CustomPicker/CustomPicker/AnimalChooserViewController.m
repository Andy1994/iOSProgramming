//
//  AnimalChooserViewController.m
//  CustomPicker
//
//  Created by 王文博 on 15-4-30.
//  Copyright (c) 2015年 WangWenBo. All rights reserved.
//

#import "AnimalChooserViewController.h"
#define KComponentCount 2
#define KAnimalComponent 0
#define KSoundComponent 1

@interface AnimalChooserViewController ()

@property (strong,nonatomic) NSArray *animalNames;
@property (strong,nonatomic) NSArray *animalSounds;
@property (strong,nonatomic) NSArray *animalImages;

@end

@implementation AnimalChooserViewController

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if(component == KAnimalComponent)
    {
        UIImageView *chosenImageView = self.animalImages[row];
        UIImageView *workaroundImageView;
        workaroundImageView = [[UIImageView alloc] initWithFrame:chosenImageView.frame];
        workaroundImageView.backgroundColor = [UIColor colorWithPatternImage:chosenImageView.image];
        return workaroundImageView;
    }else{
        UILabel *soundLabel;
        soundLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 32)];
        soundLabel.backgroundColor = [UIColor clearColor];
        soundLabel.text = self.animalSounds[row];
        return soundLabel;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    ViewController *initialView = (ViewController *)self.delegate;
    if(component == KAnimalComponent)
    {
        int chosenSound = [pickerView selectedRowInComponent:KSoundComponent];
        [initialView displayAnimal:self.animalNames[row] withSound:self.animalSounds[chosenSound] fromComponent:@"the Animal"];
    }else{
        int choseAnimal = [pickerView selectedRowInComponent:KAnimalComponent];
        [initialView displayAnimal:self.animalNames[choseAnimal] withSound:self.animalSounds[row] fromComponent:@"the Sound"];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 55.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if(component == KAnimalComponent)
    {
        return 75.0;
    }else{
        return 150.0;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return KComponentCount;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == KAnimalComponent)
    {
        return [self.animalNames count];
    }else{
        return [self.animalSounds count];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    ((ViewController *)self.delegate).animalChooserVisible = NO;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    ViewController *initialView = (ViewController *)self.delegate;
    [initialView displayAnimal:self.animalNames[0] withSound:self.animalSounds[0] fromComponent:@"nothing yet..."];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.animalNames = @[@"Mouse",@"Goose",@"Cat",@"Dog",@"Snake",@"Bear",@"Pig"];
    self.animalSounds = @[@"Oink",@"Rawr",@"Ssss",@"Roof",@"Meow",@"Honk",@"Squeak"];
    self.animalImages = @[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mouse.png"]],
                          [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"goose.png"]],
                          [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cat.png"]],
                          [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dog.png"]],
                          [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"snake.png"]],
                          [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bear.png"]],
                          [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pig.png"]]];
}

@end
