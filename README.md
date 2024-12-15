# Power state logger
Bash script for collecting power state data to check for power outages.

## Why It Was Created?

The Power State Logger was created to:

- **Check when the server lost power**: The main purpose of the logger is to check for power outages on the electricity grid.
- **Email notifications - to be developed**: Send email notifiactions to administrator when there is power loss.

## How to Run It?

1. **Create the Script**  
  ```bash
git clone
. bat_state.sh
```
or run in background
```bash
. bat_state.sh &
```
## How to check it?
   ```bash
cat power_events.log
```
## What next?

- **Add more logging events like battery percentage and remaining time**
- ** email notification **
