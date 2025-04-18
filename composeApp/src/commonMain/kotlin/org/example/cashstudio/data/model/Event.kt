package org.example.cashstudio.data.model

data class Event (
    val id: Int? = null,
    val name: String? = null,
    val description: String? = null,
    val startTimestamp: Long? = null,
    val endTimestamp: Long? = null,
    val type: String? = null,
)