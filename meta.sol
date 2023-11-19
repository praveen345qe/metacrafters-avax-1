// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AgricultureContract {
    uint public totalHarvest;
    uint public costPerPlant;
    uint public totalCost;

    event CropPlanted(uint indexed quantity);
    event TemperatureMonitored(uint indexed temperature);
    event TotalCostCalculated(uint totalCost);

    // Function using require statement to ensure valid crop quantity
    function plantCrop(uint quantity) public {
        require(quantity > 0, "Quantity must be greater than 0");
        totalHarvest += quantity;
        emit CropPlanted(quantity);
    }

    // Function using assert statement to ensure valid temperature range
    function monitorTemperature(uint temperature) public {
        assert(temperature >= 10 && temperature <= 40);
        // Perform temperature-related tasks for agriculture
        emit TemperatureMonitored(temperature);
    }

    // Function to calculate the total cost of planted crops
    function calculateTotalCost() public {
        require(totalHarvest > 0, "No crops planted yet. Plant crops before calculating cost");

        // Assume a cost of 1 unit per plant for simplicity
        costPerPlant = 1;
        totalCost = totalHarvest * costPerPlant;

        emit TotalCostCalculated(totalCost);
    }
}
