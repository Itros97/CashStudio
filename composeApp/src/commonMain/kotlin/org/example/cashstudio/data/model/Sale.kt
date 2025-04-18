package org.example.cashstudio.data.model

data class Sale(
    val id: Long? = 0,
    val itemId: Long? = 0,
    val eventId: Long? = 0,
    val quantity: Int? = 0,
    val price: Double? = 0.0,
    val saleTimestamp: Long? = 0,
)