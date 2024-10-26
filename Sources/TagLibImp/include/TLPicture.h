//
//  TLPicture.h
//  TagLibImp
//
//  Created by foyoodo on 26/10/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(TagLib.Picture)
@interface TLPicture : NSObject

- (instancetype)initWithData:(NSData *)data size:(CGSize)size;

@property (nonatomic, copy) NSData *data;

@property (nonatomic, assign) CGSize size;

@end

NS_ASSUME_NONNULL_END
