//
//  main.m
//  MergeSort
//
//  Created by wzzyinqiang on 16/5/3.
//  Copyright © 2016年 wzzyinqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

void merge(NSMutableArray * the_array, NSInteger p, NSInteger q ,NSInteger r) {
//    NSInteger n1 = q - p + 1;
//    
//    NSInteger n2 = r - q;
//    
    NSMutableArray * left_array = [NSMutableArray array];
    
    NSMutableArray * right_array = [NSMutableArray array];
    
    for (NSInteger i = p; i <= q; i++) {
        [left_array addObject:the_array[i]];
    }
    
    for (NSInteger j = q + 1; j <= r; j++) {
        [right_array addObject:the_array[j]];
    }
    
    NSInteger i = 0;
    
    NSInteger j = 0;
    
    for (NSInteger k = p; k <= r; k++) {
        if (i >= left_array.count) {
            the_array[k] = right_array[j];
            
            j++;
            
            continue;
        }
        
        if (j >= right_array.count) {
            the_array[k] = left_array[i];
            
            i++;
            
            continue;
        }
        
        if ([left_array[i] integerValue] < [right_array[j] integerValue]) {
            the_array[k] = left_array[i];
            
            i++;
        }
        else {
            the_array[k] = right_array[j];
            
            j++;
        }
    }
}

void merge_sort(NSMutableArray * the_array, NSInteger p ,NSInteger r) {
    if (p < r) {
        NSInteger q = (p + r) / 2;
        
        merge_sort(the_array, p, q);
        
        merge_sort(the_array, q + 1, r);
        
        merge(the_array, p, q, r);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSInteger number = 5000;
        
        NSMutableArray * the_array = [NSMutableArray array];
        
        for (NSInteger i = 0; i < number; i++) {
            [the_array addObject:[NSNumber numberWithInteger:number - i]];
        }
        
        
        NSDate * start_date = [NSDate date];
        
        
        merge_sort(the_array, 0, the_array.count - 1);
        
        
        NSDate * end_date = [NSDate date];
        
        NSLog(@"%f",[end_date timeIntervalSinceDate:start_date]);
        
//        for (NSNumber * number in the_array) {
//            NSLog(@"%li",(long)[number integerValue]);
//        }
    }
    return 0;
}
