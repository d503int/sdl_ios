//
//  SDLSystemContextSpec.m
//  SmartDeviceLink
//
//  Created by Jacob Keeler on 1/21/15.
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//
//#define EXP_SHORTHAND

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLSystemContext.h"

QuickSpecBegin(SDLSystemContextSpec)

describe(@"Individual Enum Value Tests", ^ {
    it(@"Should match internal values", ^ {
        expect([SDLSystemContext MAIN].value).to(equal(@"MAIN"));
        expect([SDLSystemContext VRSESSION].value).to(equal(@"VRSESSION"));
        expect([SDLSystemContext MENU].value).to(equal(@"MENU"));
        expect([SDLSystemContext HMI_OBSCURED].value).to(equal(@"HMI_OBSCURED"));
        expect([SDLSystemContext ALERT].value).to(equal(@"ALERT"));
    });
});
describe(@"ValueOf Tests", ^ {
    it(@"Should return correct values when valid", ^ {
        expect([SDLSystemContext valueOf:@"MAIN"]).to(equal([SDLSystemContext MAIN]));
        expect([SDLSystemContext valueOf:@"VRSESSION"]).to(equal([SDLSystemContext VRSESSION]));
        expect([SDLSystemContext valueOf:@"MENU"]).to(equal([SDLSystemContext MENU]));
        expect([SDLSystemContext valueOf:@"HMI_OBSCURED"]).to(equal([SDLSystemContext HMI_OBSCURED]));
        expect([SDLSystemContext valueOf:@"ALERT"]).to(equal([SDLSystemContext ALERT]));
    });
    
    it(@"Should return nil when invalid", ^ {
        expect([SDLSystemContext valueOf:nil]).to(beNil());
        expect([SDLSystemContext valueOf:@"JKUYTFHYTHJGFRFGYTR"]).to(beNil());
    });
});
describe(@"Value List Tests", ^ {
    NSMutableArray* storedValues = [SDLSystemContext values];
    __block NSMutableArray* definedValues;
    beforeSuite(^ {
        definedValues = [@[[SDLSystemContext MAIN],
                        [SDLSystemContext VRSESSION],
                        [SDLSystemContext MENU],
                        [SDLSystemContext HMI_OBSCURED],
                        [SDLSystemContext ALERT]] mutableCopy];
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