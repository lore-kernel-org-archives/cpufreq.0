From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH] transition latency of speedstep-ich (third try)
Date: Wed, 28 Sep 2005 23:38:14 +0200
Message-ID: <433B0D46.7010907@tremplin-utc.net>
References: <88056F38E9E48644A0F562A38C64FB6005D88D3D@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040601050804050906090003"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6005D88D3D@scsmsx403.amr.corp.intel.com>
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
--------------040601050804050906090003
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

28.09.2005 03:26, Pallipadi, Venkatesh wrote/a =E9crit:
>=20
> Great work! Getting those useful numbers form those documents :).
>=20
> I think the 100uS and 50uS looks proper from what the documents describe.=
 However, there is one factor that we are missing though. Speedstep-ich use=
s IO ports to initiate these transitions. Right? These IO port accesses tra=
p into BIOS code which actually initiaites the trasntion. And this trap int=
o BIOS code happens through SMM. And whenvever SMM's are involved I have se=
en latencies of upto 500uS! And in speedstep_ich:speedstep_set_state(), I s=
ee more than one in/out instructions. So, it can easily be higher than this.
It's great to know that I've managed to read in between the line of the=20
intel documents succesfully ;-)

>=20
> I think we need to add a guestimate for SMM latency number as well.
>=20
> Eric,
> Can you put rdtsc's around these in/out on your system and check how long=
 do they really take. On P4M, rdtsc should be running all the time other th=
an the Cpu being in deep_sleep state. That should give us some idea about t=
he SMM latency.
>=20
Ok, I've just done it. It's on a P3 coppermine though (not a P4M). So=20
I've measure the difference of tsc before and after the in/out=20
instructions (not included the local_irq_*()). The patch is attached for=20
double check (or if someone wants to try on another CPU). The values=20
seem very small compare to the 500uS you mentioned.

After few minutes with ondemand governor, there was a log like this:
Sep 28 23:30:32 circle kernel: cpufreq transition took 4862 cycles
Sep 28 23:30:33 circle kernel: cpufreq transition took 4473 cycles
Sep 28 23:30:33 circle kernel: cpufreq transition took 4836 cycles
Sep 28 23:30:35 circle kernel: cpufreq transition took 4723 cycles
Sep 28 23:30:35 circle kernel: cpufreq transition took 5640 cycles
Sep 28 23:30:48 circle kernel: cpufreq transition took 4515 cycles
Sep 28 23:30:48 circle kernel: cpufreq transition took 4904 cycles
Sep 28 23:31:02 circle kernel: cpufreq transition took 4286 cycles
Sep 28 23:31:02 circle kernel: cpufreq transition took 4607 cycles
Sep 28 23:31:03 circle kernel: cpufreq transition took 4279 cycles
Sep 28 23:31:03 circle kernel: cpufreq transition took 4605 cycles
Sep 28 23:31:04 circle kernel: cpufreq transition took 4694 cycles
Sep 28 23:31:04 circle kernel: cpufreq transition took 4605 cycles
Sep 28 23:31:13 circle kernel: cpufreq transition took 4683 cycles
Sep 28 23:31:14 circle kernel: cpufreq transition took 4676 cycles
Sep 28 23:31:14 circle kernel: cpufreq transition took 4515 cycles
Sep 28 23:31:15 circle kernel: cpufreq transition took 4522 cycles

Maximum I've seen is 5640 cycles, minimum is about 4200c. My CPU is=20
clocked 1GHz so the result can be easily summarized to a maximum of=20
about 6uS.

As it's very different from the numbers you got, I wonder if I mistook=20
somewhere ?

Eric

--------------040601050804050906090003
Content-Type: text/x-patch;
	name="speedstep-ich-measure-transition-2.6.13.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="speedstep-ich-measure-transition-2.6.13.patch"

--- arch/i386/kernel/cpu/cpufreq/speedstep-ich.c-beforetsc	2005-09-28 23:23:49.000000000 +0200
+++ arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2005-09-28 23:23:18.000000000 +0200
@@ -66,6 +66,7 @@ static void speedstep_set_state (unsigne
 	u8 pm2_blk;
 	u8 value;
 	unsigned long flags;
+	unsigned long long tsc1, tsc2;
 
 	if (!speedstep_chipset_dev || (state > 0x1))
 		return;
@@ -86,6 +87,8 @@ static void speedstep_set_state (unsigne
 	/* Disable IRQs */
 	local_irq_save(flags);
 
+	rdtscll(tsc1);
+	
 	/* read state */
 	value = inb(pmbase + 0x50);
 
@@ -111,6 +114,8 @@ static void speedstep_set_state (unsigne
 
 	/* check if transition was successful */
 	value = inb(pmbase + 0x50);
+	
+	rdtscll(tsc2);
 
 	/* Enable IRQs */
 	local_irq_restore(flags);
@@ -123,6 +128,7 @@ static void speedstep_set_state (unsigne
 		printk (KERN_ERR "cpufreq: change failed - I/O error\n");
 	}
 
+	printk(KERN_ERR "cpufreq transition took %llu cycles\n", tsc2 - tsc1);
 	return;
 }
 

--------------040601050804050906090003
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------040601050804050906090003--

