package com.example.mrfarmergrocer2

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.ImageButton

class AdminCategoryActivity : AppCompatActivity() {
    private lateinit var chicken: ImageButton
    private lateinit var egg: ImageButton
    private lateinit var vegetables: ImageButton
    private lateinit var fish: ImageButton
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_admin_category)

        chicken = findViewById(R.id.chicken)
        egg = findViewById(R.id.egg)
        vegetables = findViewById(R.id.vegetables)
        fish = findViewById(R.id.fish)

        chicken.setOnClickListener(View.OnClickListener {
            val intent = Intent(this, AdminAddNewProductActivity::class.java)
            intent.putExtra("category", "chicken")
            startActivity(intent)
        })

        egg.setOnClickListener(View.OnClickListener {
            val intent = Intent(this, AdminAddNewProductActivity::class.java)
            intent.putExtra("category", "egg")
            startActivity(intent)
        })

        vegetables.setOnClickListener(View.OnClickListener {
            val intent = Intent(this, AdminAddNewProductActivity::class.java)
            intent.putExtra("category", "vegetables")
            startActivity(intent)
        })

        fish.setOnClickListener(View.OnClickListener {
            val intent = Intent(this, AdminAddNewProductActivity::class.java)
            intent.putExtra("category", "fish")
            startActivity(intent)
        })
    }
}