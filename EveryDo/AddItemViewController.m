//
//  AddItemViewController.m
//  EveryDo
//
//  Created by Sofia Knezevic on 2017-02-21.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextField;

@property (weak, nonatomic) IBOutlet UIButton *doneButton;


@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (IBAction)doneButtonClicked:(id)sender {
    
    ToDo *newToDoToAdd = [[ToDo alloc] initWithTitle:self.titleTextField.text
                                  andWithDescription:self.descriptionTextField.text
                                     andWithPriority:[self.priorityTextField.text intValue]];
    
    [self.addItemDelegate addNewToDo:newToDoToAdd];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
