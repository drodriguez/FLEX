//
//  FLEXMapTableExplorerViewController.m
//  PebbleApp
//
//  Created by Daniel Rodriguez Troitino on 10/22/14.
//  Copyright (c) 2014 Pebble Technology. All rights reserved.
//

#import "FLEXMapTableExplorerViewController.h"
#import "FLEXRuntimeUtility.h"
#import "FLEXObjectExplorerFactory.h"

@interface FLEXMapTableExplorerViewController ()

@property (nonatomic, readonly) NSMapTable *mapTable;

@end

@implementation FLEXMapTableExplorerViewController

- (NSMapTable *)mapTable
{
  return [self.object isKindOfClass:[NSMapTable class]] ? self.object : nil;
}


#pragma mark - Superclass Overrides

- (NSString *)customSectionTitle
{
  return @"Map Table Objects";
}

- (NSArray *)customSectionRowCookies
{
  return [[self.mapTable keyEnumerator] allObjects];
}

- (NSString *)customSectionTitleForRowCookie:(id)rowCookie
{
  return [FLEXRuntimeUtility descriptionForIvarOrPropertyValue:rowCookie];
}

- (NSString *)customSectionSubtitleForRowCookie:(id)rowCookie
{
  return [FLEXRuntimeUtility descriptionForIvarOrPropertyValue:[self.mapTable objectForKey:rowCookie]];
}

- (BOOL)customSectionCanDrillIntoRowWithCookie:(id)rowCookie
{
  return YES;
}

- (UIViewController *)customSectionDrillInViewControllerForRowCookie:(id)rowCookie
{
  return [FLEXObjectExplorerFactory explorerViewControllerForObject:[self.mapTable objectForKey:rowCookie]];
}

- (BOOL)shouldShowDescription
{
  return NO;
}

@end
