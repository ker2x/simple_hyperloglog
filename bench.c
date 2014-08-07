#include <string.h>
#include <inttypes.h>

#include "hll.h"

int main(int argc, char **argv)
{
	struct hll *h = hll_init();
	char test[3];
	int i;
	
	test[0] = rand() % 255;
	test[1] = rand() % 255;

	for(i =0; i < 1000000; i++) {
		test[2] = rand() % 255;
		hll_add(h, (uint8_t *)test, sizeof(char) * 3);
	}

	printf("Unique entries = %" PRIu64 "\n", hll_count(h));
	for(i =0; i < 1000000; i++) {
		hll_count(h);
	}
	return 0;
}
