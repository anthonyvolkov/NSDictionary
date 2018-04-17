//
//  ViewController.m
//  CodeJam_01_NSDictionary
//
//  Created by anthony volkov on 4/16/18.
//  Copyright © 2018 anthony volkov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @autoreleasepool {
    
#pragma mark - 1. Create NSDictionary using literal declaration.
        NSDictionary *dictionary = @{
                                     @"name": @"bob",
                                     @"lastName": @"brown",
                                     @"age": @"23",
                                     };
        
        //    NSLog(@"%@", dictionary);
        
        
        
        
#pragma mark - 2. Make it mutable and add several new entries.
        NSMutableDictionary *mutableDictionary = [[dictionary mutableCopy] autorelease];
        NSLog(@"is mutableDictionary kind of class NSMutableDictionary? - %@",
              [mutableDictionary isKindOfClass:[NSMutableDictionary class]] ? @"yes" : @"no");
        [mutableDictionary setObject:@"atlanta" forKey:@"city"];
        [mutableDictionary setObject:@"gender" forKey:@"male"];
        NSLog(@"%@", mutableDictionary);
        //    for (id key in mutableDictionary) {
        //        NSLog(@"key - %@, item - %@", key, [mutableDictionary valueForKey:key]);
        //    }
        
        
        
        
#pragma mark - 3. Sort it in an ascending and descending order.
        
        //ascending
        //by keys
        NSArray *allKeysMutableDictionary = [mutableDictionary allKeys];
        NSArray *ascendingKeys = [allKeysMutableDictionary sortedArrayUsingSelector:@selector(compare:)];
        for (NSString *key in ascendingKeys) {
            NSLog(@"%@ - %@", key, [mutableDictionary valueForKey:key]);
        }
        NSLog(@"-----------------------");
        
        //by values
        NSArray *ascendingKeysByValue = [mutableDictionary keysSortedByValueUsingSelector:@selector(compare:)];
        for (NSString *key in ascendingKeysByValue) {
            NSLog(@"%@ - %@", [mutableDictionary valueForKey:key], key);
        }
        NSLog(@"-----------------------");
        
        
        //descending
        //by keys
        NSArray *descendingKeys = [allKeysMutableDictionary sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [obj2 compare:obj1];
        }];
        for (NSString *key in descendingKeys) {
            NSLog(@"%@ - %@", key, [mutableDictionary valueForKey:key]);
        }
        NSLog(@"-----------------------");
        
        //by values
        NSArray *descendingKeysByValue = [mutableDictionary keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [obj2 compare:obj1];
        }];
        for (NSString *key in descendingKeysByValue) {
            NSLog(@"%@ - %@", [mutableDictionary valueForKey:key], key);
        }
        
        
        
#pragma mark - 4. Check whether required value is contained in the dictionary.
        NSString *checkingValue = @"boby";
        NSArray *allValuesMutableDictionary = [mutableDictionary allValues];
        if ([allValuesMutableDictionary containsObject:checkingValue]) {
            NSLog(@"mutableDictionary is contain value - %@", checkingValue);
        }else{
            NSLog(@"mutableDictionary isn't contain value - %@", checkingValue);
        }

     
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
