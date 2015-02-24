//
//  SDLWarningLightStatusSpec.m
//  SmartDeviceLink
//
//  Created by Jacob Keeler on 1/21/15.
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//
//#define EXP_SHORTHAND

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLWarningLightStatus.h"

QuickSpecBegin(SDLWarningLightStatusSpec)

describe(@"Individual Enum Value Tests", ^ {
    it(@"Should match internal values", ^ {
        expect([SDLWarningLightStatus OFF].value).to(equal(@"OFF"));
        expect([SDLWarningLightStatus ON].value).to(equal(@"ON"));
        expect([SDLWarningLightStatus FLASH].value).to(equal(@"FLASH"));
        expect([SDLWarningLightStatus NOT_USED].value).to(equal(@"NOT_USED"));
    });
});
describe(@"ValueOf Tests", ^ {
    it(@"Should return correct values when valid", ^ {
        expect([SDLWarningLightStatus valueOf:@"OFF"]).to(equal([SDLWarningLightStatus OFF]));
        expect([SDLWarningLightStatus valueOf:@"ON"]).to(equal([SDLWarningLightStatus ON]));
        expect([SDLWarningLightStatus valueOf:@"FLASH"]).to(equal([SDLWarningLightStatus FLASH]));
        expect([SDLWarningLightStatus valueOf:@"NOT_USED"]).to(equal([SDLWarningLightStatus NOT_USED]));
    });
    
    it(@"Should return nil when invalid", ^ {
        expect([SDLWarningLightStatus valueOf:nil]).to(beNil());
        expect([SDLWarningLightStatus valueOf:@"JKUYTFHYTHJGFRFGYTR"]).to(beNil());
    });
});
describe(@"Value List Tests", ^ {
    NSMutableArray* storedValues = [SDLWarningLightStatus values];
    __block NSMutableArray* definedValues;
    beforeSuite(^ {
        definedValues = [@[[SDLWarningLightStatus OFF],
                        [SDLWarningLightStatus ON],
                        [SDLWarningLightStatus FLASH],
                        [SDLWarningLightStatus NOT_USED]] mutableCopy];
        
    });
    
    it(@"Should contain all defined enum values", ^ {
        for (int i = 0; i < definedValues.count; i++) {
            expect(storedValues).to(contain([definedValues objectAtIndex:i]));
        }
    });
    
    it(@"Should contain only defined enum values", ^ {
        for (int i = 0; i < storedValues.count; i++) {
            expect(definedValues).to(contain([storedValues objectAtIndex:i]));
        }
    });
});

QuickSpecEnd