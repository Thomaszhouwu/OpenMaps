//
//  ViewController.m
//  MapDemo
//
//  Created by Thomas on 15/11/12.
//  Copyright © 2015年 Thomas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"iOS开发群:126538996";
}

#pragma UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex!=0)// 取消
    {
        double latitude =45.748737;
        double longitude =126.699791;
        
        switch (buttonIndex) {
            case 1:// 打开系统自带的地图
            {
                NSString *string = @"http://maps.apple.com/maps?saddr=39.98,116.31&daddr=41.59,117.40";
                [[UIApplication sharedApplication]  openURL:[NSURL URLWithString:string]];
            }
                break;
            case 2:// 打开腾讯地图
            {
                NSString *stringURL = [NSString stringWithFormat:@"qqmap://map/routeplan?type=drive&&fromcoord=36.547901,104.258354&tocoord=%f,%f&policy=1" ,latitude,longitude];
                NSURL *mapUrl = [NSURL URLWithString:[stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
                
                if ([[UIApplication sharedApplication] canOpenURL:mapUrl])
                {
                    
                    [[UIApplication sharedApplication] openURL:mapUrl];
                }
                else
                {
                    NSLog(@"没安装腾讯地图");
                }
                
            }
                break;
            case 3:// 打开百度地图
            {
                NSString *stringURL = [NSString stringWithFormat:@"baidumap://map/geocoder?location=%f,%f&coord_type=gcj02&src=" ,latitude,longitude];
                NSURL *mapUrl = [NSURL URLWithString:[stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
                
                if ([[UIApplication sharedApplication] canOpenURL:mapUrl])
                {
                    
                    [[UIApplication sharedApplication] openURL:mapUrl];
                }
                else
                {
                    NSLog(@"没安装百度地图");
                }
            }
                break;
        }
    }
}

- (IBAction)selectClicked:(id)sender {
    UIActionSheet *mapSelectorSheet = [[UIActionSheet alloc] initWithTitle:@"选择地图" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:nil];
    NSArray *deviceNames = [NSArray arrayWithObjects:@"打开系统自带的地图",@"打开腾讯地图",@"打开百度地图", nil];
    for (NSString *name in deviceNames) {
        [mapSelectorSheet addButtonWithTitle:name];
    }
    [mapSelectorSheet showInView:self.view];
}



@end
