//
//  ResumeTests.swift
//  TelaWittigPortfolioTests
//
//  Created by Tela Wittig on 2/7/23.
//

import XCTest
import FirebaseCoreInternal
@testable import TelaWittigPortfolio
final class ResumeTests: XCTestCase {
    let resumeViewModel = ResumeViewModel()
    override func setUpWithError() throws {
        
    }

    func testIdIsTitleAndCompany() throws {
        let resume = ResumeListItem(startDate: Date(), endDate: nil, company: "test", title: "test", responsibilities: ["test"], city: "Tests", state: test)
        XCTAssertEqual(resume.id, "testtest")
    }
    func testGetResumeItems() {
        var result: Result<[ResumeListItem], FirestoreError>?
            
        // Create the expectation.
        let expectation = self.expectation(description: "Waiting for the getResumeItems call to complete.")
            
        // Perform the asynchronous call.
        resumeViewModel.getResumeItems { response in
            // Save the response.
            result = response
            // Fulfill the expectation.
            expectation.fulfill()
        }
            
        // Wait for expectations for a maximum of 2 seconds.
        waitForExpectations(timeout: 2) { error in
            XCTAssertNil(error)
            switch result {
            case .success(let resumeItems):
                XCTAssertEqual(resumeItems.count, 3)
            case .failure,
                 .none:
                XCTFail()
            }
        }
    }
    
    func testRetrieveResumeItemsNoFailure() {
        let expectation = self.expectation(description: "Expecting the getResumeItemsAndPublishForView call not to fail.")
        expectation.isInverted = true
        resumeViewModel.getResumeItems(success: { _ in /* ignore success */ },
                              failure: { _ in expectation.fulfill() })
            
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
