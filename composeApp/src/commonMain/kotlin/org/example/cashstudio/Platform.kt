package org.example.cashstudio

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform