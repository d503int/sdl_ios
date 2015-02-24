//
//  SDLSpeechCapabilitiesSpec.m
//  SmartDeviceLink
//
//  Created by Jacob Keeler on 1/21/15.
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//
//#define EXP_SHORTHAND

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLSpeechCapabilities.h"

QuickSpecBegin(SDLSpeechCapabilitiesSpec)

describe(@"Individual Enum Value Tests", ^ {
    it(@"Should match internal values", ^ {
        expect([SDLSpeechCapabilities TEXT].value).to(equal(@"TEXT"));
        expect([SDLSpeechCapabilities SAPI_PHONEMES].value).to(equal(@"SAPI_PHONEMES"));
        expect([SDLSpeechCapabilities LHPLUS_PHONEMES].value).to(equal(@"LHPLUS_PHONEMES"));
        expect([SDLSpeechCapabilities PRE_RECORDED].value).to(equal(@"PRE_RECORDED"));
        expect([SDLSpeechCapabilities SILENCE].value).to(equal(@"SILENCE"));
    });
});
describe(@"ValueOf Tests", ^ {
    it(@"Should return correct values when valid", ^ {
        expect([SDLSpeechCapabilities valueOf:@"TEXT"]).to(equal([SDLSpeechCapabilities TEXT]));
        expect([SDLSpeechCapabilities valueOf:@"SAPI_PHONEMES"]).to(equal([SDLSpeechCapabilities SAPI_PHONEMES]));
        expect([SDLSpeechCapabilities valueOf:@"LHPLUS_PHONEMES"]).to(equal([SDLSpeechCapabilities LHPLUS_PHONEMES]));
        expect([SDLSpeechCapabilities valueOf:@"PRE_RECORDED"]).to(equal([SDLSpeechCapabilities PRE_RECORDED]));
        expect([SDLSpeechCapabilities valueOf:@"SILENCE"]).to(equal([SDLSpeechCapabilities SILENCE]));
    });
    
    it(@"Should return nil when invalid", ^ {
        expect([SDLSpeechCapabilities valueOf:nil]).to(beNil());
        expect([SDLSpeechCapabilities valueOf:@"JKUYTFHYTHJGFRFGYTR"]).to(beNil());
    });
});
describe(@"Value List Tests", ^ {
    NSMutableArray* storedValues = [SDLSpeechCapabilities values];
    __block NSMutableArray* definedValues;
    beforeSuite(^ {
        definedValues = [@[[SDLSpeechCapabilities TEXT],
                        [SDLSpeechCapabilities SAPI_PHONEMES],
                        [SDLSpeechCapabilities LHPLUS_PHONEMES],
                        [SDLSpeechCapabilities PRE_RECORDED],
                        [SDLSpeechCapabilities SILENCE]] mutableCopy];
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