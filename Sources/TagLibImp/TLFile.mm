//
//  TLFile.mm
//  TagLib-Swift
//
//  Created by foyoodo on 21/9/2024.
//

#import "TLFile.h"

#import <taglib/tfilestream.h>
#import <taglib/fileref.h>

using namespace TagLib;

static inline NSString *NSStr(String string) {
    return string.isEmpty() ? NULL : [NSString stringWithUTF8String:string.toCString(true)];
}

static inline String TLStr(NSString *string) {
    return string ? String([string UTF8String], String::UTF8) : String();
}

@interface TLFile () {
    FileRef ref;
}

@end

@implementation TLFile

- (instancetype)initWithURL:(NSURL *)url
{
    if (self = [super init]) {
        ref = FileRef(url.fileSystemRepresentation);
    }
    return self;
}

- (void)save
{
    ref.save();
}

// MARK: - Properties

- (NSString *)title 
{
    return NSStr(ref.tag()->title());
}

- (void)setTitle:(NSString *)title
{
    ref.tag()->setTitle(TLStr(title));
}

- (NSString *)artist
{
    return NSStr(ref.tag()->artist());
}

- (void)setArtist:(NSString *)artist
{
    ref.tag()->setArtist(TLStr(artist));
}

- (NSString *)album
{
    return NSStr(ref.tag()->album());
}

- (void)setAlbum:(NSString *)album
{
    ref.tag()->setAlbum(TLStr(album));
}

- (NSString *)comment
{
    return NSStr(ref.tag()->comment());
}

- (void)setComment:(NSString *)comment
{
    ref.tag()->setComment(TLStr(comment));
}

- (NSString *)genre
{
    return NSStr(ref.tag()->genre());
}

- (void)setGenre:(NSString *)genre
{
    ref.tag()->setGenre(TLStr(genre));
}

- (NSNumber *)year
{
    return @(ref.tag()->year());
}

- (void)setYear:(NSNumber *)year
{
    ref.tag()->setYear(year.unsignedIntValue);
}

- (NSNumber *)track
{
    return @(ref.tag()->track());
}

- (void)setTrack:(NSNumber *)track
{
    ref.tag()->setTrack(track.unsignedIntValue);
}

@end
