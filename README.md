# Conditional Course Payments

## Project Description
Conditional Course Payments is a smart contract built on the Ethereum blockchain that facilitates a secure and conditional payment system for online courses. This system ensures that course creators are compensated only after students successfully enroll, providing transparency and trust between the parties involved.

## Contract Address
*0x04333CaE4Db4e69Ba85F58CeC1A3F96e9123AB85*

## Project Vision
The vision of Conditional Course Payments is to create a decentralized and trustless platform where:
- Course creators can confidently offer their courses.
- Students can pay securely for courses they wish to enroll in.
- Payments are only released when conditions are met, fostering trust and reducing disputes.

## Key Features
1. **Course Creation:**
   - Only approved course creators can create courses with specific pricing.
   - Courses can be activated or deactivated based on the creator’s preferences.

2. **Student Enrollment:**
   - Students can enroll in courses by paying the exact price specified.
   - Ensures secure payment and guarantees that the course price is met.

3. **Payment Release:**
   - Payments are released to course creators only after enrollment.
   - Provides a conditional mechanism to ensure fairness and transparency.

4. **Role-based Access Control:**
   - `Owner`: Responsible for adding or removing approved course creators.
   - `Course Creators`: Individuals authorized to create and manage courses.

5. **Events for Transparency:**
   - Events emitted for course creation, student enrollment, and payment release.
   - Enables efficient tracking of activities on the blockchain.

## Usage
### Deploy the Contract
Deploy the `ConditionalCoursePayments` contract on an Ethereum-compatible blockchain. The `owner` is automatically set as the deployer.

### Add Course Creators
The owner can add approved course creators using the `addCourseCreator` function.

### Create Courses
Approved course creators can create courses with a name and price using the `createCourse` function.

### Enroll Students
Students can enroll in active courses by sending the exact payment via the `enroll` function.

### Release Payment
Course creators can release payments after the enrollment is verified via the `releasePayment` function.

## Notes
- All payments and balances are handled in Wei (the smallest unit of Ether).
- Ensure to update the contract address in this README once deployed.
