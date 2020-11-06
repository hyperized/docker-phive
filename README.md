# Phive

Simple, multistage Alpine based phive.io container. Updated monthly

## Usage


## As single temporary container 
```bash
docker run \
  --interactive \
  --tty \
  --rm \
  --volume $(pwd):/repo \
  --workdir=/repo \
  hyperized/phive \
  phive install
  
# One-liner
docker run -it --rm -v $(pwd):/repo -w /repo hyperized/phive phive install
```

## As docker-compose service
```yaml
version: "3"
services:
  phive:
    image: hyperized/phive:latest
    restart: 'no'
    volumes:
      - ./:/repo
      - phive:/root/.phive
    working_dir: /repo
    entrypoint: ["phive"]
    
volumes:
  phive:
```

Run it as:
```bash
docker-compose run --rm phive install
```

**NOTE:** The volume `phive` stores the cached phar files that have been installed by PHIVE, so successive runs process faster.
