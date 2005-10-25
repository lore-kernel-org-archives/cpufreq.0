From: "Darrick J. Wong" <djwong@us.ibm.com>
Subject: Re: Can't load speedstep-centrino on IBM x336?
Date: Mon, 24 Oct 2005 23:18:19 -0700
Message-ID: <435DCE2B.6000201@us.ibm.com>
References: <88056F38E9E48644A0F562A38C64FB60061BE91E@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1294090383=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60061BE91E@scsmsx403.amr.corp.intel.com>
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
Cc: Dave Jones <davej@codemonkey.org.uk>, Chris McDermott <lcm@us.ibm.com>, cpufreq@lists.linux.org.uk

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============1294090383==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig7CD7D9D68CD7AB3BCDDA4E98"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig7CD7D9D68CD7AB3BCDDA4E98
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ok, I tried acpi-cpufreq and tried to change the frequency from 3.6GHz
to 2.8.  scaling_cur_freq says I'm at 2800MHz, but /proc/cpuinfo still
says 3600.  In dmesg, I see "Writing 0x00000e1e to port 0x0800" at the
very end of the log, but I don't see "Looking for 0x00000e1e from port
0x0804" like I think I should.  I don't see "Invalid port width..."
either--it's as if we fell out of the function.

--D

Pallipadi, Venkatesh wrote:
> It is just that speedstep-centrino driver can only handle
> FIXED_HARDWARE. For SYSTEM_IO you should be using acpi-cpufreq driver.
> Please try that driver and things should work fine.
> 
> Thanks,
> Venki 
> 
> 
>>-----Original Message-----
>>From: cpufreq-bounces@lists.linux.org.uk 
>>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of 
>>Darrick J. Wong
>>Sent: Monday, October 24, 2005 6:48 PM
>>To: Dave Jones
>>Cc: cpufreq@lists.linux.org.uk; Chris McDermott
>>Subject: Can't load speedstep-centrino on IBM x336?
>>
>>Hi all,
>>
>>I've been trying to get Enhanced SpeedStep working on an IBM x336
>>(3.6GHz Xeon).  If I load the speedstep-centrino driver with cpufreq
>>debugging turned on, I get a message about "Invalid control/status
>>registers (1 - 1)" and the module refuses to load.  It seems that the
>>stumbling point is this chunk of code in centrino_cpu_init_acpi():
>>
>>if ((p.control_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) ||
>>   (p.status_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE)) {
>>       dprintk("Invalid control/status registers (%x - %x)\n",
>>              p.control_register.space_id, 
>>p.status_register.space_id);
>>       result = -EIO;
>>       goto err_unreg;
>>}
>>
>>I decompiled the DSDT code that the BIOS supplies, and it 
>>seems that the
>>_PCT method returns control and status registers in SystemIO space if
>>\SMIM is set (it is set to 0x1 earlier):
>>
>>
>>Method (_PCT, 0, NotSerialized)
>>{
>>   If (\SMIM)
>>   {
>>       Return (Package (0x02)
>>       {
>>           ResourceTemplate ()
>>           {
>>               Register (SystemIO, 0x10, 0x00, 0x0000000000000800)
>>           },
>>           ResourceTemplate ()
>>           {
>>               Register (SystemIO, 0x10, 0x00, 0x0000000000000804)
>>           }
>>       })
>>   }
>>   Return (Package (0x02)
>>   {
>>       ResourceTemplate ()
>>       {
>>           Register (FFixedHW, 0x40, 0x00, 0x0000000000000199)
>>       },
>>       ResourceTemplate ()
>>       {
>>           Register (FFixedHW, 0x10, 0x00, 0x0000000000000198)
>>       }
>>   })
>>}
>>
>>I checked with the ACPI specs v2.0c and v3.0, and neither of them seem
>>to restrict the register address space to "fixed hardware".  Linux,
>>however, expects FIXED_HARDWARE, not SYSTEM_IO, causing the error
>>space_id checking to trip.  However, EST seems to work just fine on the
>>x336 without this check.  I built a kernel without this code and was
>>able to switch frequencies and governors in a loop without any adverse
>>effects.  /proc/cpuinfo was getting updated, too.
>>
>>So now I'm wondering three things: Is there a reason why there is this
>>address space check?  Can we get rid of it?  And, am I supposed to be
>>using acpi_cpufreq instead?  The speedstep_centrino code seems to
>>indicate that my CPU revision (0xF41) should be supported by 
>>this driver...
>>
>>(Attached is a patch against 2.6.14-rc4 to get rid of the check.)
>>
>>--Darrick
>>
> 
> 

--------------enig7CD7D9D68CD7AB3BCDDA4E98
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFDXc4wa6vRYYgWQuURAstmAJ9pcWc/Vb7t1SiECcRi5uPFCnOydgCeJWZg
0ynU8OH8Ezu/6ZHgsPApGCo=
=ofCP
-----END PGP SIGNATURE-----

--------------enig7CD7D9D68CD7AB3BCDDA4E98--


--===============1294090383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1294090383==--

