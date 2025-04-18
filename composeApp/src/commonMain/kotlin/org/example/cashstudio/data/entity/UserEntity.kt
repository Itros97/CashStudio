package org.example.cashstudio.data.entity

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "user")
data class UserEntity (
    @PrimaryKey (autoGenerate = true) var id : Int,
    @ColumnInfo (name = "name") var name: String,
    @ColumnInfo (name = "email") var email: String
)


