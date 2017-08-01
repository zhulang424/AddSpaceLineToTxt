//
//  main.m
//  AddSpaceLineToTxt
//
//  Created by 郑玮琦 on 2017/8/1.
//  Copyright © 2017年 ZWQ. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const kTxtAddress = @"/Users/ZWQ/Downloads/a.txt"; // txt 文件地址
static NSString *const kNewTxtAddress = @"/Users/ZWQ/Downloads/aa.txt"; // 新 txt 文件地址

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 将文件内容读取到 NSString
        NSString *stringOfTxtContent;
        unsigned long encoder = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000); // TXT 编码格式
        NSData *dataOfTxtContent = [NSData dataWithContentsOfFile:kTxtAddress];
        if (!dataOfTxtContent) {
            NSLog(@"File Not Exits! Please Check The FileAddress!");
            return 1;
        }
        stringOfTxtContent = [[NSString alloc] initWithData:dataOfTxtContent
                                                   encoding:encoder];
        // 对内容进行处理
        NSArray *separatedArray = [stringOfTxtContent componentsSeparatedByString:@"\n"];
        NSString *stringOfNewTxtContent = [separatedArray componentsJoinedByString:@"\n\n"];
        
        // 将处理完的内容写入文件
        NSError *writeToFileError;
        [stringOfNewTxtContent writeToFile:kNewTxtAddress
                                atomically:YES
                                  encoding:NSUTF8StringEncoding
                                     error:&writeToFileError];
        if (writeToFileError) {
            NSLog(@"%@",[writeToFileError localizedDescription]);
        }

    }
    return 0;
}
