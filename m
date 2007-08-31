From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: VIA C3 'Ezra-T' [C5M] - longhaul - do nothing
Date: Fri, 31 Aug 2007 08:49:18 +0200
Message-ID: <46D7B9EE.2040607@interia.pl>
References: <9f90e8bf0708280759x6068ae15j9f24e654307a3037@mail.gmail.com>	
	<46D46CC2.6080405@interia.pl>	
	<9f90e8bf0708281314v28f29cb3o8e68a3b77701e656@mail.gmail.com>	
	<46D5000D.7010503@interia.pl>	
	<9f90e8bf0708290624m592290a0v6ae9d76b7d4d19a0@mail.gmail.com>	
	<46D5AE8F.2080209@interia.pl>	
	<9f90e8bf0708291135v289c3244xef7a2ac0187c32ea@mail.gmail.com>	
	<46D5C60D.8080809@interia.pl>	
	<9f90e8bf0708291240v4b816e9bvf29a103cf446b26e@mail.gmail.com>	
	<46D5D53D.8030902@interia.pl>
	<9f90e8bf0708291342h70cf50c2r979981d3e8faec8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <9f90e8bf0708291342h70cf50c2r979981d3e8faec8@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Herbert G. Fischer" <herbert.fischer@gmail.com>
Cc: cpufreq@lists.linux.org.uk

Thanks. Sorry for late reply.
>>> cpufreq-core: notification 1 of frequency transition to 399000 kHz
Good. ACPI C3 is working too.
>> Yes. It is working. Longhaul ver. 2 wasn't working probably because of the
>> same reason. Now I have to think how to deal with this situation. I have
>> Nehemiah with RevID = 0. Good. I have Ezra with RevID = 1 and voltage
>> scaling. Bad. I have to check if it is working with RevID = 0. Probably
>> not because VIA documentation advise to poke RevKey with RevID. But
>> I will read it again to refresh my memory.
Yup. Ezra isn't working with RevID = 0. 
> I'm sorry I cannot understand this in detail because I don't know how
> VIA LongHaul works internally, but I'm also C programmer and know
> something about the kernel (did a very small module for IBM RS6000
> once). Maybe I can help more, if needed. If so, could you send me some
> documentation (like the VIA ones)?
Sorry. I can't.
To avoid random frequency transitions VIA did bits 4..7 as the key. If You 
read it You will read 0xf. You have to set it to correct value or frequency 
change request will be ignored. This value should be in bits 0..3. It is 
0 for CPU without voltage scaling capability. It is 1 for CPU with voltage 
scaling. Your processor doesn't have voltage scaling, but it is reporting 
that it has. It needs key set to 0. I was so busy with adding voltage 
scaling (Longhaul ver. 2) and overclocking to longhaul that I failed to 
properly test it on other CPU's then Ezra and Nehemiah.

Patch below is IMO the best solution for this problem because it will be 
transparent to user. However You can still provide module options to override 
defaults.
I need to add some printk()'s and comments and test it more.

Let me know if it is working for You.
Thanks

---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |   27 +++++++++++++++++++++++++--
 1 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -76,6 +76,7 @@ static unsigned int longhaul_index;
 /* Module parameters */
 static int scale_voltage;
 static int disable_acpi_c3;
+static int revid_errata;
 
 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "longhaul", msg)
 
@@ -168,7 +169,10 @@ static void do_powersaver(int cx_address, unsigned int clock_ratio_index,
 
 	rdmsrl(MSR_VIA_LONGHAUL, longhaul.val);
 	/* Setup new frequency */
-	longhaul.bits.RevisionKey = longhaul.bits.RevisionID;
+	if (!revid_errata)
+		longhaul.bits.RevisionKey = longhaul.bits.RevisionID;
+	else
+		longhaul.bits.RevisionKey = 0;
 	longhaul.bits.SoftBusRatio = clock_ratio_index & 0xf;
 	longhaul.bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
 	/* Setup new voltage */
@@ -272,7 +276,7 @@ static void longhaul_setstate(unsigned int table_index)
 
 	dprintk ("Setting to FSB:%dMHz Mult:%d.%dx (%s)\n",
 			fsb, mult/10, mult%10, print_speed(speed/1000));
-
+retry_loop:
 	preempt_disable();
 	local_irq_save(flags);
 
@@ -344,6 +348,22 @@ static void longhaul_setstate(unsigned int table_index)
 	preempt_enable();
 
 	freqs.new = calc_speed(longhaul_get_cpu_mult());
+	/* Check if requested frequency is set */
+	if (unlikely(freqs.new != speed)) {
+		if (!revid_errata) {
+			revid_errata = 1;
+			msleep(200);
+			goto retry_loop;
+		}
+		if (longhaul_flags & USE_ACPI_C3) {
+			longhaul_flags &= ~USE_ACPI_C3;
+			if (revid_errata)
+				revid_errata = 0;
+			msleep(200);
+			goto retry_loop;
+		}
+		printk(KERN_INFO PFX "Failed to set requested frequency!\n");
+	}
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 
 	if (!bm_timeout)
@@ -962,6 +982,9 @@ MODULE_PARM_DESC(disable_acpi_c3, "Don't use ACPI C3 support");
 module_param (scale_voltage, int, 0644);
 MODULE_PARM_DESC(scale_voltage, "Scale voltage of processor");
 
+module_param (revid_errata, int, 0644);
+MODULE_PARM_DESC(revid_errata, "Ignore CPU Revision ID");
+
 MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>");
 MODULE_DESCRIPTION ("Longhaul driver for VIA Cyrix processors.");
 MODULE_LICENSE ("GPL");
-- 



----------------------------------------------------------------------
Zamiesc ogloszenie za darmo!
Kliknij >>> http://link.interia.pl/f1b7f
