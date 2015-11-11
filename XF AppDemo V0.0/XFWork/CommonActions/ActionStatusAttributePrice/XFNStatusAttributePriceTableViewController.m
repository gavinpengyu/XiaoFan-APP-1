//
//  XFNStatusAttributePriceViewController.m
//  XF AppDemo V0.0
//
//  Created by po on 15/11/9.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrame.h"
#import "XFNStatusAttributePriceTableViewController.h"
#import "XFNStatusAttributePriceTableViewCell.h"
#import "XFNFrameCommonItemDetailModel.h"

//-----------------------------------------------------------------------------------------
@implementation XFNStatusAttributePriceTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //加载数据
    [self initData];
    
    //创建一个UIView
    _tableView=[[UITableView alloc] initWithFrame : self.view.bounds
                                            style : UITableViewStylePlain];
    
    //设置DataSource，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource = self;
    
    //设置Delegate
    _tableView.delegate = self;
    
    //add view
    [self.view addSubview: _tableView];
    
}

- (void) initData
{
    _tableViewModel = [[NSMutableArray alloc] init];
    _pickViewList   = [[NSMutableArray alloc] init];
    
    XFNFrameCommonItemDetailModel *tempDataModel = [[XFNFrameCommonItemDetailModel alloc] init];
    NSMutableArray *tempStatusAttributePrice = [tempDataModel getDataWithType : XFNFrameDataTypeIsCommonItemDetailStatusAttributePrice];
    
    XFNFrameStatusAttributePriceModel *tempStatusAttributePriceModel = tempStatusAttributePrice[0];
    [_tableViewModel addObject : tempStatusAttributePriceModel];
    
    for (int ii = XFNFrameStatusOnSale; ii <= XFNFrameStatusInvalid; ii++)
    {
        NSString * tempString = [tempStatusAttributePriceModel getStatusEnumString : ii];
        [_pickViewList addObject : tempString];
    }
  
    return;
}

#pragma mark TableView DataSource
//返回分组数
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//返回每组行数
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableViewModel.count;
};

//返回每行的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XFNFrameStatusAttributePriceModel *contant = _tableViewModel[indexPath.row];
    
    XFNStatusAttributePriceTableViewCell *cell = [[XFNStatusAttributePriceTableViewCell alloc] initWithStyle : UITableViewCellStyleDefault reuseIdentifier : nil];
    
    cell.delegate = self;
    
    [cell setstatusAttributePrice: contant];

    return cell;
    
    /*若考虑Cell重用以提升性能，可参考一下代码
     static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";
     XFNStatusAttributePriceTableViewCell *cell;
     cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
     if(!cell){
     cell=[[XFNStatusAttributePriceTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
     }

     XFNFrameStatusAttributePriceModel *contant=_tableViewModel[indexPath.row];
     statusAttributePrice=contant;
     return cell;*/
}

#pragma mark TableView Delegate
//重新设置单元格高度
//po 20151109: tableview在初始化时，是先调用heightForRowAtIndexPath计算cell高度，再调用cellForRowAtIndexPath填充cell内容。
//在当前代码结构下，cell.height需要在cellForRowAtIndexPath初始化cell，填入数据，然后才能计算高度。因此，先将高度值用宏固定（关联字体），今后有必要时，再添加自动计算高度的代码
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return XFNDetailTableViewCellFontSizeDefault * 9;
}

#pragma mark Controller Delegate
- (void) toModify : (NSString*) contant with : (NSString*) value
{
    XFNFrameStatusAttributePriceModel *tempStatusAttributePriceModel = [[XFNFrameStatusAttributePriceModel alloc] init];
    tempStatusAttributePriceModel = [_tableViewModel lastObject];
    
    if ([contant isEqualToString: [NSString stringWithFormat:@"Status"]])
    {
        [self toActivatePickerView];
    }
    if ([contant isEqualToString: [NSString stringWithFormat:@"Attribute"]])
    {
        //update data
        tempStatusAttributePriceModel.attributeString = value;
    }
    if ([contant isEqualToString: [NSString stringWithFormat:@"Price"]])
    {
        //update data
        tempStatusAttributePriceModel.priceString = value;
    }
    
    [_tableViewModel removeAllObjects];
    [_tableViewModel addObject:tempStatusAttributePriceModel];
    [_tableView reloadData];
    return;
}

- (void) toActivatePickerView
{
    DLog(@"激活选择器");
    _statusPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 160, 320, 216)];
    //    指定Delegate
    _statusPicker.delegate=self;
    //    显示选中框
    _statusPicker.showsSelectionIndicator=YES;
    [self.view addSubview :_statusPicker];
    
    //     添加按钮
    CGRect frame = CGRectMake(120, 150, 80, 40);
    _statusSelectButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _statusSelectButton.frame=frame;
    [_statusSelectButton setTitle:@"确定" forState:UIControlStateNormal];
    
    [_statusSelectButton addTarget:self action:@selector(statutsSelectedButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_statusSelectButton];
}

-(void) statutsSelectedButtonPressed:(id)sender
{
    NSInteger row =[_statusPicker selectedRowInComponent:0];
    NSString *selected = [_pickViewList objectAtIndex:row];
    DLog(@"%@ is selected", selected);
    
    //关闭Picker，remove subview，对象由ARC自动释放
    [_statusSelectButton removeFromSuperview];
    [_statusPicker removeFromSuperview];
    
    //将选择的数据写入
    XFNFrameStatusAttributePriceModel *tempStatusAttributePriceModel = [[XFNFrameStatusAttributePriceModel alloc] init];
    tempStatusAttributePriceModel = [_tableViewModel lastObject];
    tempStatusAttributePriceModel.statusEnum = row;
    [_tableViewModel removeAllObjects];
    [_tableViewModel addObject:tempStatusAttributePriceModel];
    
    //重要 po 20151111：调试阶段中，使用静态数组存放伪数据，此时实际已通过指针修改了静态数组中的值!! 下面的接口只是体现数据流程，没有实际内容
    XFNFrameCommonItemDetailModel *tempDataModel = [[XFNFrameCommonItemDetailModel alloc] init];
    [tempDataModel sendDataWithType : XFNFrameDataTypeIsCommonItemDetailStatusAttributePrice
                         withBuffer : _tableViewModel];
    
    //重要 po 20151111：暂时使用reload的方法重写cell，性能提升则需要用reloadRow方法，但如下代码不知为何会数组溢出而出错，待调试
    //NSIndexPath *indexPath=[NSIndexPath indexPathForRow:1 inSection:0];//刷新第一个section的第1行
    //[_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    [_tableView reloadData];
    
    return;
}

#pragma mark PickView delegate & datasource
// UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件包含多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 1;  // 返回1表明该控件只包含1列
}
// UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件指定列包含多少个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    // 由于该控件只包含一列，因此无须理会列序号参数component
    // 该方法返回books.count，表明books包含多少个元素，该控件就包含多少行
    return _pickViewList.count;
}
// UIPickerViewDelegate中定义的方法，该方法返回的NSString将作为UIPickerView
// 中指定列和列表项的标题文本
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // 由于该控件只包含一列，因此无须理会列序号参数component
    // 该方法根据row参数返回books中的元素，row参数代表列表项的编号，
    // 因此该方法表示第几个列表项，就使用books中的第几个元素
    return [_pickViewList objectAtIndex:row];
}
// 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
- (void)pickerView : (UIPickerView *)pickerView didSelectRow : (NSInteger)row inComponent : (NSInteger)component
{
    /* po 20151111：这一段代码，可以在不需要点击“确定”键的的情况下选中数据并更新，但是这种方式体验并不是很好
     
    NSString *selected = [_pickViewList objectAtIndex:row];
    DLog(@"%@ is selected, row is %ld", selected, row);
    
    //关闭Picker，remove subview，对象由ARC自动释放
    [_statusSelectButton removeFromSuperview];
    [_statusPicker removeFromSuperview];
    
    //将选择的数据写入
    XFNFrameStatusAttributePriceModel *tempStatusAttributePriceModel = [[XFNFrameStatusAttributePriceModel alloc] init];
    tempStatusAttributePriceModel = [_tableViewModel lastObject];
    tempStatusAttributePriceModel.statusEnum = row;
    [_tableViewModel removeAllObjects];
    [_tableViewModel addObject:tempStatusAttributePriceModel];
    
    //重要 po 20151111：调试阶段中，使用静态数组存放伪数据，此时实际已通过指针修改了静态数组中的值!! 下面的接口只是体现数据流程，没有实际内容
    XFNFrameCommonItemDetailModel *tempDataModel = [[XFNFrameCommonItemDetailModel alloc] init];
    [tempDataModel sendDataWithType : XFNFrameDataTypeIsCommonItemDetailStatusAttributePrice
                         withBuffer : _tableViewModel];
    
    //重要 po 20151111：暂时使用reload的方法重写cell，性能提升则需要用reloadRow方法，但如下代码不知为何会数组溢出而出错，待调试
    //NSIndexPath *indexPath=[NSIndexPath indexPathForRow:1 inSection:0];//刷新第一个section的第1行
    //[_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    [_tableView reloadData];
    
    return;
    */
}

@end




























