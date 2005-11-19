From: Mattia Dongili <malattia@linux.it>
Subject: Re: cpufreq on Coppermine
Date: Sat, 19 Nov 2005 20:29:10 +0100
Message-ID: <20051119192909.GA4190@inferi.kami.home>
References: <460afdfa0511171405i6df97535n807210617eb3ac0e@mail.gmail.com>
	<20051118154149.GA2104@poupinou.org>
	<460afdfa0511181139p40db432fm544e480f554e9a0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="z4+8/lEcDcG5Ke9S"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <460afdfa0511181139p40db432fm544e480f554e9a0@mail.gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk
Cc: Bruno Ducrot <ducrot@poupinou.org>


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 18, 2005 at 08:39:03PM +0100, Luca wrote:
> On 11/18/05, Bruno Ducrot <ducrot@poupinou.org> wrote:
> 
> > You could eventually try with
> > ftp://ftp.poupinou.org/dont_use/old/speedstep_bx.tar.gz
> >
> > I don't think it will work with a 2.6 kernel though, but just for
> > testing purpose...
> >
> > You have to explicitely replace line 42:
> > /* #define I_WANT_SPEEDSTEP */
> > with
> > #define I_WANT_SPEEDSTEP
> >
> > If that work, I will see if I found time to update cpufreq driver then.
> 
> pj@cristal:/usr/local/src/speedstep_bx$ sudo make
> gcc -D__KERNEL__ -O2 -Wall -Wstrict-prototypes -Wno-trigraphs
> -fomit-frame-pointer -fno-strict-aliasing -fno-common
> -I/lib/modules/`uname -r`/build/include -D_LINUX  -DMODULE
> -DMODVERSIONS -include /lib/modules/`uname
> -r`/build/include/linux/modversions.h -c -o speedstep.o speedstep.c
> cc1: error: /lib/modules/2.6.14p3.laptop.cfd/build/include/linux/modversions.h:
[...]
> 'NR_IRQ_VECTORS' undeclared here (not in a function)
> speedstep.c: In function 'speedstep_initialize':
> speedstep.c:491: warning: implicit declaration of function 'pci_find_subsys'
> speedstep.c:495: warning: assignment makes pointer from integer without a cast
> speedstep.c:502: warning: assignment makes pointer from integer without a cast
> make: *** [speedstep.o] Error 1
> pj@cristal:/usr/local/src/speedstep_bx$
> 
> I think don't work with 2.6 kernel...

just for the purpose to make it build you can apply the attached patch,
it uses an adapted (from LDD3) Makefile for 2.6 and changes from
pci_find_subsys to pci_get_subsys. Still, you need to define
I_WANT_SPEEDSTEP at line 42 as before.

-- 
mattia
:wq!

--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="speedstep_bx.diff"

diff -up speedstep_bx/Makefile speedstep_bx.dirty/Makefile
--- speedstep_bx/Makefile	2002-10-09 12:06:48.000000000 +0200
+++ speedstep_bx.dirty/Makefile	2005-11-19 20:20:32.587834750 +0100
@@ -1,16 +1,19 @@
-HKERNEL = /lib/modules/`uname -r`/build/include
-MODVERSCFLAGS = -DMODVERSIONS -include $(HKERNEL)/linux/modversions.h
-MODCFLAGS = -DMODULE $(MODVERSCFLAGS)
+# If KERNELRELEASE is defined, we've been invoked from the
+# kernel build system and can use its language.
+ifneq ($(KERNELRELEASE),)
+	obj-m := speedstep.o
 
-CFLAGS = -D__KERNEL__ -O2 -Wall -Wstrict-prototypes -Wno-trigraphs \
-	 -fomit-frame-pointer -fno-strict-aliasing -fno-common     \
-	 -I$(HKERNEL)						   \
-	 -D_LINUX  $(MODCFLAGS)
-	 
+# Otherwise we were called directly from the command
+# line; invoke the kernel build system.
+else
+	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
+	PWD := $(shell pwd)
+default:
+	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
+endif
 
-speedstep.o:	speedstep.c
-	gcc $(CFLAGS) -c -o speedstep.o speedstep.c
-
-.PHONY:		clean
-clean:		speedstep.o
-	rm -f speedstep.o
+clean:
+	rm -rf speedstep.o speedstep.ko speedstep.mod.c speedstep.mod.o \
+	      .speedstep.ko.cmd .speedstep.o.cmd .speedstep.mod.o.cmd \
+	      .tmp_versions
+	
diff -up speedstep_bx/speedstep.c speedstep_bx.dirty/speedstep.c
--- speedstep_bx/speedstep.c	2003-05-23 11:37:25.000000000 +0200
+++ speedstep_bx.dirty/speedstep.c	2005-11-19 20:11:47.503019000 +0100
@@ -488,14 +488,14 @@ speedstep_initialize(void)
 	int             mult, mult2;
 	int             low, high;
 
-	speedstep_chipset_dev = pci_find_subsys(PCI_VENDOR_ID_INTEL,
+	speedstep_chipset_dev = pci_get_subsys(PCI_VENDOR_ID_INTEL,
 					      PCI_DEVICE_ID_INTEL_82371AB_3,
 						PCI_ANY_ID,
 						PCI_ANY_ID,
 						NULL);
 
 	if (!speedstep_chipset_dev)
-		speedstep_chipset_dev = pci_find_subsys(PCI_VENDOR_ID_INTEL,
+		speedstep_chipset_dev = pci_get_subsys(PCI_VENDOR_ID_INTEL,
 					        PCI_DEVICE_ID_INTEL_82443MX_3,
 						PCI_ANY_ID,
 						PCI_ANY_ID,

--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--z4+8/lEcDcG5Ke9S--

