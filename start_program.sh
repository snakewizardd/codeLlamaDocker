./main -m ./models/codellama-ggml-model-q4_0.bin \
-n 1024 \
--n-predict 1024 \
-c 2048 \
--ctx-size 2048 \
--keep -1 \
--temp 1.0 \
--repeat-penalty 1.1 \
--repeat-last-n -1 \
--color -i -r "User:" \
--top-k 45 \
--top-p .95 \
--tfs 1.0 \
--typical 1 \
--mirostat 2 \
--mirostat-lr .5 \
--mirostat-ent 5.0 \
--batch-size 512 \
--interactive-first \
-t 6 \
-f ./prompts/cool.txt