//
//  MasterViewController.m
//  EveryDo
//
//  Created by Sofia Knezevic on 2017-02-21.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDoTableViewCell.h"
#import "ToDo.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@property ToDo *toDo;


@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.objects = [[NSMutableArray alloc] init];
    
    UISwipeGestureRecognizer *swipedRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedToDo:)];
    [self.tableView addGestureRecognizer:swipedRight];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    //hard-coded testing!
//    ToDo *number1 = [[ToDo alloc] initWithTitle:@"clean room"
//                             andWithDescription:@"vaccuum and wash windows"
//                                andWithPriority:8];
//    
//    ToDo *number2 = [[ToDo alloc] initWithTitle:@"clean bathroom"
//                             andWithDescription:@"sweep and take out garbage"
//                                andWithPriority:9];
//    
//    ToDo *number3 = [[ToDo alloc] initWithTitle:@"do homework"
//                             andWithDescription:@"review the day's material and catch up on overdue things"
//                                andWithPriority:4];
//    
//
//    
//    [self.objects addObject:number1];
//    [self.objects addObject:number2];
//    [self.objects addObject:number3];
    
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (ToDoTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    self.toDo = self.objects[indexPath.row];
    [cell setToDo:self.toDo];
    
    return cell;
    
}

- (void)insertNewObject:(id)sender {
    
    [self performSegueWithIdentifier:@"addItem" sender:nil];
    
    
}



#pragma mark - Segues -

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        self.toDo = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:self.toDo];
        
    }else if([[segue identifier] isEqualToString:@"addItem"]){
        
        AddItemViewController *addController = (AddItemViewController *)[segue destinationViewController];
        addController.addItemDelegate = self;
    }
}

#pragma mark - Adding new ToDos -

- (void)addNewToDo:(ToDo *)newToDo
{
    
    [self.objects addObject:newToDo];
    
    [self.objects removeObject: newToDo];
    [self.objects insertObject:newToDo atIndex:0];
    [self.tableView reloadData];
    
    
}

#pragma mark - Deleting & Completing -

- (IBAction)swipedToDo:(UISwipeGestureRecognizer *)sender {
    
    CGPoint currPoint = [sender locationInView:self.tableView];
    NSIndexPath *index = [self.tableView indexPathForRowAtPoint:currPoint];
    NSIndexPath *lastOne = [NSIndexPath indexPathForRow:[self.objects count]-1 inSection:0];
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
    
        ToDo *doneToDo = self.objects[index.row];
        
        if(doneToDo.isCompleted == NO){
            
            doneToDo.isCompleted = YES;
        }
        
        [self tableView:self.tableView moveRowAtIndexPath:index toIndexPath:lastOne];
 
        [self.tableView reloadData];
    }
    
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        

    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)beginningIndexPath toIndexPath:(NSIndexPath *)lastIndex {
    
    if (beginningIndexPath != lastIndex) {
        
        ToDo *todoObject = [self.objects objectAtIndex:beginningIndexPath.row];
        [self.objects removeObjectAtIndex:beginningIndexPath.row];
        [self.objects insertObject:todoObject atIndex:lastIndex.row];
        [self.tableView reloadData];
        
    }
    

}
@end
