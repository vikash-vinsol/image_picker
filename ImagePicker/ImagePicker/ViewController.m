//
//  ViewController.m
//  ImagePicker
//
//  Created by Vikash Soni on 10/07/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "ViewController.h"
#import "OverlayView.h"
#import <MediaPlayer/MediaPlayer.h>


@interface ViewController ()

@end

@implementation ViewController
@synthesize imageSelected,picker;
#define SCREEN_WIDTH  320
#define SCREEN_HEIGTH 480


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)camera:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Select Image" delegate:(id<UIActionSheetDelegate>)self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Image From Camera",@"Image From Library",nil];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showInView:self.view];
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex

{
    picker =[[UIImagePickerController alloc]init];
    if (buttonIndex == 1)
    {
        //picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.mediaTypes = [UIImagePickerController  availableMediaTypesForSourceType:picker.sourceType];
        picker.allowsEditing = YES;
       
        [self presentViewController:picker animated:YES completion:Nil];
    }
    
  else if (buttonIndex == 0)
  {
        OverlayView *overlay = [[OverlayView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGTH)];
      //  picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera ;
        picker.allowsEditing = YES;
        picker.showsCameraControls = NO;
        picker.cameraOverlayView = overlay;
        picker.delegate = self;
        overlay.imagepicker=picker;
        [self presentViewController:picker animated:YES completion:Nil];
  }
    self.imageSelected.contentMode = UIViewContentModeScaleAspectFit;

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *) Picker
{
        [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if([[info objectForKey:@"UIImagePickerControllerMediaType"] isEqual:@"public.movie"])
    {
        MPMoviePlayerController *player = [[MPMoviePlayerController alloc]initWithContentURL:[info objectForKey:UIImagePickerControllerMediaURL]];
        UIImage *thumbnail = [player thumbnailImageAtTime:0.0 timeOption:MPMovieTimeOptionExact];
        imageSelected.image = thumbnail;
        [player stop];
    }
        
    else
    {
        imageSelected.image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
    }
     
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
