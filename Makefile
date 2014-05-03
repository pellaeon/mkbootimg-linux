#make for build mkbootimg
#create by sn 2012-5-23 21:14:18
CROSS_COMPILE =  #arm-linux-androideabi-
CC = $(CROSS_COMPILE)gcc
LD = $(CROSS_COMPILE)ld
AR = $(CROSS_COMPILE)ar
LDCFLAGES =
STATIC_LIB = libmincrypt.a
#MKBOOTIMG_TARGET = arm-mkbootimg
MKBOOTIMG_OBJ = mkbootimg.o
MKBOOTIMG_SRC = mkbootimg.c
LIBMINCRYPT_OBJ = sha.o rsa.o
SHA_SRC = sha.c
RSA_SRC = rsa.c
MKBOOTFS_OBJ = mkbootfs.o
MKBOOTFS_SRC = mkbootfs.c
all:mkbootimg
mkbootimg:$(MKBOOTIMG_OBJ);$(CC) -o $@ $< $(STATIC_LIB)

$(MKBOOTIMG_OBJ):$(MKBOOTIMG_SRC);$(CC) -c $<

lib:libmincrypt.a
libmincrypt.a:$(LIBMINCRYPT_OBJ);$(AR) -r $(STATIC_LIB) $(LIBMINCRYPT_OBJ)
sha.o:$(SHA_SRC);$(CC) -c -fPIC $<
rsa.o:$(RSA_SRC);$(CC) -c -fPIC $<

mkboot:mkbootfs
mkbootfs:$(MKBOOTFS_OBJ);$(CC) -o $@ $<
$(MKBOOTFS_OBJ):$(MKBOOTFS_SRC);$(CC) -c $<

clean:
	rm -f mkbootfs mkbootimg $(MKBOOTIMG_OBJ) $(LIBMINCRYPT_OBJ) $(MKBOOTFS_OBJ) 
