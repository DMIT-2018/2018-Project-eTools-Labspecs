# Receiving Sub-System

> Name: **STUDENT_NAME**

| Mark | Weight | Area |
|:----:|:----:|:-----|
| **`TBA`**|5 | Project Setup |
| **`TBA`**|1 | DISPLAYING – PURCHASE ORDERS TO BE RECEIVED |
| **`TBA`**|3 | DISPLAYING – SELECT ORDER FOR PROCESSING |
| **`TBA`**|3 | DISPLAYING – UNORDERED PRODUCTS |
| **`TBA`**|5 | PROCESSING – FORCED CLOSURE |
| **`TBA`**|10 (2 * 5) | PROCESSING – RECEIVE ORDER W. RETURNS |
| **`TBA`**|**27** | **TOTAL** |

----

### Marking Rubric

| Weight | Breakdown |
| ----   | --------- |
| **1** | 1 = Proficient (requirement is met)<br />0 = Incomplete (requirement not met, missing large portions) |
| **2** | 2 = Proficient (requirement is met)<br />1 = Limited (requirement is poorly met, minor errors, missing component)<br />0 = Incomplete (requirement not met, missing large portions) |
| **3** | 3 = Proficient (requirement is met)<br />2 = Capable (requirement is adequately met, minor errors, missing component)<br />1 = Limited (requirement is poorly met, major errors)<br />0 = Incomplete (requirement not met, missing large portions) |
| **4** | 4 = Proficient (requirement is met)<br />3 = Capable (requirement is adequately met, minor errors, missing component)<br />2 = Satisfactory (requirement is partially met, minor errors, missing component)<br />1 = Limited (requirement is poorly met, major errors)<br />0 = Incomplete (requirement not met, missing large portions) |
| **5** | 5 = Proficient (requirement is met)<br />4 = Capable (requirement is adequately met, minor errors, missing component)<br />3 = Acceptable (requirement is partially met, minor errors, missing component)<br />2 = Satisfactory (requirement is partially met, errors, missing component)<br />1 = Limited (requirement is poorly met, major errors)<br />0 = Incomplete (requirement not met, missing large portions) |

----

## Area Checklist

> **Note:** Additional notes/deductions may be added for unusual/problematic implementations.

- **`TBA`**/1 - DISPLAYING – PURCHASE ORDERS TO BE RECEIVED
  - **UI**
    - [ ] Outstanding Order View displays requested data
  - **BLL**
    - [ ] Get Order List of only outstanding placed orders
- **`TBA`**/3 - DISPLAYING – SELECT ORDER FOR PROCESSING
  - **UI**
    - [ ] Display Vendor information
    - [ ] Display existing outstanding order
    - [ ] Values correct
  - **BLL**
    - [ ] Obtains Outstanding Order
    - [ ] Outstanding quantities correctly calculated
    - [ ] OrderDetail quantities correct
    - [ ] Empty UnOrderedItems database table
- **`TBA`**/3 - DISPLAYING – UNORDERED PRODUCTS
  - **UI**
    - [ ] List/Add/Remove UI
  - **BLL**
    - [ ] Add an unordered stockitem
    - [ ] Remove an unordered stockitem
- **`TBA`**/5 - PROCESSING – FORCED CLOSURE
  - **UI**
    - [ ] Refresh view after receiving
    - [ ] Outstanding order list refreshed
    - [ ] User is prompted for confirmation
  - **BLL**
    - [ ] SINGLE TRANSACTION!
    - [ ] Validation reason exists
    - [ ] PurcHaseOrders – Update
      - [ ] .Closed = true
      - [ ] .Notes = reason
    - [ ] StockItems – Update
      - [ ] .QuantityOnOrder -= outstanding quantity values correct
- **`TBA`**/10 - PROCESSING – RECEIVE ORDER W. RETURNS
  - **UI**
    - [ ] Refresh view after receiving with any adjustments for stockitems received
    - [ ] Single call to BLL with
      - [ ] PurchaseOrder number submitted
      - [ ] All Order details submitted that need processing
    - [ ] Outstanding order list refreshed (in case order was closed)
  - **BLL**
    - [ ] SINGLE TRANSACTION!
    - [ ] Validation
      - [ ] Minimum one item from order list or minimum one unordered item to process
      - [ ] Values validated
      - [ ] Returns have a reason
      – [ ] cannot receive more items than order outstanding quantity 
      - [ ] returned items must have a reason
    - [ ] ReceiveOrders – new record
    - [ ] ReceiveOrderDetails – new record for each item for which stockitem has been received
    - [ ] ReturnedOrderDetails – new record for each item for which stockitem has been returned
    - [ ] Unordered Items – new ReturnedOrderDetail for each unorder item
    - [ ] Stockitems – Update
      - [ ] .QuantityOnHand += details quantity
      - [ ] .QuantityOnOrder -= details quantity
    - [ ] PurchaseOrders – Update to closed if all stockitems have been received for the order

*Back to the [Part 3 Marking](./ReadMe.md)*
