From: Sergey Vlasov <vsu@altlinux.ru>
Subject: Re: powernow-k7: wrong FSB frequency detection
Date: Fri, 2 Jul 2004 19:34:56 +0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040702153456.GD17160@master.mivlgu.local>
References: <20040701122555.GC24153@master.mivlgu.local>
	<20040701152803.GF5614@poupinou.org>
	<20040701163549.GD29214@master.mivlgu.local>
	<20040701180215.GH5614@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1562068127=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040701180215.GH5614@poupinou.org>
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


--===============1562068127==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J5MfuwkIyy7RmF4Q"
Content-Disposition: inline


--J5MfuwkIyy7RmF4Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 01, 2004 at 08:02:15PM +0200, Bruno Ducrot wrote:
> > > Could you please try this little debug stuff ?  That will not help for
> > > now, but I want to be sure.
> > 
> 
> Thanks.  IMHO we should restore the old behaviour, that is using the
> max fid as per powernow spec, then provide something for people who
> unfortunately do have borken bios (those who put the processor not in
> max fid before booting OS).
> 
> Dave, could you please apply this patch?  I will provide the workaround
> for the unfortunate tomorow, after searching who do have the borken
> bios, and probably yet another powernow boot option :(
> 
> --- linux-2.6/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/07/01 15:01:46	1.1
> +++ linux-2.6/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/07/01 17:56:12
> @@ -565,7 +565,7 @@ static int __init powernow_cpu_init (str
>  	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
>  
>  	/* A K7 with powernow technology is set to max frequency by BIOS */
> -	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.CFID];
> +	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
>  	if (!fsb) {
>  		printk(KERN_WARNING PFX "can not determine bus frequency\n");
>  		return -EINVAL;
> 
> -- 

With this patch the results are much better:

powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: FSB: 133.374 MHz
powernow: Found PSB header at c00f1960
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 1 PST tables. (Only dumping ones relevant to this CPU).
powernow: No PST tables match this cpuid (0x7a0)
powernow: This is indicative of a broken BIOS.
powernow: Trying ACPI perflib
powernow: acpi:  P0: 1867 MHz 24000 mW 125 uS control 009c4176 SGTC 10000
powernow:    FID: 0x16 (14.0x [1867MHz])        VID: 0xb (1.450V)
powernow: acpi:  P1: 1400 MHz 14486 mW 125 uS control 009c41cf SGTC 10000
powernow:    FID: 0xf (10.5x [1400MHz]) VID: 0xe (1.300V)
powernow: acpi:  P2: 1200 MHz 14486 mW 125 uS control 009c41cc SGTC 10000
powernow:    FID: 0xc (9.0x [1200MHz])  VID: 0xe (1.300V)
powernow: acpi:  P3: 1067 MHz 14486 mW 125 uS control 009c426a SGTC 10000
powernow:    FID: 0xa (8.0x [1066MHz])  VID: 0x13 (1.200V)
powernow: acpi:  P4: 933 MHz 14486 mW 125 uS control 009c4268 SGTC 10000
powernow:    FID: 0x8 (7.0x [933MHz])   VID: 0x13 (1.200V)
powernow: acpi:  P5: 668 MHz 14486 mW 125 uS control 009c42e4 SGTC 10000
powernow:    FID: 0x4 (5.0x [666MHz])   VID: 0x17 (1.100V)
powernow: Minimum speed 666 MHz. Maximum speed 1867 MHz.

# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies 
1867236 1400427 1200366 1066992 933618 666870 

--J5MfuwkIyy7RmF4Q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA5YCgW82GfkQfsqIRAhJdAJ9bWaIxZILg0C/Zw/i8EdWmWRQEIwCfdOhw
23BOY2HoQrSVcBggg701FmU=
=etgU
-----END PGP SIGNATURE-----

--J5MfuwkIyy7RmF4Q--


--===============1562068127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1562068127==--

