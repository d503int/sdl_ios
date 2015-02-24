//
//  SDLTriggerSourceSpec.m
//  SmartDeviceLink
//
//  Created by Jacob Keeler on 1/21/15.
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//
//#define EXP_SHORTHAND

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLTriggerSource.h"

QuickSpecBegin(SDLTriggerSourceSpec)

describe(@"Individual Enum Value Tests", ^ {
    it(@"Should match internal values", ^ {
        expect([SDLTriggerSource MENU].value).to(equal(@"MENU"));
        expect([SDLTriggerSource VR].value).to(equal(@"VR"));
        expect([SDLTriggerSource KEYBOARD].value).to(equal(@"KEYBOARD"));
    });
});
describe(@"ValueOf Tests", ^ {
    it(@"Should return correct values when valid", ^ {
        expect([SDLTriggerSource valueOf:@"MENU"]).to(equal([SDLTriggerSource MENU]));
        expect([SDLTriggerSource valueOf:@"VR"]).to(equal([SDLTriggerSource VR]));
        expect([SDLTriggerSource valueOf:@"KEYBOARD"]).to(equal([SDLTriggerSource KEYBOARD]));
    });
    
    it(@"Should return nil when invalid", ^ {
        expect([SDLTriggerSource valueOf:nil]).to(beNil());
        expect([SDLTriggerSource valueOf:@"JKUYTFHYTHJGFRFGYTR"]).to(beNil());
    });
});
describe(@"Value List Tests", ^ {
    NSMutableArray* storedValues = [SDLTriggerSource values];
    __block NSMutableArray* definedValues;
    beforeSuite(^ {
        definedValues = [@[[SDLTriggerSource MENU],
                        [SDLTriggerSource VR],
                        [SDLTriggerSource KEYBOARD]] mutableCopy];
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