//
//  NAYLibrary.m
//  CodeFellowsLibrary
//
//  Created by Jeff Schwab on 12/16/13.
//  Copyright (c) 2013 Jeff Schwab. All rights reserved.
//

#import "NAYLibrary.h"

@interface NAYLibrary ()
{
    NSMutableArray *_allShelves;
}
@end


@implementation NAYLibrary


- (instancetype)init
{
    return [self initWithShelves:[NSArray array]];
}

- (instancetype)initWithShelves:(NSArray *)shelves
{
    self = [super init];
    
    if (self && shelves) {
        _allShelves = [shelves mutableCopy];
    }
    
    return self;
}

// Returns an array containing all books from each shelf in library.
// If no shelves in library returns nil;
- (NSArray *)allBooksInLibrary
{
    if ([_allShelves count] != 0) {
        NSMutableArray *booksInLibrary = [NSMutableArray array];
        for (NAYShelf *curShelf in _allShelves) {
            [booksInLibrary addObjectsFromArray:[curShelf booksOnShelf]];
        }
        return [booksInLibrary copy];
    }
    return nil;
}

- (void)addShelf:(NAYShelf *)shelfToAdd
{
    if (!_allShelves) {
        _allShelves = [NSMutableArray array];
    }
    
    if (shelfToAdd) {
        if (![_allShelves containsObject:shelfToAdd]) {
            [_allShelves addObject:shelfToAdd];
        }
    }
}

- (void)removeShelf:(NAYShelf *)shelfToRemove
{
    if (_allShelves) {
        [_allShelves removeObject:shelfToRemove];
    }
}

- (NSArray *)allShelves
{
    if (!_allShelves) {
        _allShelves = [NSMutableArray array];
    }
    return [_allShelves copy];
}

- (void)setAllShelves:(NSArray *)allShelves
{
    if (allShelves) {
        _allShelves = [allShelves mutableCopy];
    }
}


@end
