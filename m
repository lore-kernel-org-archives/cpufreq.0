From: Sergey Vlasov <vsu@altlinux.ru>
Subject: Re: powernow-k7: wrong FSB frequency detection
Date: Thu, 1 Jul 2004 20:35:49 +0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040701163549.GD29214@master.mivlgu.local>
References: <20040701122555.GC24153@master.mivlgu.local>
	<20040701152803.GF5614@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1660128624=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040701152803.GF5614@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk


--===============1660128624==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/unnNtmY43mpUSKx"
Content-Disposition: inline


--/unnNtmY43mpUSKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 01, 2004 at 05:28:03PM +0200, Bruno Ducrot wrote:
> On Thu, Jul 01, 2004 at 04:25:55PM +0400, Sergey Vlasov wrote:
> > On the MaxSelect A7W notebook the powernow-k7 driver in kernel 2.6.7
> > basically works, but shows completely wrong frequency values:
> > 
> > # cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies 
> > 4355876 3266907 2800206 2489072 2177938 1555670
> > 
[skip]
> Could you please try this little debug stuff ?  That will not help for
> now, but I want to be sure.

Here is the output:

powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: cpu_khz 1866830    fid current 6
powernow: FSB: 311.138 MHz
powernow: Found PSB header at c00f1960
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 1 PST tables. (Only dumping ones relevant to this CPU).
powernow: No PST tables match this cpuid (0x7a0)
powernow: This is indicative of a broken BIOS.
powernow: Trying ACPI perflib
powernow: acpi:  P0: 1867 MHz 24000 mW 125 uS control 009c4176 SGTC 10000
powernow:    FID: 0x16 (14.0x [4355MHz])        VID: 0xb (1.450V)
powernow: acpi:  P1: 1400 MHz 14486 mW 125 uS control 009c41cf SGTC 10000
powernow:    FID: 0xf (10.5x [3266MHz]) VID: 0xe (1.300V)
powernow: acpi:  P2: 1200 MHz 14486 mW 125 uS control 009c41cc SGTC 10000
powernow:    FID: 0xc (9.0x [2800MHz])  VID: 0xe (1.300V)
powernow: acpi:  P3: 1067 MHz 14486 mW 125 uS control 009c426a SGTC 10000
powernow:    FID: 0xa (8.0x [2489MHz])  VID: 0x13 (1.200V)
powernow: acpi:  P4: 933 MHz 14486 mW 125 uS control 009c4268 SGTC 10000
powernow:    FID: 0x8 (7.0x [2177MHz])  VID: 0x13 (1.200V)
powernow: acpi:  P5: 668 MHz 14486 mW 125 uS control 009c42e4 SGTC 10000
powernow:    FID: 0x4 (5.0x [1555MHz])  VID: 0x17 (1.100V)
powernow: Minimum speed 1555 MHz. Maximum speed 4355 MHz.


> (I think the real problem is at:
> linux-2.6/drivers/acpi/hardware/hwacpi.c in function acpi_hw_set_mode()
> when we tell the bios that we go to ACPI mode, though I'm not sure at
> 100% yet, just this is the only possibility I see for now).
> 
> 
> --- powernow-k7.c	2004/07/01 15:01:46	1.1
> +++ powernow-k7.c	2004/07/01 15:14:16
> @@ -566,6 +566,8 @@ static int __init powernow_cpu_init (str
>  
>  	/* A K7 with powernow technology is set to max frequency by BIOS */
>  	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.CFID];
> +	dprintk(KERN_INFO PFX "cpu_khz %d    fid current %x\n", cpu_khz,
> +			fidvidstatus.bits.CFID);
>  	if (!fsb) {
>  		printk(KERN_WARNING PFX "can not determine bus frequency\n");
>  		return -EINVAL;
> 
> 
> -- 
> Bruno Ducrot
> 
> --  Which is worse:  ignorance or apathy?
> --  Don't know.  Don't care.

--/unnNtmY43mpUSKx
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA5D1kW82GfkQfsqIRAvXSAJ0ZbIoG7ms+X+UuQ7X8gypNtuuE2wCfTQ7M
2MV54q3+seczvlvgpS4LeZI=
=2ArP
-----END PGP SIGNATURE-----

--/unnNtmY43mpUSKx--


--===============1660128624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1660128624==--

