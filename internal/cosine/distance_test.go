package cosine

import (
	"math"
	"math/rand/v2"
	"testing"

	"github.com/stretchr/testify/assert"
)

/*
cpu: 13th Gen Intel(R) Core(TM) i7-13700K
BenchmarkCosine/std-24         	19490612	        66.05 ns/op	       0 B/op	       0 allocs/op
BenchmarkCosine/our-24         	67442631	        17.83 ns/op	       0 B/op	       0 allocs/op
*/
func BenchmarkCosine(b *testing.B) {
	x := randVec()
	y := randVec()

	b.Run("std", func(b *testing.B) {
		b.ResetTimer()
		for i := 0; i < b.N; i++ {
			cosine(x, y)
		}
	})

	b.Run("our", func(b *testing.B) {
		b.ResetTimer()
		for i := 0; i < b.N; i++ {
			CosineDistance(x, y)
		}
	})
}

func TestCosine(t *testing.T) {
	for i := 0; i < 100; i++ {
		x := randVec()
		y := randVec()

		expect := cosine(x, y)
		actual := CosineDistance(x, y)
		assert.InDelta(t, expect, actual, 1e-4, "expected %v, got %v", expect, actual)
	}
}

// cosine computes the cosine similarity between two vectors. Higher values
// indicate more similar vectors.
func cosine(a, b []float32) float64 {
	if len(a) != len(b) {
		panic("vectors must be of equal length")
	}

	dp, an, bn := float64(0), float64(0), float64(0)
	for i := range a {
		dp += float64(a[i] * b[i])
		an += float64(a[i] * a[i])
		bn += float64(b[i] * b[i])
	}

	return dp / (math.Sqrt(an) * math.Sqrt(bn))
}

func randVec() []float32 {
	v := make([]float32, 384)
	for i := range v {
		v[i] = rand.Float32()
	}
	return v
}
