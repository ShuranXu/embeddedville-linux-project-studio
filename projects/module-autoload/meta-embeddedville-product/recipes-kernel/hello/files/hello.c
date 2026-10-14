#include <linux/init.h>
#include <linux/module.h>

static int __init embeddedville_hello_init(void)
{
    pr_info("embeddedville_hello: loaded\n");
    return 0;
}

static void __exit embeddedville_hello_exit(void)
{
    pr_info("embeddedville_hello: unloaded\n");
}

module_init(embeddedville_hello_init);
module_exit(embeddedville_hello_exit);
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("EmbeddedVille learner starter module");
