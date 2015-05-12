//
//  imageShowViewController.m
//  
//
//  Created by 方舟 on 15/5/11.
//
//

#import "imageShowViewController.h"

@interface imageShowViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation imageShowViewController

- (void)setScrollView:(UIScrollView *)scrollView
{
    
    _scrollView = scrollView;
    _scrollView.minimumZoomScale = self.imageView.bounds.size.height/self.imageView.image.size.height;
    _scrollView.maximumZoomScale = 1;
    _scrollView.delegate = self;
    self.scrollView.contentSize = self.imageView?self.imageView.image.size:CGSizeZero;
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

-(UIImageView *)imageView
{
    if(!_imageView){
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

-(void)setImageUrl:(NSURL *)imageUrl
{
    _imageUrl = imageUrl;
    [self startDownloadingImage];
}

- (void)startDownloadingImage
{
    self.imageView.image = nil;
    if(self.imageUrl)
    {
        NSURLRequest *request = [NSURLRequest requestWithURL:self.imageUrl];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        NSURLSessionTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
            if(!error)
            {
                if([request.URL isEqual:self.imageUrl]){
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.imageView.image = image;
                    [self.imageView sizeToFit];
                    self.scrollView.contentSize = _imageView?_imageView.image.size:CGSizeZero;
//                    [self.imageView sizeToFit];
                });
                }
            }
        }];
        [task resume];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.scrollView addSubview:self.imageView];
}

@end
