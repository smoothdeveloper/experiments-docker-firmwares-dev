/*
* hello-module.c - Demonstrating the module_init() and module_exit() macros.
* This is preferred over using init_module() and cleanup_module().
*/
#include <linux/module.h> /* Needed by all modules */
#include <linux/kernel.h> /* Needed for KERN_INFO */
#include <linux/init.h> /* Needed for the macros */

static int __init hello_module_init(void)
{
printk(KERN_INFO "Hello, world module\n");
return 0;
}

static void __exit hello_module_exit(void)
{
printk(KERN_INFO "Goodbye, world\n");
}

module_init(hello_module_init);
module_exit(hello_module_exit);

