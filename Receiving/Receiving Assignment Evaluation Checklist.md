## Note: This document serves as a high-level overview and may not cover all rules or key features. Its purpose is to offer additional clarity for you and your team.  If you have any questions, please see your instructor.
---

# Student Assignment Evaluation Checklist

## Receiving Purchase Orders Rules

### Access & Authentication:
- [ ] Confirm the employee login system is operational.
- [ ] Check that only users with the Receiving Role have access.
- [ ] Validate that either an Associate or a Department Head can manage receiving.
- [ ] Ensure the Employee's full name is displayed on the form.

### Order Verification:
- [ ] Verify that receiving is conducted after the purchase order was placed.
- [ ] Check that there's a manual verification process against the vendor's shipping sheet.
- [ ] Ensure there's a system to note received quantities for mismatched items.
- [ ] Assess documentation procedures for damaged items.
- [ ] Look for a process to document items sent in error.

### Order Processing:
- [ ] Confirm the display of all outstanding orders for selection.
- [ ] Verify that order details are available upon selection.
- [ ] Check that receivers can enter the number of items received.
- [ ] Ensure there's a functionality to specify refused or returned items with reasons.
- [ ] Look for a process to document items shipped in error.

### Receiving:
- [ ] Confirm that bulk update processing is available for the current displayed purchase order.
- [ ] Check for the creation of a ReceiveOrder Entry.
- [ ] Verify the creation of ReceiveOrderDetail entries for each received stock item.
- [ ] Ensure the StockItem QuantityOnHand is correctly adjusted.
- [ ] Confirm the StockItem QuantityOnOrder is correctly adjusted.
- [ ] Check for the creation of ReturnOrderDetail entries for returned stock items.
- [ ] Verify the process for handling unordered purchase cart items.
- [ ] Confirm the system checks if an order can be closed.

### Force Close:
- [ ] Confirm that orders can be forcibly closed with management decisions.
- [ ] Verify that reasons for force closures are documented.

### Form Display & Entry:
- [ ] Check that only one order can be processed at a time.
- [ ] Ensure correct display of Order PO id, Order Date, Vendor Name & Phone, and StockItem details.
- [ ] Verify entry fields for Received Quantity and Returned Quantity with reasons are functional.

### Unordered Purchase Items:
- [ ] Verify that receivers can identify and process items not on the original order.
- [ ] Confirm the functionality for adding and removing items to the unordered item cart.

### Command & Process Buttons:
- [ ] Check that the `View Order` button retrieves and displays order details.
- [ ] Confirm that the `Receive` button updates the displayed PO and adjusts stock quantities.
- [ ] Ensure that the `Force Close` button closes the order and requires a reason.
- [ ] Verify the functionality of `Insert` and `Remove` buttons for unordered items.

## Code Review
- [ ] Ensure that view models match the provided descriptions.
- [ ] Review the methods to verify they perform as expected.

## Additional Notes:
- [ ] Check for the presence of comments explaining modifications or choices made in the code.
- [ ] Confirm that the UI resembles the provided sample images.
