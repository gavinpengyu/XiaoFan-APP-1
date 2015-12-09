//
//  XFNFrameAssetModel.m
//  XF AppDemo V0.0
//
//  Created by po on 15/11/13.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XFNFrame.h"
#import "XFNFrameAssetModel.h"

//-------------------------------------------------------------------------------------
@implementation XFNFrameAssetModel
#pragma mark 地址
//-------------------------------------------------------------------------------------
@dynamic communityName;     //小区名
@dynamic buildingNumber;    //楼栋号
@dynamic addedNumber;       //单元号
@dynamic roomNumber;        //房号

#pragma mark 图片
//-------------------------------------------------------------------------------------
//保留

#pragma mark 交易信息
//-------------------------------------------------------------------------------------
//交易价格
@dynamic assetTotalPrice;
//交易状态
@dynamic assetStatus;   //XFNLabelsForAsset -> labelsForAssetStatus
//交易条件
@dynamic typeOfPaying;  //XFNLabelsForAsset -> labelsForTypeOfPay
//交易税费
@dynamic taxInfo;       //XFNLabelsForAsset -> labelsForTaxInfo
//看房方式
@dynamic reserveMode;
@dynamic reserveRemark;
//交房
@dynamic deliveryMode;
@dynamic deliveryRemark;

#pragma mark 基本信息
//-------------------------------------------------------------------------------------
@dynamic assetTotalArea;
@dynamic assetSharedArea;
@dynamic assetStorey;
@dynamic storeyOfAll;

@dynamic quantityOfRoom;
@dynamic quantityOfToilet;
//户型图，保留
@dynamic basicInfoLabelsOfAsset;  //XFNLabelsForAsset -> labelsForAssetLayoutInfo
@dynamic summaryInfoLabelsOfAsset;//房源摘要，用户可以在该房源的 中挑选需要显示在摘要中的标签，并显示在首页摘要中

#pragma mark 辅助开关
//-------------------------------------------------------------------------------------
@dynamic bIsOnTop; //这套房源是否已置顶
@dynamic bIsFollowed; //这套房源是否已关注

#pragma mark 装修及配套
//-------------------------------------------------------------------------------------
@dynamic decorationInfo;  //XFNLabelsForAsset -> labelsForDecorationInfo
@dynamic ancillaryInfo;   //XFNLabelsForAsset -> labelsForAncillaryInfo

#pragma mark 联系人
//-------------------------------------------------------------------------------------
@dynamic contactInfo; //每新增一个联系人，往该数组中添加一个NSString，NSString格式为“称呼||身份||电话||人物描述”

#pragma mark 特别备注
//-------------------------------------------------------------------------------------
//每新增一个Log，往该数组中添加一个NSString
//Log的开头有三种：
//  |SYS_LOG|:         所有的修改操作，均保存，除非是其他两种log；
//  |KEY_REMARK|:      1、用户在评论框输入信息，并选择“这是关键记录”；2、某些系统操作；
//  |USR_COMMENT|:     用户在评论框输入信息，未选择“这是关键记录”
@dynamic assetLog;

#pragma mark 信息归属
//-------------------------------------------------------------------------------------
@dynamic attributeTo;   //当前归属人
@dynamic createdByWhom; //创建人

#pragma mark 交通信息
//-------------------------------------------------------------------------------------
//保留

#pragma mark 周边信息
//-------------------------------------------------------------------------------------
//保留

+ (NSString *)parseClassName {
    return @"XFNFrameAssetModel";
}

+ (NSMutableArray  *)initArrayByAssetString: (NSString*) string
{
    if(nil == string)
    {
        DLog(@"ERROR: input nil");
        return nil;
    }
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    
    if ([string containsString: _Macro_XFN_String_Seperator])
    {
        array =  (NSMutableArray*) [string componentsSeparatedByString: _Macro_XFN_String_Seperator];
    }
    else
    {
        [array addObject: string];//找不到分隔符，只有一个元素
    }
    
    return array;
}

+ (NSString *)initStringByAssetArray: (NSMutableArray*) array
{
    if(nil == array)
    {
        DLog(@"ERROR: input nil");
        return nil;
    }
    
    NSString* string = [[NSString alloc] initWithString: [array firstObject]];
    NSString *seperator = [[NSString alloc] initWithFormat : _Macro_XFN_String_Seperator];
    
    for(int iIndex=1; iIndex < array.count; iIndex++)
    {
        
        
        NSString *temp = [[NSString alloc] initWithFormat : @"%@%@", seperator, array[iIndex]];
        string = [string stringByAppendingString: temp];
    }
    
    return string;
}

+ (bool)isPhoneNumber:(NSString*)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    
    bool bIs = false;
    
    //手机号码为11位，座机号码可能为10-12位（含3-4位区号）
    if ((string.length <=12 )&& (string.length >=10))
    {
        bIs = true;
    }
    
    int val;
    
    return ([scan scanInt:&val] && [scan isAtEnd] && bIs);
}

@end

//-------------------------------------------------------------------------------------
@implementation XFNLabelsForAsset

@dynamic labelsForAssetStatus;
@dynamic labelsForTypeOfPay;
@dynamic labelsForTaxInfo;
@dynamic labelsForAssetLayoutInfo;
@dynamic labelsForDecorationInfo;
@dynamic labelsForAncillaryInfo;

+ (NSString *)parseClassName {
    return @"XFNLabelsForAsset";
}
@end

//-------------------------------------------------------------------------------------
@implementation XFNComments

+ (XFNComments*)initWithCommentString: (NSString*) string
{
    if (nil == string)
    {
        DLog(@"ERROR: 系统日志出错，输入日志字符串为空");
        return nil;
    }
    
    XFNComments* comments   = [[XFNComments alloc] init];
    NSArray*     tempArray  = [[NSArray alloc] init];
    
    tempArray = [string componentsSeparatedByString: _Macro_XFN_String_Seperator];
    
    //日志必须为4个字段，否则报错
    if (4 != tempArray.count)
    {
        DLog(@"ERROR: 系统日志出错，解析日志字符串字段为%ld", tempArray.count);
        return nil;
    }
    
    NSString* tempTypeString     = tempArray[0];
    NSString* tempNameString     = tempArray[1];
    NSString* tempSendtimeString = tempArray[2];
    NSString* tempContantString  = tempArray[3];
    
    NSString *comentTypeAuto   = [[NSString alloc] initWithFormat : _Macro_XFN_Comment_Auto];
    NSString *comentTypeManual = [[NSString alloc] initWithFormat : _Macro_XFN_Comment_Manual];
    NSString *comentTypeKey    = [[NSString alloc] initWithFormat : _Macro_XFN_Comment_Key];
    
    //type字段不合法报错
    if (!([tempTypeString isEqualToString: comentTypeAuto] || [tempTypeString isEqualToString: comentTypeManual] || [tempTypeString isEqualToString: comentTypeKey]))
    {
        DLog(@"ERROR: 解析系统日志出错，日志类型错误，输入的类型为%@", tempTypeString);
        return nil;
    }
    
    if ((nil == tempContantString) || (nil == tempNameString) || (nil == tempSendtimeString))
    {
        DLog(@"ERROR: 解析系统日志出错，输入字符串为空");
        return nil;
    }
    
    comments.type     = tempTypeString;
    comments.name     = tempNameString;
    comments.sendtime = tempSendtimeString;
    comments.contant  = tempContantString;
    
    return comments;
}

+ (NSString*)sysLogWithXFNComments: (XFNComments*) comment
{
    if (nil == comment)
    {
        DLog(@"ERROR: 系统日志出错，输入XFNComments为空");
        return nil;
    }
    
    NSString *logString = [XFNComments sysLogWithType: comment.type
                                           andContant: comment.contant
                                             bySender: comment.name
                                               atTime: comment.sendtime];
    return logString;
}

+ (NSString*)sysLogWithType: (NSString*) type
                 andContant: (NSString*) contant
                   bySender: (NSString*) name
                     atTime: (NSString*) sendtime;
{
    NSString *comentTypeAuto   = [[NSString alloc] initWithFormat : _Macro_XFN_Comment_Auto];
    NSString *comentTypeManual = [[NSString alloc] initWithFormat : _Macro_XFN_Comment_Manual];
    NSString *comentTypeKey    = [[NSString alloc] initWithFormat : _Macro_XFN_Comment_Key];
    
    NSString *tempSeperator    = [[NSString alloc] initWithFormat : _Macro_XFN_String_Seperator];
    
    if (!([type isEqualToString: comentTypeAuto] || [type isEqualToString: comentTypeManual] || [type isEqualToString: comentTypeKey]))
    {
        DLog(@"ERROR: 系统日志出错，日志类型错误，输入的类型为%@", type);
        return nil;
    }
    
    if ((nil == contant) || (nil == name) || (nil == sendtime))
    {
        DLog(@"ERROR: 系统日志出错，输入字符串为空");
        return nil;
    }
    
    NSString *logString = [[NSString alloc] initWithFormat: @"%@%@%@%@%@%@%@", type, tempSeperator, name, tempSeperator, sendtime, tempSeperator,contant];
    
    return logString;
}

@end




































