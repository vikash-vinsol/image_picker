

#import "OverlayView.h"

@implementation OverlayView
@synthesize imagepicker;


- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
		// Clear the background of the overlay:
		self.opaque = NO;
		self.backgroundColor = [UIColor clearColor];
		
		// Load the image to show in the overlay:
		UIImage *overlayGraphic = [UIImage imageNamed:@"overlaygraphic.png"];
        UIImageView *overlayGraphicView = [[UIImageView alloc] initWithImage:overlayGraphic];
		overlayGraphicView.frame = CGRectMake(30, 100, 260, 200);
		
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchDown];
        [button setTitle:@"Capture Image" forState:UIControlStateNormal];
        button.frame = CGRectMake(180.0, 430.0, 120, 40.0);
        
        
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [cancelButton addTarget:self action:@selector(cancelButtonSelected:) forControlEvents:UIControlEventTouchDown];
        [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        cancelButton.frame = CGRectMake(10.0, 430.0, 60, 40.0);

        
        [self addSubview:button];
        [self addSubview:overlayGraphicView];
        [self addSubview:cancelButton];
        
    }
    return self;
}

-(void)buttonSelected:(UIButton *)button
{
        [imagepicker takePicture];
}

-(void)cancelButtonSelected:(UIButton *)button
{
    [imagepicker dismissViewControllerAnimated:YES completion:nil];

}

@end
