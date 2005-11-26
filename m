From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH] transition latency of speedstep-ich (third try)
Date: Sat, 26 Nov 2005 23:40:20 +0100
Message-ID: <4388E454.6050304@tremplin-utc.net>
References: <88056F38E9E48644A0F562A38C64FB6005EB231C@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060900090103040101040107"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6005EB231C@scsmsx403.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: davej@redhat.com, Dominik Brodowski <linux@dominikbrodowski.net>, cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.
--------------060900090103040101040107
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

05.10.2005 22:39, Pallipadi, Venkatesh wrote/a =E9crit:
>>-----Original Message-----
>>From: Eric Piel [mailto:Eric.Piel@tremplin-utc.net]=20
>>Sent: Thursday, September 29, 2005 3:06 PM
>>
>>>>As it's very different from the numbers you got, I wonder if=20
>>
>>I mistook=20
>>
>>>>somewhere ?
>>>>
>>>
>>>
>>>I don't have any numbers with Coppermine or P4-M. Probably the reason
>>>For low numbers is TSC itself stops at certain times during=20
>>
>>this whole
>>
>>>Operation. And it will also run at slower frequency once you=20
>>
>>change the
>>
>>>Freq (On coppermine). 6uS is too low in my opinion. We may not be=20
>>>measuring correctly here.
>>
>>Could it happen that on a P4M the TSC doesn't stop? Then maybe someone=20
>>with such a harware could try? Otherwise, what do you suggest=20
>>to obtain=20
>>the maximum transition latency? Take 500uS and multiply by the=20
>>number of=20
>>I/O in the code ?
>>
>>Eric
>>
>=20
>=20
> Do you have ACPI PM timer on your system? May be we can measure the=20
> latency using that.=20
>=20
Hello,

Sorry for the looonnnggg delay of the reply. I've finally found time to=20
hunt for the PM timer on my computer, found it, and kludged=20
speedstep-ich to read it :-) For verification and completeness, the=20
patch is attached. (the PM timer address is hard-coded, it has to be=20
changed before running it on another system, it's indicated at boot in=20
dmesg).

So the results are quite interesting and confirm your expectations,=20
Venki. After few hours with the ondemand governor, I checked the logs=20
and the transition latency seems very stable: around 735 to 742 PM timer=20
ticks (~206 us). So indeed, 100us of transition latency was quite=20
under-estimating it!

Now back to the original problem, from those measurements, which time=20
should we put as the maximal transition latency for speedstep-ich? Do=20
you think we can simply put something like 300us and that's it? Maybe we=20
could distinguish between PIII and P4 ? It would require someone to=20
rerun the measurement on a P4 hardware. Do we need to take into account=20
as a parameter the CPU frequency?

Hoping we can finally get the ondemand governor working with speedstep-ich!

Eric

--------------060900090103040101040107
Content-Type: text/x-patch;
	name="speedstep-ich-measure-transition-2.6.14.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="speedstep-ich-measure-transition-2.6.14.patch"

--- linux-2.6.14.bak/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2005-11-06 14:50:34.000000000 +0100
+++ linux-2.6.14/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2005-11-26 22:26:28.000000000 +0100
@@ -55,6 +55,32 @@ static struct cpufreq_frequency_table sp
 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "speedstep-ich", msg)
 
 
+/* from timer_pm.c */
+u32 pmtmr_ioport =  0x1008; // from dmesg , to avoid having to export it
+
+#define ACPI_PM_MASK 0xFFFFFF /* limit it to 24 bits */
+
+/*helper function to safely read acpi pm timesource*/
+static inline u32 read_pmtmr(void)
+{
+	u32 v1=0,v2=0,v3=0;
+	/* It has been reported that because of various broken
+	 * chipsets (ICH4, PIIX4 and PIIX4E) where the ACPI PM time
+	 * source is not latched, so you must read it multiple
+	 * times to insure a safe value is read.
+	 */
+	do {
+		v1 = inl(pmtmr_ioport);
+		v2 = inl(pmtmr_ioport);
+		v3 = inl(pmtmr_ioport);
+	} while ((v1 > v2 && v1 < v3) || (v2 > v3 && v2 < v1)
+			|| (v3 > v1 && v3 < v2));
+
+	/* mask the output to 24 bits */
+	return v2 & ACPI_PM_MASK;
+}
+
+
 /**
  * speedstep_set_state - set the SpeedStep state
  * @state: new processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
@@ -67,6 +93,8 @@ static void speedstep_set_state (unsigne
 	u8 pm2_blk;
 	u8 value;
 	unsigned long flags;
+	unsigned long long tsc1, tsc2;
+	u32 pmt1, pmt2;
 
 	if (!speedstep_chipset_dev || (state > 0x1))
 		return;
@@ -87,6 +115,9 @@ static void speedstep_set_state (unsigne
 	/* Disable IRQs */
 	local_irq_save(flags);
 
+	rdtscll(tsc1);
+	pmt1 = read_pmtmr();
+	
 	/* read state */
 	value = inb(pmbase + 0x50);
 
@@ -112,6 +143,9 @@ static void speedstep_set_state (unsigne
 
 	/* check if transition was successful */
 	value = inb(pmbase + 0x50);
+	
+	rdtscll(tsc2);
+	pmt2 = read_pmtmr();
 
 	/* Enable IRQs */
 	local_irq_restore(flags);
@@ -124,6 +158,8 @@ static void speedstep_set_state (unsigne
 		printk (KERN_ERR "cpufreq: change failed - I/O error\n");
 	}
 
+	printk(KERN_ERR "cpufreq transition took %llu TSC cycles\n", tsc2 - tsc1);
+	printk(KERN_ERR "cpufreq transition took %u PM timer cycles\n", pmt2 - pmt1);
 	return;
 }
 

--------------060900090103040101040107
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------060900090103040101040107--

