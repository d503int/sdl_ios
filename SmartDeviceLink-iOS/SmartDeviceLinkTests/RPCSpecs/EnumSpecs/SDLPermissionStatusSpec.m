//
//  SDLPermissionStatusSpec.m
//  SmartDeviceLink
//
//  Created by Jacob Keeler on 1/21/15.
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//
//#define EXP_SHORTHAND

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLPermissionStatus.h"

QuickSpecBegin(SDLPermissionStatusSpec)

describe(@"Individual Enum Value Tests", ^ {
    it(@"Should match internal values", ^ {
        expect([SDLPermissionStatus ALLOWED].value).to(equal(@"ALLOWED"));
        expect([SDLPermissionStatus DISALLOWED].value).to(equal(@"DISALLOWED"));
        expect([SDLPermissionStatus USER_DISALLOWED].value).to(equal(@"USER_DISALLOWED"));
        expect([SDLPermissionStatus USER_CONSENT_PENDING].value).to(equal(@"USER_CONSENT_PENDING"));
    });
});
describe(@"ValueOf Tests", ^ {
    it(@"Should return correct values when valid", ^ {
        expect([SDLPermissionStatus valueOf:@"ALLOWED"]).to(equal([SDLPermissionStatus ALLOWED]));
        expect([SDLPermissionStatus valueOf:@"DISALLOWED"]).to(equal([SDLPermissionStatus DISALLOWED]));
        expect([SDLPermissionStatus valueOf:@"USER_DISALLOWED"]).to(equal([SDLPermissionStatus USER_DISALLOWED]));
        expect([SDLPermissionStatus valueOf:@"USER_CONSENT_PENDING"]).to(equal([SDLPermissionStatus USER_CONSENT_PENDING]));
    });
    
    it(@"Should return nil when invalid", ^ {
        expect([SDLPermissionStatus valueOf:nil]).to(beNil());
        expect([SDLPermissionStatus valueOf:@"JKUYTFHYTHJGFRFGYTR"]).to(beNil());
    });
});
describe(@"Value List Tests", ^ {
    NSMutableArray* storedValues = [SDLPermissionStatus values];
    __block NSMutableArray* definedValues;
    beforeSuite(^ {
        definedValues = [@[[SDLPermissionStatus ALLOWED],
                        [SDLPermissionStatus DISALLOWED],
                        [SDLPermissionStatus USER_DISALLOWED],
                        [SDLPermissionStatus USER_CONSENT_PENDING]] mutableCopy];
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