docker build -t climage .
docker run --name clcontainer -v ./CodeLlama-7b:/home/llama.cpp_dir/models -p 7681:7681 -it climage
