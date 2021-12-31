all: build

build: setup.sh home.nix
	sh setup.sh
	home-manager -f ./home.nix build

switch: build
	./result/activate
