//
//  ToDo.m
//  EveryDo
//
//  Created by Sofia Knezevic on 2017-02-21.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)initWithTitle:(NSString *)title andWithDescription:(NSString *)toDoDescription andWithPriority:(int)priorityNumber
{
    self = [super init];
    if (self) {
        
        _title = title;
        _toDoDescription = toDoDescription;
        _priorityNumber = priorityNumber;
        
        _isCompleted = NO;
        
    }
    return self;
}

@end
