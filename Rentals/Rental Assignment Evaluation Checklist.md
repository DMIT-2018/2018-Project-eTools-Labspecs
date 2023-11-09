## Note: This document serves as a high-level overview and may not cover all rules or key features. Its purpose is to offer additional clarity for you and your team.  If you have any questions, please see your instructor.  
---

# Student Assignment Evaluation Checklist for Rentals

## Rentals Subsystem Access
- [ ] Check that employees must log into the system to access the Rentals subsystem.
- [ ] Verify that only authenticated users within the Rental Role can access the subsystem.

## Rental Processing Rules
- [ ] Ensure a customer record is mandatory before processing a rental.
- [ ] Confirm that each equipment rental is treated independently.
- [ ] Verify that coupons must be presented at the time of rental.
- [ ] Check that equipment rentals are based on full sets and no partial returns are allowed.
- [ ] Confirm that if equipment has different rental periods, separate contracts are created.
- [ ] Ensure the smallest rental period offered is a half-day.
- [ ] Verify that only customers in good standing are allowed to rent equipment.

## Renting Procedures
- [ ] Check that a rental is processed as one bulk transaction.
- [ ] Confirm that rentals can include multiple pieces of equipment.
- [ ] Verify that only available equipment can be added to a rental.
- [ ] Check that the rental rate is charged daily.
- [ ] Ensure the default rental period is one day, with adjustments allowed during return.
- [ ] Verify that the default payment type is a credit card.
- [ ] Confirm that the rental date for taking the equipment is the current date and time.

## Returns Processing
- [ ] Ensure equipment is marked available only if returned in clean working order.
- [ ] Verify that the incoming condition of the equipment is recorded.
- [ ] Check that payment types include 'Money', 'Credit', and 'Debit'.
- [ ] Confirm that discounts from coupons are applied to the rental pricing.
- [ ] Ensure subtotals and taxes are calculated before applying the coupon discount.
- [ ] Verify that the rental return date is the current date and time.
- [ ] Confirm that rentals are updated in bulk, including relevant details and equipment status.

## Sample Images
- [ ] Review the sample images provided for Rental Returns for accuracy and completeness.

## View Models and Methods
### View Models
- [ ] Check that the `CustomerView` class contains the necessary properties.
- [ ] Verify that the `AvailableEquipmentView` reflects the available equipment for rent.
- [ ] Ensure the `RentalsView` accurately represents a rental transaction.
- [ ] Confirm that the `RentalDetailView` includes all details for each rental item.

### Methods
- [ ] Verify the `GetCustomerByPhone` method retrieves the correct customer information.
- [ ] Check that the `GetEquipments` method lists all available equipment for rent.
- [ ] Confirm the `GetCoupon` method accurately retrieves the correct discount value.
- [ ] Ensure the `Rent` method processes the rental accurately.
- [ ] Check the `GetRentalByRentalNumber` method retrieves the correct rental information.
- [ ] Verify the `GetRentalByPhone` method lists all rentals associated with a phone number.
- [ ] Confirm the `SelectRentalByCustomer` method provides a list of rentals for a customer.
- [ ] Ensure the `Return` method correctly processes the return of rental items.

