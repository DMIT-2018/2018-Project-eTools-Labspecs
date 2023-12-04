# Rental Sub-System

> Name: **STUDENT_NAME**

| Mark | Weight |Area |
|:----:|:----:|:-----|
| **`TBA`**|5 | Project Setup |
| **`TBA`**|2 | DISPLAYING – FILTER SEARCH FOR CUSTOMER |
| **`TBA`**|1 | DISPLAYING - RENTAL EQUIPMENT |
| **`TBA`**|4 | DISPLAYING/PROCESSING – ADD/REMOVE EQUIPMENT TO/FROM RENTAL |
| **`TBA`**|4 | PROCESSING – RENT EQUIPMENT |
| **`TBA`**|1 | DISPLAYING - CANCEL RENTAL REQUEST |
| **`TBA`**|2 | DISPLAYING – FILTER SEARCH RENTAL/PHONE FOR RETURN  |
| **`TBA`**|1 | DISPLAYING – RENTAL DETAILS |
| **`TBA`**|2 | DISPLAYING – CALCULATE CHARGES |
| **`TBA`**|5 | PROCESSING – RETURN RENTAL EQUIPMENT |
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

- **`TBA`**/2 - DISPLAYING – FILTER SEARCH FOR CUSTOMER
  - **UI**
    - [ ]  Display list of customers for query value
    - [ ]  Display selected customer information
  - **BLL**
    - [ ]  Get customer list for value
    - [ ]  Get customer information for selected customer
- **`TBA`**/1 - DISPLAYING – RENTAL EQUIPMENT
  - **UI**
    - [ ]  Display list of available rental equipment
    - [ ]  Use paging on display
  - **BLL**
    - [ ]  Get available rental equipment records for display
    - [ ]  Display list should not include items already in rental list
- **`TBA`**/4 - DISPLAYING/PROCESSING – ADD/REMOVE EQUIPMENT TO/FROM RENTAL |
  - **UI**
    - [ ] Add - Add rental equipment to rental list
    - [ ] Remove - Remove equipment from rental list
    - [ ] Refresh available rental equipment list
  - **BLL**
    - [ ]  Get available rental equipment records for display
    - [ ] Does **not** alter tables
- **`TBA`**/4 - PROCESSING – RENT EQUIPMENT
  - **UI**
    - [ ] Check entered Coupon for validate status
    - [ ] Submit rental request list for processing
  - **BLL**
	- [ ] Validation –
      - [ ] Equipment available to be rented
      - [ ] Rental request has at least one piece of equipment
    - [ ] SINGLE TRANSACTION!
      - [ ] Create a Rental record with appropriate data
      - [ ] Create a RentalDetail record with appropriate data for each item
      - [ ] Update RentalEquipment, flag not available
- **`TBA`**/1 - DISPLAYING – CANCEL
  - **UI**
    - [ ]  Reset display to new rental condition
- **`TBA`**/2 - FILTER SEARCH RENTAL/PHONE FOR RETURN
  - **UI**
    - [ ]  Display list of rentals for query value
    - [ ]  Display selected rental customer information and rental out date
  - **BLL**
    - [ ]  Get rental list for value
    - [ ]  Get customer and reantl date information for selected rental
- **`TBA`**/1 - DISPLAYING – RENTAL DETAILS
  - **UI**
    - [ ]  Display list of rental equipment details
   - **BLL**
    - [ ]  Get rental details for display
- **`TBA`**/2 - DISPLAYING – CALCULATE CHARGES |
  - **UI**
    - [ ] Calculate charges based on length of rental
    - [ ] Validate: rental length must be in half days, not less then 1 half day
    - [ ] Refresh totals display
  - **BLL**
    - [ ] Does **not** alter tables  
- **`TBA`**/4 - PROCESSING – RETURN EQUIPMENT
  - **UI**
    - [ ] Submit rental request list for processing
  - **BLL**
	- [ ] Validation –
      - [ ] Payment type, length of rental
      - [ ] Rental return has at least one piece of equipment
    - [ ] SINGLE TRANSACTION!
      - [ ] Update a Rental record with appropriate data
      - [ ] Update a RentalDetail record with appropriate data for each item
      - [ ] Update RentalEquipment, set available flag depending on return condition, update current condition

*Back to the [Part 3 Marking](./ReadMe.md)*
