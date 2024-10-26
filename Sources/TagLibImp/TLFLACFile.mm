//
//  TLFLACFile.m
//  TagLibImp
//
//  Created by foyoodo on 21/9/2024.
//

#import "TLFLACFile.h"
#import "TLFile+Internal.h"

#import <CoreGraphics/CoreGraphics.h>

#import <taglib/flacfile.h>

using namespace TagLib;

@interface TLFLACFile () {
    FLAC::File *file;
}

@end

@implementation TLFLACFile

- (void)dealloc
{
    file = nullptr;
}

- (instancetype)initWithURL:(NSURL *)url
{
    if (self = [super initWithURL:url]) {
        file = dynamic_cast<FLAC::File *>([super file]);
    }
    return self;
}

- (NSArray<TLPicture *> *)pictures
{
    auto pictureList = file->pictureList();

    if (pictureList.size() == 0) {
        return NULL;
    }

    NSMutableArray *pictures = [[NSMutableArray alloc] init];
    for (auto it = pictureList.begin(); it != pictureList.end(); ++it) {
        auto picture = *it;
        auto byteVector = picture->data();
        NSData *data = [NSData dataWithBytes:byteVector.data() length:byteVector.size()];
        TLPicture *newPicture = [[TLPicture alloc] initWithData:data size: CGSizeMake(picture->width(), picture->height())];
        [pictures addObject:newPicture];
    }

    return [pictures copy];
}

- (void)setPictures:(NSArray<TLPicture *> *)pictures
{
    file->removePictures();

    for (TLPicture *picture in pictures) {
        ByteVector byteVector(static_cast<const char *>(picture.data.bytes), (unsigned int)picture.data.length);
        auto p = new FLAC::Picture;
        TagLib::String mimeType = byteVector.startsWith("\x89PNG\x0d\x0a\x1a\x0a") ? "image/png" : "image/jpeg";
        p->setData(byteVector);
        p->setType(FLAC::Picture::FrontCover);
        p->setMimeType(mimeType);
        p->setWidth(picture.size.width);
        p->setHeight(picture.size.height);
        file->addPicture(p);
    }
}

@end
