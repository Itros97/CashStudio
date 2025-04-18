package org.example.cashstudio.data.model

data class Item (
    val id: Long? = 0,
    val userId: Long? = 0,
    val name: String? = null,
    val description: String? = null,
    val category: ItemCategory? = null,
    val currentStock: Int? = 0,
    val unitarySalePrice: Double? = 0.0, //What is the selling price?
    val unitaryCostPrice: Double? = 0.0, //How much did it cost to buy/print the item?
    val unitaryBenefit: Double? = 0.0, //How much do I earn for each item sold?
)

