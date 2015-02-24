//
//  SDLSoftButtonSpec.m
//  SmartDeviceLink
//
//  Created by Jacob Keeler on 1/23/15.
//  Copyright (c) 2015 Ford Motor Company. All rights reserved.
//
//#define EXP_SHORTHAND

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLSoftButton.h"
#import "SDLNames.h"

QuickSpecBegin(SDLSoftButtonSpec)

SDLImage* image = [[SDLImage alloc] init];

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLSoftButton* testStruct = [[SDLSoftButton alloc] init];
        
        testStruct.type = [SDLSoftButtonType IMAGE];
        testStruct.text = @"Button";
        testStruct.image = image;
        testStruct.isHighlighted = [NSNumber numberWithBool:YES];
        testStruct.softButtonID = @5423;
        testStruct.systemAction = [SDLSystemAction KEEP_CONTEXT];
        
        expect(testStruct.type).to(equal([SDLSoftButtonType IMAGE]));
        expect(testStruct.text).to(equal(@"Button"));
        expect(testStruct.image).to(equal(image));
        expect(testStruct.isHighlighted).to(equal([NSNumber numberWithBool:YES]));
        expect(testStruct.softButtonID).to(equal(@5423));
        expect(testStruct.systemAction).to(equal([SDLSystemAction KEEP_CONTEXT]));
    });
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{NAMES_type:[SDLSoftButtonType IMAGE],
                                       NAMES_text:@"Button",
                                       NAMES_image:image,
                                       NAMES_isHighlighted:[NSNumber numberWithBool:YES],
                                       NAMES_softButtonID:@5423,
                                       NAMES_systemAction:[SDLSystemAction KEEP_CONTEXT]} mutableCopy];
        SDLSoftButton* testStruct = [[SDLSoftButton alloc] initWithDictionary:dict];
        
        expect(testStruct.type).to(equal([SDLSoftButtonType IMAGE]));
        expect(testStruct.text).to(equal(@"Button"));
        expect(testStruct.image).to(equal(image));
        expect(testStruct.isHighlighted).to(equal([NSNumber numberWithBool:YES]));
        expect(testStruct.softButtonID).to(equal(@5423));
        expect(testStruct.systemAction).to(equal([SDLSystemAction KEEP_CONTEXT]));
    });
    
    it(@"Should return nil if not set", ^ {
        SDLSoftButton* testStruct = [[SDLSoftButton alloc] init];
        
        expect(testStruct.type).to(beNil());
        expect(testStruct.text).to(beNil());
        expect(testStruct.image).to(beNil());
        expect(testStruct.isHighlighted).to(beNil());
        expect(testStruct.softButtonID).to(beNil());
        expect(testStruct.systemAction).to(beNil());
    });
});

QuickSpecEnd