#!/bin/sh

pushd jbig2dec
cc  -I . -Wall -fPIC -shared -o ../libjbig2codec.so ../caj2pdf/lib/decode_jbig2data_x.cc \
    jbig2.c jbig2_arith.c jbig2_arith_int.c jbig2_arith_iaid.c jbig2_huffman.c jbig2_hufftab.c jbig2_segment.c \
    jbig2_page.c jbig2_symbol_dict.c jbig2_text.c jbig2_generic.c jbig2_refinement.c jbig2_mmr.c jbig2_halftone.c jbig2_image.c
popd

pushd caj2pdf/lib
cc -Wall -fPIC --shared -o ../../libjbigdec.so jbigdec.cc JBigDecode.cc
popd
