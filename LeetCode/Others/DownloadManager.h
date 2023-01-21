//
//  Header.h
//  LeetCode
//
//  Created by 贺嘉炜 on 2021/2/26.
//  Copyright © 2021 saidicaprio. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import <Foundation/Foundation.h>

enum DownloadState {
    downloading = 1
    finished = 2
    ...
}

@interface DownloadManager

@singleton(DownloadManager)



@property(nonatomic, copy) NString *fileName;

@property(nonatomic, copy) NString *saveToPath;

@property(nonatomic, strong) NSDate *expireDate;

@property(nonatomic, assign) BOOL needRetryIfFailed;
    
- (void)downloadWithUrls:(NSArray<NSString *> *)urls;

- (void)downloadWithUrl:(NSString *)url;

- (void)pause;

- (void)resume;

- (void)downloadWithUrl:(NSString *)url fromLocation:(NSInteger)location;

- (NSArray<String *>)downloadingFileList;

- (NSArray<String *>)pendingFiles;

- (void)cancelCurrentDownloadFile:(File *)file;
    
@end

@interface File()
    
@property(nonatomic, assign) DownloadState downloadState;

- (CGFloat)process;

@end

#endif /* Header_h */
