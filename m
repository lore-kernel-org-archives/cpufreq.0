From: "Ralf Meyer" <ranfyy@gmail.com>
Subject: Re: Mobile Celeron
Date: Tue, 13 Mar 2007 20:47:00 +0100
Message-ID: <50df9eb80703131247s3e618640y6f0c74e76c11d5e3@mail.gmail.com>
References: <50df9eb80703121320k182b0aa9x8fd7c6c7969384d7@mail.gmail.com>
	<20070313013801.GA5364@tatooine.rebelbase.local>
	<50df9eb80703131114wcff0a56g1d93499531eee9a@mail.gmail.com>
	<20070313190121.GD27471@redhat.com>
	<50df9eb80703131233u6b1a3c87r5a759cdf8e89c097@mail.gmail.com>
	<20070313194200.GB10653@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=XpSTGK9kKviXzP7K8Lcs/gPPaW6EO2wfPbEgSsyDVvvKfYk8pocfuKQScI8bJKPyjXXopovXYkI4zqX6F97Fc9Em6iAj+H0dx/PA0CmvzwYZpw0ojkB91TuDbLQ8fJRX4cTjRYf7V2zg6Vng2RHWWivnEcjMlgC8cnEXQPwfKV0=
In-Reply-To: <20070313194200.GB10653@redhat.com>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

On 3/13/07, Dave Jones <davej@redhat.com> wrote:
> On Tue, Mar 13, 2007 at 08:33:52PM +0100, Ralf Meyer wrote:
>  > On 3/13/07, Dave Jones <davej@redhat.com> wrote:
>  >
>  > > I don't recall any celerons having frequency scaling.
>  >
>  > That's what I read all over the place by goo^W$searchengine_ing around.
>  >
>  > The funny thing thing is there is something called
>  > "Intel830.PDK.V5.1.1Gold" from Intel which contains some small patches
>  > to speedstep-smi and speedstep-lib which mention "Mobile Celeron" in
>  > the comments. I's against a 2.6.10. But quite small.
>
> Not heard of this. Post the diff ?
> Might be something useful in it.

No problem:
---
diff -urN linux-2.6.10/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
linux-2.6.10-8xx/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
--- linux-2.6.10/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-12-25
05:33:48.000000000 +0800
+++ linux-2.6.10-8xx/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2005-08-26
10:24:23.000000000 +0800
@@ -53,6 +53,7 @@


 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER,
"speedstep-ich", msg)
+//#define dprintk(msg...) printk("speedstep-ich " msg)


 /**
@@ -171,6 +172,16 @@
 		return 4; /* 4-M */

 	speedstep_chipset_dev = pci_get_subsys(PCI_VENDOR_ID_INTEL,
+			      PCI_DEVICE_ID_INTEL_82801DB_5,
+			      PCI_ANY_ID,
+			      PCI_ANY_ID,
+			      NULL);
+	if (speedstep_chipset_dev)
+	{
+		return 4; /* 4-M */
+	}
+
+	speedstep_chipset_dev = pci_get_subsys(PCI_VENDOR_ID_INTEL,
 			      PCI_DEVICE_ID_INTEL_82801CA_12,
 			      PCI_ANY_ID,
 			      PCI_ANY_ID,
diff -urN linux-2.6.10/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
linux-2.6.10-8xx/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
--- linux-2.6.10/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-12-25
05:35:27.000000000 +0800
+++ linux-2.6.10-8xx/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2005-08-26
10:24:56.000000000 +0800
@@ -20,6 +20,7 @@
 #include "speedstep-lib.h"

 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER,
"speedstep-lib", msg)
+//#define dprintk(msg...) printk("speedstep-lib " msg)

 #ifdef CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK
 static int relaxed_check = 0;
@@ -53,6 +54,7 @@
 		{ 85, 0x26 },
 		{ 90, 0x20 },
 		{ 100, 0x2b },
+		{ 95, 0x24 },  // Workaround
 		{ 0, 0xff }     /* error or unknown value */
 	};

@@ -79,6 +81,7 @@
 	/* decode the FSB */
 	msr_tmp &= 0x00c0000;
 	msr_tmp >>= 18;
+	dprintk("msr_tmp=0x%x\n", msr_tmp);
 	while (msr_tmp != msr_decode_fsb[i].bitmap) {
 		if (msr_decode_fsb[i].bitmap == 0xff)
 			return 0;
@@ -92,12 +95,17 @@
 	} else
 		msr_lo &= 0x0bc00000;
 	msr_lo >>= 22;
+	dprintk("msr_lo=0x%x\n", msr_lo);
 	while (msr_lo != msr_decode_mult[j].bitmap) {
 		if (msr_decode_mult[j].bitmap == 0xff)
+		{
+			dprintk("not found\n");
 			return 0;
+		}
 		j++;
 	}

+	dprintk("ratio=%d, fsb=%d\n", msr_decode_mult[j].ratio,
msr_decode_fsb[i].value);
 	dprintk("speed is %u\n", (msr_decode_mult[j].ratio *
msr_decode_fsb[i].value * 100));

 	return (msr_decode_mult[j].ratio * msr_decode_fsb[i].value * 100);
@@ -199,6 +207,12 @@

 	dprintk("x86: %x, model: %x\n", c->x86, c->x86_model);

+	// workaround for Celeron-M
+	if (c->x86 == 6 && c->x86_model == 9) {
+		dprintk("Pentium-M/Celeron-M processor detected\n");
+		return SPEEDSTEP_PROCESSOR_PM;
+	}
+
 	if ((c->x86_vendor != X86_VENDOR_INTEL) ||
 	    ((c->x86 != 6) && (c->x86 != 0xF)))
 		return 0;
@@ -268,6 +282,12 @@

 		ebx &= 0x000000FF;

+		// Workaround for Mobile Celeron
+		if (ebx == 7)
+		{
+			dprintk("Mobile Celeron\n");
+			return SPEEDSTEP_PROCESSOR_PIII_T;
+		}
 		if (ebx != 0x06)
 			return 0;

@@ -341,6 +361,7 @@
 	set_state(SPEEDSTEP_LOW);
 	*low_speed = speedstep_get_processor_frequency(processor);
 	if (!*low_speed) {
+		dprintk("set to low speed failed!\n");
 		ret = -EIO;
 		goto out;
 	}
@@ -351,6 +372,7 @@
 	set_state(SPEEDSTEP_HIGH);
 	*high_speed = speedstep_get_processor_frequency(processor);
 	if (!*high_speed) {
+		dprintk("set to high speed failed!\n");
 		ret = -EIO;
 		goto out;
 	}
@@ -358,7 +380,9 @@
 	dprintk("high seped is %u\n", *high_speed);

 	if (*low_speed == *high_speed) {
-		ret = -ENODEV;
+		dprintk("low speed is same as high speed?\n");
+		/* Workaround for celeron-M */
+		//ret = -ENODEV;
 		goto out;
 	}
---
