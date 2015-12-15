//
//  XFNWorkDetailTableViewCellModel.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/11/2.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrame.h"
#import "XFNWorkDetailTableViewCellModel.h"


//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailTableViewCellModel

@end

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailBasicInfoCellModel

- (instancetype)initWithObject: (AVObject*) assetModel
{
    XFNWorkDetailBasicInfoCellModel* model = [[XFNWorkDetailBasicInfoCellModel alloc] init];
    
    model.areaString       = [[NSString alloc] initWithFormat : @"%@平米", [assetModel objectForKey : @"assetTotalArea"]];
    model.sharedAreaString = [[NSString alloc] initWithFormat : @"%@平米", [assetModel objectForKey : @"assetSharedArea"]];
    model.unitLayoutString = [[NSString alloc] initWithFormat : @"%@房%@卫", [assetModel objectForKey : @"quantityOfRoom"],
                                                                             [assetModel objectForKey : @"quantityOfToilet"]];
    model.storeyString     = [[NSString alloc] initWithFormat : @"%@/%@",    [assetModel objectForKey : @"assetStorey"],
                                                                             [assetModel objectForKey : @"storeyOfAll"]];

    NSString *tempLabelString = [assetModel objectForKey : @"basicInfoLabelsOfAsset"];
    
    NSString *tempSeperatorString = [[NSString alloc] initWithFormat : _Macro_XFN_String_Seperator];
    
    //没有相应的键值，有可能是一个标签都没有
    if (nil == tempLabelString)
    {
        model.labelsArray = nil;
    }
    //有键值，但是找不到分隔符，即只有一个元素
    else if ([tempLabelString rangeOfString: tempSeperatorString].location == NSNotFound)
    {
        NSArray* array = [NSArray arrayWithObject: tempLabelString];
        model.labelsArray = array;
    }
    //有键值，也有分隔符，则根据分隔符创建数组
    else
    {
        model.labelsArray = [tempLabelString componentsSeparatedByString: tempSeperatorString];
    }
    
    return model;
}
@end

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailTradeInfoCellModel

- (instancetype)initWithObject: (AVObject*) assetModel
{
    XFNWorkDetailTradeInfoCellModel* model = [[XFNWorkDetailTradeInfoCellModel alloc] init];
    
    NSString *tempPrice   = [[NSString alloc] initWithFormat : @"%@", [assetModel objectForKey : @"assetTotalPrice"]];
    NSString *tempArea    = [[NSString alloc] initWithFormat : @"%@", [assetModel objectForKey : @"assetTotalArea"]];
    NSInteger unitPrice   = ([tempPrice integerValue] * 10000) / [tempArea integerValue]; //总价是以万为单位，因此此处要乘以10000
    
    model.totalPriceString = [[NSString alloc] initWithFormat : @"%@万", tempPrice];
    model.unitPriceString  = [[NSString alloc] initWithFormat : @"%ld元/平米", unitPrice];
    model.statusString     = [[NSString alloc] initWithFormat : @"%@", [assetModel objectForKey : @"assetStatus"]];
    model.attributedString = [[NSString alloc] initWithFormat : @"%@", [assetModel objectForKey : @"attributeTo"]];
    model.reserveString    = [[NSString alloc] initWithFormat : @"%@ | %@", [assetModel objectForKey : @"reserveMode"],
                                                                            [assetModel objectForKey : @"reserveRemark"]];
    model.deliveryString   = [[NSString alloc] initWithFormat : @"%@ | %@", [assetModel objectForKey : @"deliveryMode"],
                                                                            [assetModel objectForKey : @"deliveryRemark"]];
    
    NSString *tempPayingString = [assetModel objectForKey : @"typeOfPaying"];
    NSString *tempTaxString    = [assetModel objectForKey : @"taxInfo"];
    
    NSArray* tempPayingArray;
    NSArray* tempTaxArray;
    
    NSString *tempSeperatorString = [[NSString alloc] initWithFormat : _Macro_XFN_String_Seperator];
    
    //没有相应的键值，有可能是一个标签都没有
    if (nil == tempPayingString)
    {
        tempPayingArray = nil;
    }
    //有键值，但是找不到分隔符，即只有一个元素
    else if ([tempPayingString rangeOfString: tempSeperatorString].location == NSNotFound)
    {
        tempPayingArray = [NSArray arrayWithObject: tempPayingString];
    }
    //有键值，也有分隔符，则根据分隔符创建数组
    else
    {
        tempPayingArray = [tempPayingString componentsSeparatedByString: tempSeperatorString];
    }
    
    //没有相应的键值，有可能是一个标签都没有
    if (nil == tempTaxString)
    {
        tempTaxArray = nil;
    }
    //有键值，但是找不到分隔符，即只有一个元素
    else if ([tempTaxString rangeOfString: tempSeperatorString].location == NSNotFound)
    {
        tempTaxArray = [NSArray arrayWithObject: tempTaxString];
    }
    //有键值，也有分隔符，则根据分隔符创建数组
    else
    {
        tempTaxArray = [tempTaxString componentsSeparatedByString: tempSeperatorString];
    }
    
    NSMutableArray* array;
    if (nil == tempPayingArray)
    {
        if (nil == tempTaxArray)
        {
            array = nil;
        }
        else
        {
            array = [NSMutableArray arrayWithArray: tempTaxArray];
        }
    }
    else
    {
        array = [NSMutableArray arrayWithArray: tempPayingArray];
        if (nil != tempTaxArray)
        {
            [array addObjectsFromArray: tempTaxArray];
        }
    }

    model.labelsArray = array;
    
    return model;
}
@end

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailAuxiliaryInfoCellModel

- (instancetype)initWithObject: (AVObject*) assetModel
{
    XFNWorkDetailAuxiliaryInfoCellModel* model = [[XFNWorkDetailAuxiliaryInfoCellModel alloc] init];
    
    NSString *tempDecorationString   = [assetModel objectForKey : @"decorationInfo"];
    NSString *tempAncillaryString    = [assetModel objectForKey : @"ancillaryInfo"];
    
    NSArray* tempDecorationArray;
    NSArray* tempAncillaryArray;
    
    NSString *tempSeperatorString = [[NSString alloc] initWithFormat : _Macro_XFN_String_Seperator];
    
    //没有相应的键值，有可能是一个标签都没有
    if (nil == tempDecorationString)
    {
        tempDecorationArray = nil;
    }
    //有键值，但是找不到分隔符，即只有一个元素
    else if ([tempDecorationString rangeOfString: tempSeperatorString].location == NSNotFound)
    {
        tempDecorationArray = [NSArray arrayWithObject: tempDecorationString];
    }
    //有键值，也有分隔符，则根据分隔符创建数组
    else
    {
        tempDecorationArray = [tempDecorationString componentsSeparatedByString: tempSeperatorString];
    }
    
    //没有相应的键值，有可能是一个标签都没有
    if (nil == tempAncillaryString)
    {
        tempAncillaryArray = nil;
    }
    //有键值，但是找不到分隔符，即只有一个元素
    else if ([tempAncillaryString rangeOfString: tempSeperatorString].location == NSNotFound)
    {
        tempAncillaryArray = [NSArray arrayWithObject: tempAncillaryString];
    }
    //有键值，也有分隔符，则根据分隔符创建数组
    else
    {
        tempAncillaryArray = [tempAncillaryString componentsSeparatedByString: tempSeperatorString];
    }
    
    NSMutableArray* array;
    if (nil == tempDecorationArray)
    {
        if (nil == tempAncillaryArray)
        {
            array = nil;
        }
        else
        {
            array = [NSMutableArray arrayWithArray: tempAncillaryArray];
        }
    }
    else
    {
        array = [NSMutableArray arrayWithArray: tempDecorationArray];
        if (nil != tempAncillaryArray)
        {
            [array addObjectsFromArray: tempAncillaryArray];
        }
    }
    
    model.labelsArray = array;
    
    return model;
}
@end

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailContactInfoCellModel

- (instancetype)initWithObject: (AVObject*) assetModel
{
    XFNWorkDetailContactInfoCellModel* model = [[XFNWorkDetailContactInfoCellModel alloc] init];
    
    NSArray* tempContactArray          = [assetModel objectForKey : @"contactInfo"];
    NSArray* tempArray                 = [NSArray array];
    
    NSMutableArray* contactStringArray = [NSMutableArray array];
    NSMutableArray* labelStringArray   = [NSMutableArray array];
    
    /*server存放示例，当该联系人没有身份标签的时候，显示为未知
     [
     "梁先生|*|业主|*|18905718888|*|开特斯拉|*|老板",
     "梁太太|*|家人|*|18905718888|*|身材很好",
     "陈小姐|*|未知|*|18905718888|*|上班族"
     ]
     */
    for (int iIndex=0; iIndex < tempContactArray.count; iIndex++)
    {
        tempArray = [tempContactArray[iIndex] componentsSeparatedByString: _Macro_XFN_String_Seperator];
        
        if (tempArray.count < 3)
        {
            DLog(@"ERROR: tempArray.count=%ld", tempArray.count);
            return nil;
        }
        
        NSString* tempContactString = [[NSString alloc] initWithFormat: @"%@ | %@ | %@", tempArray[0], tempArray[1], tempArray[2]];
        NSString* templabelString   = [[NSString alloc] init];
        if (tempArray.count > 3)
        {
            templabelString   = [templabelString stringByAppendingFormat: @"%@：", tempArray[0]];
            //不止一个标签的时候，进行拼接
            for (int ijj = 3; ijj < tempArray.count; ijj++)
            {
                templabelString = [templabelString stringByAppendingFormat: @" | %@", tempArray[ijj]];
            }
        }
   
        [labelStringArray   addObject: templabelString];
        [contactStringArray addObject: tempContactString];
    }

    model.contactsArray = [contactStringArray copy];
    model.labelsArray   = [labelStringArray   copy];
    
    return model;
}
@end

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailCommentsInfoCellModel

- (instancetype)initWithObject: (AVObject*) assetModel
{
    XFNWorkDetailCommentsInfoCellModel* model = [[XFNWorkDetailCommentsInfoCellModel alloc] init];
    
    NSArray* tempComentArray  = [assetModel objectForKey : @"assetLog"];
    NSMutableArray* tempArray = [NSMutableArray array];

    for (int iIndex = 0; iIndex < tempComentArray.count; iIndex++)
    {
        NSString*    tempString   = tempComentArray[iIndex];
        XFNComments* tempConments = [XFNComments initWithCommentString: tempString];
        /*
            server侧，日志按照创建时间顺序放置，添加一条日志时，将该日志add在数组最后一个元素
            app侧显示，将时间最近的放在最前面，时间最远的放在最下面
         */
        [tempArray insertObject: tempConments atIndex:0];
    }
    
    model.commentsArray = [tempArray copy];
    
    return model;
}
@end



































