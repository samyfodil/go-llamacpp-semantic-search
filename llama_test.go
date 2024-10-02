package llm

import (
	"path/filepath"
	"strings"
	"testing"

	"github.com/stretchr/testify/assert"
)

/*
BenchmarkLLM/encode-24		444	   2708159 ns/op	18.00 tok/s		2024 B/op		11 allocs/op
*/
func BenchmarkLLM(b *testing.B) {
	llm := loadModel()
	defer llm.Close()

	text := "This is a test sentence we are going to generate embeddings for."
	b.Run("encode", func(b *testing.B) {
		ctx := llm.Context(0)
		for i := 0; i < b.N; i++ {
			_, err := ctx.EmbedText(text)
			assert.NoError(b, err)
		}

		b.ReportMetric(float64(ctx.Tokens())/float64(b.N), "tok/s")
	})
}

func loadModel() *Model {
	mod, _ := filepath.Abs("dist/MiniLM-L6-v2.Q4_K_M.gguf")
	//mod, _ := filepath.Abs("dist/Llama-3.2-1B-Instruct-Q6_K_L.gguf")
	ctx, err := New(mod, 512)
	if err != nil {
		panic(err)
	}
	return ctx
}

func TestEmbedText(t *testing.T) {
	llm := loadModel()
	defer llm.Close()

	var sb strings.Builder
	for i := 0; i < 10; i++ {
		sb.WriteString("This is a test sentence we are going to generate embeddings for.\n")
	}

	out, err := llm.EmbedText(sb.String())
	assert.NoError(t, err)
	assert.NotZero(t, len(out))
}
