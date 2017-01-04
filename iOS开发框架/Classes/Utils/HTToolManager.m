//
//  HTToolManager.m
//  MeetingmeVideo
//
//  Created by aplple on 16/8/4.
//  Copyright © 2016年 huatan. All rights reserved.
//

#import "HTToolManager.h"
#import "SSZipArchive.h"
#define DOCUMENTS_FOLDER_AUDIO @"filepath"

#define HT_ALERTVIEW_TYPE  0


@implementation HTToolManager

+(BOOL)MeetDocisContent:(NSString *)eventId :(BOOL)isNote {
    NSString * docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                              NSUserDomainMask, YES) objectAtIndex:0];
    NSString * meetDocFile;
    
    if (isNote) {
        meetDocFile = [NSString stringWithFormat:@"%@/Data/MeetDoc_%@/Note",docPath,eventId];
    }else {
        meetDocFile = [NSString stringWithFormat:@"%@/Data/MeetDoc_%@/File",docPath,eventId];
    }
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL isDir = FALSE;
    BOOL isDirExist = [fileManager fileExistsAtPath:meetDocFile isDirectory:&isDir];
    
    if(!(isDirExist && isDir))
        
    {
        return NO;
    }else {
        NSArray * contentArr = [fileManager contentsOfDirectoryAtPath:meetDocFile error:nil];
        if (contentArr == nil | contentArr.count == 0) {
            return NO;
        }else {
            return YES;
        }
        
    }
    
}


+ (NSArray *)getMeetDocContentArry:(NSString *)eventId :(BOOL)isNote {
    NSString * docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                              NSUserDomainMask, YES) objectAtIndex:0];
    NSString * meetDocFile;
    
    if (isNote) {
        meetDocFile = [NSString stringWithFormat:@"%@/Data/MeetDoc_%@/Note",docPath,eventId];
    }else {
        meetDocFile = [NSString stringWithFormat:@"%@/Data/MeetDoc_%@/File",docPath,eventId];
    }
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSArray* tempArray = [fileManager contentsOfDirectoryAtPath:meetDocFile error:nil];
    return tempArray;
}
+(NSString * )createPageDic {
    //创建文件夹
    NSString * docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                              NSUserDomainMask, YES) objectAtIndex:0];
    NSString * meetDocFile = [NSString stringWithFormat:@"%@/pageDic",docPath] ;
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL isDir = FALSE;
    BOOL isDirExist = [fileManager fileExistsAtPath:meetDocFile isDirectory:&isDir];
    
    if(!(isDirExist && isDir))
        
    {
        BOOL bCreateDir = [fileManager createDirectoryAtPath:meetDocFile withIntermediateDirectories:YES attributes:nil error:nil];
        
        
        if(!bCreateDir){
            
            return nil;
            
        }else {
            return meetDocFile;
        }
        
    }else {
        return meetDocFile;
    }
}



+(NSString * )createMeetDocPath:(NSString *)eventId :(BOOL)isNote {
    //创建文件夹
    NSString * docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                              NSUserDomainMask, YES) objectAtIndex:0];
    NSString * meetDocFile;
    
    if (isNote) {
      meetDocFile = [NSString stringWithFormat:@"%@/Data/MeetDoc_%@/Note",docPath,eventId];
    }else {
    meetDocFile = [NSString stringWithFormat:@"%@/Data/MeetDoc_%@/File",docPath,eventId];
    }
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL isDir = FALSE;
    BOOL isDirExist = [fileManager fileExistsAtPath:meetDocFile isDirectory:&isDir];
    
    if(!(isDirExist && isDir))
        
    {
        BOOL bCreateDir = [fileManager createDirectoryAtPath:meetDocFile withIntermediateDirectories:YES attributes:nil error:nil];
        
        
        if(!bCreateDir){
            
            return nil;
            
        }else {
            return meetDocFile;
        }
        
    }else {
        return meetDocFile;
    }
}

+ (void)setAlertViewWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertView *alter = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil,nil];
    
    [alter show];
}



/**
 *  Description 定时消失提示框
 *
 *  @param massager   提示信息
 *  @param controller 控制器
 */
+ (void)showAlertViewWithMessage:(NSString *)message Controller:(UIViewController *)controller{
    
    //创建一个alert控制器
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
  
    
#if HT_ALERTVIEW_TYPE
    
    /*message*/
    NSMutableAttributedString *alertMessageStr = [[NSMutableAttributedString alloc] initWithString:message];
    [alertMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, message.length)];

    [alert setValue:alertMessageStr forKey:@"attributedMessage"];
    
#else
    
    
#endif
    

    
    
    [controller presentViewController:alert animated:YES completion:nil];
    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [alert dismissViewControllerAnimated:YES completion:nil];
        
    });
    
}



+ (void)showMessage:(NSString *)message parent:(UIViewController *)parentController Finished:(void(^)(void))finished {
    
    //创建一个alert控制器
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
#if HT_ALERTVIEW_TYPE
    
    /*title*/
    NSMutableAttributedString *alertTitleStr = [[NSMutableAttributedString alloc] initWithString:@"提示"];
    [alertTitleStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:22] range:NSMakeRange(0, 2)];


    [alert setValue:alertTitleStr forKey:@"attributedTitle"];


    /*message*/
    NSMutableAttributedString *alertMessageStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@", message]];
    [alertMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, message.length)];

    [alert setValue:alertMessageStr forKey:@"attributedMessage"];
    
#else
    
    
#endif
    

    
    
    //创建一个取消按钮
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        //在这调用block
        if (finished) {
            
            finished();
        }
    }];
    
    [alert addAction:action];
    [parentController presentViewController:alert animated:YES completion:nil];
}

+ (void)showAlertView:(NSString *)title withMessage:(NSString *)message parent:(UIViewController *)parentController ConfirmFinished:(void(^)(void))finished cancelBlock:(void(^)(void))cancelBlock {
    
    //创建一个alert控制器
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
#if HT_ALERTVIEW_TYPE
    
    /*title*/
    NSMutableAttributedString *alertTitleStr = [[NSMutableAttributedString alloc] initWithString:title];
    [alertTitleStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:22] range:NSMakeRange(0, 2)];

    [alert setValue:alertTitleStr forKey:@"attributedTitle"];


    /*message*/
    NSMutableAttributedString *alertMessageStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@", message]];
    [alertMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, message.length)];

    [alert setValue:alertMessageStr forKey:@"attributedMessage"];
    
#else
    
    
#endif
    

    
    
    UIAlertAction * confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //在这调用block
        if (finished) {
            
            finished();
        }
    }];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) {
            cancelBlock();
        }
    }];
    [alert addAction:confirmAction];
    [alert addAction:cancelAction];
    [parentController presentViewController:alert animated:YES completion:nil];
    
}



+ (void)showDestructiveAlertView:(NSString *)title withMessage:(NSString *)message parent:(UIViewController *)parentController DefaultBlock:(void(^)())defaultBlock DestructiveBlock:(void(^)())destructiveBlock cancelBlock:(void(^)())cancelBlock {
    
    //创建一个alert控制器
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
#if HT_ALERTVIEW_TYPE
    
    /*title*/
    NSMutableAttributedString *alertTitleStr = [[NSMutableAttributedString alloc] initWithString:title];
    [alertTitleStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:22] range:NSMakeRange(0, 2)];

    [alert setValue:alertTitleStr forKey:@"attributedTitle"];


    /*message*/
    NSMutableAttributedString *alertMessageStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@", message]];
    [alertMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, message.length)];

    [alert setValue:alertMessageStr forKey:@"attributedMessage"];
    
#else
    
    
#endif
    

    
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        if (cancelBlock) {
            cancelBlock();
        }
        
    }];
    
    UIAlertAction * sendAction = [UIAlertAction actionWithTitle:@"不发送，退出" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        if (destructiveBlock) {
            destructiveBlock();
        }
        
        
    }];
    
    UIAlertAction * confirmAction = [UIAlertAction actionWithTitle:@"立即发送" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (defaultBlock) {
            defaultBlock();
        }
        
    }];
    
    [alert addAction:confirmAction];
    [alert addAction:cancelAction];
    [alert addAction:sendAction];
    [parentController presentViewController:alert animated:YES completion:nil];
    
}




@end
