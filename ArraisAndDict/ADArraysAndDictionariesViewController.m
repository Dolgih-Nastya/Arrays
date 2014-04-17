//
//  ADArraysAndDictionariesViewController.m
//  ArraisAndDict
//
//  Created by Анастасия Долгих on 4/17/14.
//  Copyright (c) 2014 Anastasia. All rights reserved.
//

#import "ADArraysAndDictionariesViewController.h"

@interface ADArraysAndDictionariesViewController ()
@property(nonatomic, strong) NSArray *arr;
@property(nonatomic, strong) NSArray *writ;
@property(nonatomic, strong) NSDictionary *dict;
@property(nonatomic, strong) NSDictionary *writDict;
@property(nonatomic, strong) NSString *arrayFile;
@property(nonatomic, strong) NSString *dictFile;
@end

@implementation ADArraysAndDictionariesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.arr = @[@"a", @"b", @"c", @"d", @"e"];
    self.dict = @{@"key1": @"value1", @"key2":@"value2", @"key3":@"value3", @"key_i": @"value_i", @"key_n":@"value_n"};
    self.arrayFile=@"array.txt";
    self.dictFile = @"dict.txt";
}

- (IBAction)ReadFromFileToArrayButtonClick:(UIButton *)sender
{
    self.writ = @[];
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *file = [path stringByAppendingPathComponent:self.arrayFile];
    self.writ = [self.writ initWithContentsOfFile:file];
    [[[UIAlertView alloc] initWithTitle:@"Info" message:[self.writ componentsJoinedByString:@"\t"]
                               delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

- (IBAction)ReadFromFileToDictionaryButtonClick:(UIButton *)sender
{
    self.writDict = @{};
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *file = [path stringByAppendingPathComponent:self.dictFile];
    self.writDict = [self.writDict initWithContentsOfFile:file];
    [[[UIAlertView alloc] initWithTitle:@"Info" message:[NSString stringWithFormat:@"Your dictionary is %@", self.writDict]
                               delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    
}

- (IBAction)WriteToFileFromArrayButtonClick:(UIButton *)sender
{
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *file = [path stringByAppendingPathComponent:self.arrayFile];
    BOOL isFileWritingSuccessful = [self.arr writeToFile:file atomically:NO];
    
    if (isFileWritingSuccessful){
        [[[UIAlertView alloc] initWithTitle:@"Info" message:@"File was successfully written"
                                   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    else{
        [[[UIAlertView alloc] initWithTitle:@"Info" message:@"Unfortunately, file writing finished with error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
}
- (IBAction)WriteToFileFromDictionaryButtonClick:(UIButton *)sender
{
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *file = [path stringByAppendingPathComponent:self.dictFile];
    BOOL isFileWritingSuccessful = [self.dict writeToFile:file atomically:NO];
    
    if (isFileWritingSuccessful){
        [[[UIAlertView alloc] initWithTitle:@"Info" message:@"File was successfully written"
                                   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    else{
        [[[UIAlertView alloc] initWithTitle:@"Info" message:@"Unfortunately, file writing finished with error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
