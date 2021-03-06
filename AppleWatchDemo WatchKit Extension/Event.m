//
//  Event.m
//  AppleWatchDemo
//
//  Created by Brexton Pham on 7/6/15.
//  Copyright (c) 2015 Brexton Pham. All rights reserved.
//

#import "Event.h"

@implementation Event

@synthesize eventImageName;
@synthesize eventTime;
@synthesize eventTitle;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        eventTitle = dictionary[@"eventTitle"];
        eventTime = dictionary[@"eventTime"];
        eventImageName = dictionary[@"eventImageName"];
    }
    return self;
}

+ (NSArray *)eventsList {
    NSMutableArray *array = [NSMutableArray array];
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"event" ofType:@"plist"];
    NSArray *data = [NSArray arrayWithContentsOfFile:dataPath];
    
    for (NSDictionary *e in data) {
        Event *event = [[Event alloc] initWithDictionary:e];
        [array addObject:event];
    }
    return array;
}

@end
