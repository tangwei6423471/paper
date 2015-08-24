//
//  TXWTableViewController.m
//  正能量壁纸app
//
//  Created by Mac on 14/11/5.
//  Copyright (c) 2014年 Alvin Tang Love Xie Han Ya (in your heart). All rights reserved.
//

#import "TXWTableViewController.h"
#import "TXWCollectionViewController.h"
@interface TXWTableViewController ()
@property (nonatomic ,strong) NSArray *dataSource;
@end

@implementation TXWTableViewController



#pragma mark - 第二步 创建dataSource数据
- (void)createDataSource
{
    self.dataSource = [[NSMutableArray alloc]init];
    self.dataSource = @[
                        [[NSDictionary alloc]initWithObjectsAndKeys:@"学生族", @"name",@"class01.png",@"picName", nil],
                        [[NSDictionary alloc]initWithObjectsAndKeys:@"上班族", @"name",@"class02.png",@"picName", nil],
                        [[NSDictionary alloc]initWithObjectsAndKeys:@"结婚族", @"name",@"class03.png",@"picName", nil],
                        [[NSDictionary alloc]initWithObjectsAndKeys:@"买房族", @"name",@"class04.png",@"picName", nil],
                        [[NSDictionary alloc]initWithObjectsAndKeys:@"留学族", @"name",@"class05.png",@"picName", nil],
                        [[NSDictionary alloc]initWithObjectsAndKeys:@"养儿族", @"name",@"class06.png",@"picName", nil],
                        [[NSDictionary alloc]initWithObjectsAndKeys:@"考研族", @"name",@"class07.png",@"picName", nil],
                        [[NSDictionary alloc]initWithObjectsAndKeys:@"国考族", @"name",@"class08.png",@"picName", nil],
                        [[NSDictionary alloc]initWithObjectsAndKeys:@"脱单族", @"name",@"class09.png",@"picName", nil],
                        [[NSDictionary alloc]initWithObjectsAndKeys:@"奋斗族", @"name",@"class10.png",@"picName", nil],
                        ];
    
    // 更新加载数据
    [self.tableView reloadData];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDataSource];
    
    // 修改 返回按钮 的文字
    //UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    //temporaryBarButtonItem.title = @"频道";
    //self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    
    // 修改back的颜色和箭头的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[_dataSource objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.textLabel.textAlignment = 1;
    
    // 自定义imgView
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 5, 50, 50)];
    [cell.contentView addSubview:imgView];
    imgView.image = [UIImage imageNamed:[[_dataSource objectAtIndex:indexPath.row] objectForKey:@"picName"]];
    
    // 自定义按钮箭头imgview
    UIImageView *imgView1 = [[UIImageView alloc]initWithFrame:CGRectMake(270, 18, 24, 24)];
    [cell.contentView addSubview:imgView1];
    imgView1.image = [UIImage imageNamed:@"forumCoverRightAccessor"];
    
    // cell选中风格
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark - 间隔颜色
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0)
    {
        cell.backgroundColor = [UIColor whiteColor];
    }
    else
    {
        cell.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:0.1];
    }
}

#pragma mark - 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TXWCollectionViewController *ccvc = [[TXWCollectionViewController alloc]init];
    ccvc.num = indexPath.row;
    [self.navigationController pushViewController:ccvc animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
