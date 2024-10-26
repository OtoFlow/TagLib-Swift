//
//  TLPicture.m
//  TagLibImp
//
//  Created by foyoodo on 26/10/2024.
//

#import "TLPicture.h"

@implementation TLPicture

- (instancetype)initWithData:(NSData *)data size:(CGSize)size
{
    if (self = [super init]) {
        self.data = data;
        self.size = size;
    }
    return self;
}

@end
