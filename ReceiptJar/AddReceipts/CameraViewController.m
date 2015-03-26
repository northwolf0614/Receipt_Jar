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
#import "CoreDataEntityHeaders.h"
#import "CoreDataHelper.h"

@interface CameraViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, G8TesseractDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *activityIndicatorWapper;
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
    
    self.activityIndicatorWapper.layer.cornerRadius = 10.0;
    self.activityIndicatorWapper.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"dealloc %@.", NSStringFromClass([self class]));
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    if (!self.activityIndicator.isAnimating) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    if (self.activityIndicator.isAnimating) {
        return;
    }
    
    UIImage* image = [info[UIImagePickerControllerOriginalImage] fixRotation];
    
    if (image) {
        [self.view bringSubviewToFront:self.activityIndicatorWapper];
        self.activityIndicatorWapper.hidden = NO;
        [self.activityIndicator startAnimating];
        
        [[TesseractRecognizer sharedRecognizerWithDelegateHolder:self] recognizeImageWithTesseract:image onCompletion:^(NSDictionary *recognizedData) {
            [TesseractRecognizer clearCache];
            
            CDDocument* document = [CDDocument insertInManagedObjectContext:[[CoreDataHelper sharedInstance] moc]];
            document.file = UIImageJPEGRepresentation(image, 1.0);
            
            CDReceipt* receipt = [CDReceipt insertInManagedObjectContext:[[CoreDataHelper sharedInstance] moc]];
            [receipt addDocumentsObject:document];
            receipt.rawData = recognizedData;
            
            CDExpense* expense = [CDExpense insertInManagedObjectContext:[[CoreDataHelper sharedInstance] moc]];
            [expense addReceiptsObject:receipt];
            expense.date = [NSDate date];
            
            [receipt setupRawData];
            
            
            [[CoreDataHelper sharedInstance] saveContext];
            
            [self.activityIndicator stopAnimating];
            self.activityIndicatorWapper.hidden = YES;
            
            ExpenseDetailViewController* detailVC = [[ExpenseDetailViewController alloc] init];
            detailVC.expense = expense;
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
