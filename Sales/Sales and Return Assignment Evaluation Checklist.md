## Note: This document serves as a high-level overview and may not cover all rules or key features. Its purpose is to offer additional clarity for you and your team.  If you have any questions, please see your instructor.
---

# Student Assignment Evaluation Checklist for Sales and Returns

## Access & Authentication
- [ ] Check that the system requires users to log in.
- [ ] Verify that access is restricted to those in the SalesReturns Role.
- [ ] Confirm that sales and/or returns are handled by an Associate or Store Manager.
- [ ] Ensure the Employee's full name is displayed on the form.

## Sales
### In-Store Shopping
- [ ] Verify that customers can bring items to the counter.
- [ ] Check that employees can record items in a cart associated with their till.
#### Actions in the cart
- [ ] Confirm the functionality to add and remove items.
- [ ] Verify the ability to edit quantities.
- [ ] Check the refresh item subtotals feature.
- [ ] Ensure the cart is processed as a sale upon payment.
- [ ] Confirm the presence of a Cancel button.

### Business Rules
- [ ] Verify that only one cart per sale is allowed.
- [ ] Ensure there are no duplicate items in the cart.
- [ ] Check that item quantities can be changed in View Cart.
- [ ] Confirm that discontinued products are not displayed or added.
- [ ] Ensure that a quantity is specified when adding items.
- [ ] Confirm that added items go to the shopping cart.
- [ ] Verify that a confirmation message is shown after adding an item.
- [ ] [Optional] Confirm that the number of items in the cart is shown in View Cart.

### Checkout
#### View Cart Phase
- [ ] Verify that items in the cart are listed.
- [ ] Check the ability to change quantities or remove items.
- [ ] Confirm the functionality of the Continue Shopping button.
- [ ] Verify that the Checkout button leads to payment.
#### Place Order Phase
- [ ] Confirm that coupons can be entered and applied.
- [ ] Verify that different payment types are accepted.
- [ ] Check the display of Subtotal, GST, Discount, and Total.
- [ ] Ensure a complete server transaction is created on placing the order.
- [ ] Verify that no changes are allowed post-payment.

## Refunds/Returns
- [ ] Check that the original receipt is needed for returns.
- [ ] Confirm that a return reason is required for each item.
### Refunds Rules
- [ ] Verify that the original SaleID is needed for processing refunds.
- [ ] Check that successful refunds generate SalesRefund and SalesRefundDetail records.
- [ ] Ensure that individual and partial item refunds are allowed.
- [ ] Confirm that the refunded price equals the original sale price.
- [ ] Check that if a sale had a discount, it is applied to the refund.
- [ ] Confirm that refunds process as a single complete transaction.
- [ ] Verify that the Sale Refund number is displayed post-refund.
- [ ] Ensure refunds can't be edited once processed.
- [ ] Check that in-stock quantities are updated for refunds.
- [ ] Confirm that the Clear button clears the screen.

## Images (Samples)
- [ ] Review the Shopping Cart, Shopping, Sale Cart, Sale Checkout, and Sale Refund interfaces for accuracy and completeness.

## View Models
- [ ] Verify that the view models are correctly implemented as per the provided examples.
- [ ] Check for appropriate comments explaining any modifications or choices made in the code.

## Methods
- [ ] Confirm that the methods `GetCategories`, `GetItemsByCategoryID`, `SaveSales`, `GetSaleRefund`, and `SaveRefund` are functioning correctly.
- [ ] Verify that the methods handle data correctly and follow business logic.

