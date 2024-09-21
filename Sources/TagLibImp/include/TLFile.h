//
//  TLFile.h
//  TagLib-Swift
//
//  Created by foyoodo on 21/9/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(TagLib.File)
@interface TLFile : NSObject

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithURL:(NSURL *)url;

- (void)save;

@property (nonatomic, copy, nullable) NSString *title;

@property (nonatomic, copy, nullable) NSString *artist;

@property (nonatomic, copy, nullable) NSString *album;

@property (nonatomic, copy, nullable) NSString *comment;

@property (nonatomic, copy, nullable) NSString *genre;

@property (nonatomic, copy, nullable) NSNumber *year;

@property (nonatomic, copy, nullable) NSNumber *track;

@end

NS_ASSUME_NONNULL_END
