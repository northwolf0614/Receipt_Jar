//
//  CameraViewController.m
//  ReceiptJar
//
//  Created by Lei Zhao on 24/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import "CameraViewController.h"
#import "ExpenseDetailViewController.h"
#import "TesseractRecognizer.h"

@interface CameraViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, G8TesseractDelegate>

@end

@implementation CameraViewController{
    UIImagePickerController* _imagePicker;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
    NSLog(@"%@ did load.", NSStringFromClass([self class]));
    // Do any additional setup after loading the view from its nib.
    
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.delegate = self;
    _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self.view addSubview:_imagePicker.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"dealloc %@.", NSStringFromClass([self class]));
}

- (IBAction)dismiss:(id)sender {
    NSLog(@"Dismiss %@", NSStringFromClass([self class]));
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage* image = info[UIImagePickerControllerOriginalImage];
    
    if (image) {
        
        [[TesseractRecognizer sharedRecognizerWithDelegateHolder:self] recognizeImageWithTesseract:image onCompletion:^(NSDictionary *recognizedData) {
            [recognizedData objectForKey:@"Numbers"];
            [TesseractRecognizer clearCache];
            
            
            ExpenseDetailViewController* detailVC = [[ExpenseDetailViewController alloc] init];
            NSMutableArray* viewControllers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
            [viewControllers insertObject:detailVC atIndex:[viewControllers indexOfObject:self]];
            [self.navigationController setViewControllers:viewControllers animated:NO];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }];
        
        
    }
}

#pragma mark - G8TesseractDelegate
- (void)progressImageRecognitionForTesseract:(G8Tesseract *)tesseract{
    
}
- (BOOL)shouldCancelImageRecognitionForTesseract:(G8Tesseract *)tesseract{
    return NO;
}
@end
