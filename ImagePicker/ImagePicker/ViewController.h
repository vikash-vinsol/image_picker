//
//  ViewController.h
//  ImagePicker
//
//  Created by Vikash Soni on 10/07/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>


@class GKImagePicker;

@interface ViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImagePickerController *picker;
    IBOutlet UIImageView *imageSelected;

}
@property (nonatomic,strong)UIImageView *imageSelected;
@property(nonatomic,strong) UIImagePickerController *picker;


-(IBAction)camera:(id)sender;


@end
