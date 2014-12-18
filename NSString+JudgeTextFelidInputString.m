//
//  NSString+JudgeTextFelidInputString.m
//  veryWallen
//
//  Created by Peter Hao on 14-8-28.
//  Copyright (c) 2014年 Peter Hao. All rights reserved.
//

#import "NSString+JudgeTextFelidInputString.h"
@implementation NSString (JudgeTextFelidInputString)

+ (BOOL) validateNumber:(NSString *)str
{
    //手机号以13， 15，18,17开头，八个 \d 数字字符
    NSString *phoneRegex = @"^\\d{10,20}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:str];
}
//判断输入字符是否是手机号
+ (BOOL) validateMobile:(NSString *)str
{
    str=[str stringByReplacingOccurrencesOfString:@"-" withString:@""];
    str=[str stringByReplacingOccurrencesOfString:@" " withString:@""];
    if([str hasPrefix:@"17951"]){
        str = [str substringFromIndex:5];
    }
    else if ([str hasPrefix:@"0086"]){
        str = [str substringFromIndex:4];
    }
    else if ([str hasPrefix:@"+86"]){
        str = [str substringFromIndex:3];
    }
    else if ([str hasPrefix:@"19389"]){
        str = [str substringFromIndex:5];
    }
    else if ([str hasPrefix:@"12593"]){
        str = [str substringFromIndex:5];
    }
    else if ([str hasPrefix:@"17911"]){
        str = [str substringFromIndex:5];
    }
    else if ([str hasPrefix:@"17901"]){
        str = [str substringFromIndex:5];
    }
    else if ([str hasPrefix:@"10193"]){
        str = [str substringFromIndex:5];
    }
    else if ([str hasPrefix:@"86"]){
        str = [str substringFromIndex:2];
    }
    if (str.length==0) {
        return NO;
    }
    //手机号以13， 15，18,17开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(17[7])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:str];
}

//判断输入字符是否是邮箱
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
//判断输入字符是否是密码
+ (BOOL) validatePassword:(NSString *)passWord
{
//    NSString *passWordRegex = @"^[a-zA-Z0-9]{1,8}+$";
//    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
//    return [passWordPredicate evaluateWithObject:passWord];
    /**
     *  添加判断用户密码
     */
    BOOL isRigth;
    NSString *allPwdRegex = @"[A-Z0-9a-z._%+-~!@#$%^&*()_+=\"]{8,20}+$";
    NSPredicate *emailRegexPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",allPwdRegex];
    isRigth = [emailRegexPredicate evaluateWithObject:passWord];
    NSString *passWordRegex = @"^[a-zA-Z]{8,20}+$";
    NSString *passWordRegex1 = @"^[0-9]{8,20}+$";
    
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    NSPredicate *passWordPredicate1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex1];
    BOOL first = ![passWordPredicate1 evaluateWithObject:passWord];
    BOOL secend = ![passWordPredicate evaluateWithObject:passWord];
    return first&&secend&&isRigth;
}
+ (BOOL) validateUserName:(NSString *)name
{
    NSString *nameRegex = @"^[a-zA-Z0-9\u4E00-\u9FA5]{1,16}+$";
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nameRegex];
    return [namePredicate evaluateWithObject:name];
}
/**
 *  包含中英文的真实姓名判断
 *
 *  @param name 输入真实姓名
 *
 *  @return 是不是真实姓名
 */
+ (BOOL) validateRealNameCNorUK:(NSString *)name
{
    if (name.length==0) {
        return NO;
    }
    NSString *cnRegex = @"^[\u4E00-\u9FA5]{1}+$";
    NSString *cnAllRegex = @"^[\u4E00-\u9FA5]{1,16}+$";

    NSString *ukRegex = @"^[a-zA-Z]{1}+$";
    NSString *ukAllRegex = @"^[a-zA-Z ]{1,16}+$";
    NSPredicate *cnPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",cnRegex];
    NSPredicate *ukPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",ukRegex];
    NSPredicate *cnAllPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",cnAllRegex];
    NSPredicate *ukAllPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",ukAllRegex];
    if ([cnPredicate evaluateWithObject:[name substringWithRange:NSMakeRange(0, 1)]]) {
        return [cnAllPredicate evaluateWithObject:name];
    }else if([ukPredicate evaluateWithObject:[name substringWithRange:NSMakeRange(0, 1)]]){
        return [ukAllPredicate evaluateWithObject:name];
    }else{
        return NO;
    }
}

+ (BOOL) validateUserNameWithoutCN:(NSString *)name
{
    NSString *nameRegex = @"^[a-zA-Z0-9]{1,16}+$";
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nameRegex];
    return [namePredicate evaluateWithObject:name];
}
+(telType) validateTelType:(NSString *)telNo
{

    NSString *yidongString = @"^1(3[4-9]|5[012789]|8[78])\\d{8}$";
    NSPredicate *yidongStringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",yidongString];
    if ([yidongStringPredicate evaluateWithObject:telNo]) {
        return yidong;
    }
    /// 匹配电信手机号
    /// </summary>
    NSString *dianxin1String  = @"^1[35]3\\d{8}$";
    NSPredicate *dianxin1StringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",dianxin1String];
    if ([dianxin1StringPredicate evaluateWithObject:telNo]) {
        return dianxin;
    }
    NSString *dianxin2String  = @"^18[09]\\d{8}$";
    NSPredicate *dianxin2StringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",dianxin2String];
    if ([dianxin2StringPredicate evaluateWithObject:telNo]) {
        return dianxin;
    }    /// 匹配联通手机号
    /// </summary>
    NSString  *liantongstring  = @"^1(3[0-2]|5[56]|8[56])\\d{8}$";
    NSPredicate *liantongstringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",liantongstring];
    if ([liantongstringPredicate evaluateWithObject:telNo]) {
        return liantong;
    }    /// 匹配CDMA手机号
    return other;
}
/*____身份证验证____*/
+(BOOL)isValidateIdCardNum:(NSString *)idCardNum
{
    BOOL isValidate = NO;
    
    if (idCardNum.length == 17) {
        NSString *lastNum = [idCardNum substringFromIndex:17];
        if ([lastNum isEqualToString:@"x"] || [lastNum isEqualToString:@"X"]) {
        }else{
            return isValidate;
        }
    }
    
    if (idCardNum.length == 18) {
        int idcardNumSum = 0;
        NSArray *numArr = [[NSArray alloc] initWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2",nil];
        for (int i = 0; i < 17; i++) {
            NSString *idNum = [idCardNum substringWithRange:NSMakeRange(i, 1)];
            NSString *sumNum = [numArr objectAtIndex:i];
            idcardNumSum = idcardNumSum + idNum.intValue * sumNum.intValue;
        }
        
        idcardNumSum = idcardNumSum % 11;
        
        NSString *lastNum = [idCardNum substringFromIndex:17];
        lastNum = [lastNum lowercaseString];
        
        NSArray *verificationArr = [[NSArray alloc] initWithObjects:@"1",@"0",@"x",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2",nil];
        NSString *verificationNum = [verificationArr objectAtIndex:idcardNumSum];
        
        if ([lastNum isEqualToString:verificationNum]) {
            return YES;
        }
    }
    
    return isValidate;
}
+ (BOOL)isMobilephoneAndTelephoneNumber:(NSString *)mobileNum
{
    if ([self validateMobile:mobileNum]) {
        return YES;
    }
//    mobileNum=[mobileNum stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNum=[mobileNum stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([mobileNum hasPrefix:@"+86"]){
        mobileNum = [mobileNum substringFromIndex:3];
    }
    NSString *phoneRegex = @"^(0?(([1-9]\\d)|([3-9]\\d{2}))-?)?\\d{7,8}$";

    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobileNum];
}

@end
