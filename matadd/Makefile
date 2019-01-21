SRCS	= main.c datatools.c matadd.c
OBJS	= $(SRCS:.c=.o)
TARGET	= madd.suncc

CC	= suncc
INCS	= 
DBG	= -g
OPT	= -fast -xrestrict -xautopar -xreduction -xloopinfo
PARA	= 
CFLAGS	= $(DBG) $(OPT) $(PARA) $(XOPTS)

LIBS	= -L /usr/lib64/atlas -lsatlas 

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LIBS)

clean:
	@/bin/rm -f $(OBJS) *~ core*

realclean: clean
	@/bin/rm -f $(TARGET)
