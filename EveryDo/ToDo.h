//
//  ToDo.h
//  EveryDo
//
//  Created by Sofia Knezevic on 2017-02-21.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *toDoDescription;
@property (nonatomic, assign) int priorityNumber;
@property (nonatomic, assign) BOOL isCompleted;

- (instancetype)initWithTitle:(NSString *)title andWithDescription:(NSString *)toDoDescription andWithPriority:(int)priorityNumber;

@end
