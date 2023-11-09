## Note: This document serves as a high-level overview and may not cover all rules or key features. Its purpose is to offer additional clarity for you and your team.  If you have any questions, please see your instructor.
---

# Student Assignment Evaluation Checklist

## Purchase Orders (PO)
- [ ] Each vendor has at most one "currently open" purchase order.
- [ ] An open PO is identified by a NULL OrderDate.
- [ ] Purchases are made to specific vendors.

## Suggested Purchase Order
- [ ] Generated when there's no active order for the vendor.
- [ ] The system compares inventory reorder levels to on-hand quantities and unreceived PO quantities.
- [ ] Managers can add, adjust, or remove items from the suggested order.
- [ ] Clicking the Update button activates the order for the vendor.

## Current Active Order
- [ ] Managers can modify the order: add items, adjust quantities/prices, or remove items.
- [ ] Identified by a lack of an OrderDate.

## Placed Order
- [ ] The order is finalized when the manager is satisfied.
- [ ] Once placed, the OrderDate is set, and the order cannot be modified.
- [ ] The StockItems's QuantityOnOrder will be updated.

## Form Display & Interaction
- [ ] Display a dropdown for vendor selection, with [Select a Vendor] as the default.
- [ ] Vendor-related actions work as expected:
  - [ ] Generate a new suggested order.
  - [ ] Retrieve and display the active order.
- [ ] Items qualify for ordering when ReorderLevel - (QuantityOnHand + QuantityOnOrder) > 0.
- [ ] The current order remains open until the order is placed.
- [ ] Vendor details should be displayed.

## Command Buttons
- [ ] Remove Item: Deletes an item from the PO display.
- [ ] Refresh Item: Updates item details on the PO display.
- [ ] Add to Order: Adds an item to the PO. Each item appears only once.

## Process Buttons
- [ ] Update Order: Activates a suggested order.
- [ ] Place Order: Finalizes and places the order, updating relevant quantities.
- [ ] Delete Order: Removes an open order (placed orders cannot be deleted).
- [ ] Clear: Resets the order form.

## Code Review and Best Practices
- [ ] Models match the described views and contain the required properties.
- [ ] Correct use of data types and naming conventions.
- [ ] Methods perform the correct actions and return the appropriate types.
- [ ] Comments are clear and accurate.
- [ ] Modifications are justified and correctly implemented.

## Additional Considerations
- [ ] Application handles edge cases correctly.
- [ ] Application handles exceptions and errors gracefully.
- [ ] UI/UX is intuitive and matches the described functionality.
