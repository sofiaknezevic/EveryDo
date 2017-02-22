//
//  AddItemViewController.h
//  EveryDo
//
//  Created by Sofia Knezevic on 2017-02-21.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol AddItemProtocol <NSObject>

- (void)addNewToDo:(ToDo *)newToDo;

@end

@interface AddItemViewController : UIViewController

@property (nonatomic) id <AddItemProtocol> addItemDelegate;

@end
