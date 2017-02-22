//
//  ToDoTableViewCell.m
//  EveryDo
//
//  Created by Sofia Knezevic on 2017-02-21.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "ToDoTableViewCell.h"

@interface ToDoTableViewCell()

@property (nonatomic) ToDo *toDo;

@property (nonatomic) IBOutlet UILabel *labelTitle;
@property (nonatomic) IBOutlet UILabel *lineDescription;
@property (nonatomic) IBOutlet UILabel *priorityNumber;


@end

@implementation ToDoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setToDo:(ToDo *)toDo
{
    _toDo = toDo;
    
    [self configure];
}

- (void)configure {
    
    NSString *oneLine = [[self.toDo.toDoDescription componentsSeparatedByString:@" "]objectAtIndex:0];
    
    if (self.toDo.isCompleted == NO) {
        
        self.labelTitle.text = self.toDo.title;
        self.lineDescription.text = [NSString stringWithFormat:@"%@...", oneLine];
        self.priorityNumber.text = [NSString stringWithFormat:@"P: %i", self.toDo.priorityNumber];
                                      

    }else{
        
        NSMutableAttributedString *strikedThrough = [[NSMutableAttributedString alloc]initWithString:self.toDo.title];
        [strikedThrough addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0,[strikedThrough length])];
        
        self.labelTitle.attributedText = strikedThrough;

        
    }
    
    
    


    
}
@end
