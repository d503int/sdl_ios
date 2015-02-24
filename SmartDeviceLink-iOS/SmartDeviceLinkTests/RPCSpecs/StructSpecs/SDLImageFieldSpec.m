//
//  SDLImageFieldSpec.m
//  SmartDeviceLink
//
//  Created by Jacob Keeler on 1/23/15.
//  Copyright (c) 2015 Ford Motor Company. All rights reserved.
//
//#define EXP_SHORTHAND

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLImageField.h"
#import "SDLFileType.h"
#import "SDLNames.h"

QuickSpecBegin(SDLImageFieldSpec)

SDLImageResolution* resolution = [[SDLImageResolution alloc] init];

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLImageField* testStruct = [[SDLImageField alloc] init];
        
        testStruct.name = [SDLImageFieldName turnIcon];
        testStruct.imageTypeSupported = [@[[SDLFileType GRAPHIC_PNG], [SDLFileType GRAPHIC_JPEG]] mutableCopy];
        testStruct.imageResolution = resolution;
        
        expect(testStruct.name).to(equal([SDLImageFieldName turnIcon]));
        expect(testStruct.imageTypeSupported).to(equal([@[[SDLFileType GRAPHIC_PNG], [SDLFileType GRAPHIC_JPEG]] mutableCopy]));
        expect(testStruct.imageResolution).to(equal(resolution));
    });
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{NAMES_name:[SDLImageFieldName turnIcon],
                                       NAMES_imageTypeSupported:[@[[SDLFileType GRAPHIC_PNG], [SDLFileType GRAPHIC_JPEG]] mutableCopy],
                                       NAMES_imageResolution:resolution} mutableCopy];
        SDLImageField* testStruct = [[SDLImageField alloc] initWithDictionary:dict];
        
        expect(testStruct.name).to(equal([SDLImageFieldName turnIcon]));
        expect(testStruct.imageTypeSupported).to(equal([@[[SDLFileType GRAPHIC_PNG], [SDLFileType GRAPHIC_JPEG]] mutableCopy]));
        expect(testStruct.imageResolution).to(equal(resolution));
    });
    
    it(@"Should return nil if not set", ^ {
        SDLImageField* testStruct = [[SDLImageField alloc] init];
        
        expect(testStruct.name).to(beNil());
        expect(testStruct.imageTypeSupported).to(beNil());
        expect(testStruct.imageResolution).to(beNil());
    });
});

QuickSpecEnd