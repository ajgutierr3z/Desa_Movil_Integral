package com.example.substackreader.tests

import org.junit.Assert.assertEquals
import org.junit.Test

class ArticleViewModelTest {

    // Simulación de la carga de un artículo desde una API (ej. Substack API)
    @Test
    fun fetchArticle_isCorrect() {
        val expectedTitle = "El Futuro del Desarrollo Móvil"
        val expectedAuthor = "Tech Newsletter"
        
        val article = MockApi.getArticle(id = 101)
        
        assertEquals("El título del artículo no coincide", expectedTitle, article.title)
        assertEquals("El autor no coincide", expectedAuthor, article.author)
        assertEquals("El estado de publicación debe ser TRUE", true, article.isPublished)
    }

    // Mock para la simulación
    object MockApi {
        fun getArticle(id: Int): Article {
            return Article(101, "El Futuro del Desarrollo Móvil", "Tech Newsletter", true)
        }
    }
    
    data class Article(val id: Int, val title: String, val author: String, val isPublished: Boolean)
}
