From: "Darrick J. Wong" <djwong@us.ibm.com>
Subject: Re: Can't load speedstep-centrino on IBM x336?
Date: Thu, 27 Oct 2005 17:53:58 -0700
Message-ID: <436176A6.4070206@us.ibm.com>
References: <88056F38E9E48644A0F562A38C64FB60061F410B@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1213843116=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60061F410B@scsmsx403.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Dave Jones <davej@codemonkey.org.uk>, Chris McDermott <lcm@us.ibm.com>, cpufreq@lists.linux.org.uk

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============1213843116==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig85F2F3444E3E08ABAF5A774A"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig85F2F3444E3E08ABAF5A774A
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Venkatesh,

It turns out that RHEL4 wasn't calling the SMM to tell it that the OS
would handle the p-state transitions.  Thus, the status register trap
never got set up, which is why I kept reading 0xFFFF.  RHEL4 also
obliterates the value of PSTATE_CNT if the FADT revision is 1.0, so I
sent RH a backport of mainline's cpufreq, which only obliterates
PSTATE_CNT if acpi=strict and also makes that call to SMM.  With that
patch, DBS works great.

However, I am curious about the removal of the status register check in
acpi_cpufreq--how slow is reading that status register?  It seems to me
that it's a rather good idea to check that the operation actually
succeeded, instead of assuming that it does and changing the reported
clock speed as if it did, because any failures that happen will be
silent; we could only tell if the switch succeeded for sure by running
CPU benchmarks.  But, perhaps there's a justification for removing it
that I simply don't know about?

Anyway, thanks for your help with debugging this issue!

--Darrick

Pallipadi, Venkatesh wrote:
>  
> 
> 
>>-----Original Message-----
>>From: Darrick J. Wong [mailto:djwong@us.ibm.com] 
>>
>>Hmm... ok then, mainline is working.  Thanks for the data!
>>
>>Unfortunately, RHEL4 U2's "acpi" (it's based on 2.6.9) module doesn't
>>work--it prints the "Looking..." message and then "Transition failed."
>>when it doesn't find the value it's looking for (0x0E1E) and 
>>gets 0xFFFF
> 
> 
> When using SYSTEM_IO, The acpi driver does the IO call with proper
> parameters to change the frequency. BIOS then comes in and does the
> actual P-state transition in SMM mode (after the cordination across
> logical CPUs). After the transition, BIOS is supposed to export the
> result in another IO port, which OS tries to read and verify. This
> verification was removed in the latest base kernel, but is present in
> 2.6.9 (and RHEL4).
> 
> So, the problem here may be:
> 1) BIOS is not doing the transition. Hence when OS tries to verify by
> readon the status IO port, it sees the transition has failed.
> 2) BIOS is doing the transition, but not reflecting the status in status
> IO port or reporting some error there. Hence again OS fails to see the
> change.
> 3) Some other bug in the OS driver.
> 
> Having seen various bugs in different BIOSes related to this, and I am
> kind of confident that this also ia a bug in BIOS and not a OS issue.
> Can you please check with the BIOS folks on how exactly they are doing
> these transitions in SMM. You can also let me know if you need any more
> details about the driver itself.
> 
> Thanks,
> Venki 
> 
> 
>>instead.  Do you have any suggestions?  (If you're not familiar with
>>RHEL4, that's fine too.)
>>
>>--D
>>
>>Venkatesh Pallipadi wrote:
>>
>>>On Mon, Oct 24, 2005 at 11:18:19PM -0700, Darrick J. Wong wrote:
>>>
>>>
>>>>Ok, I tried acpi-cpufreq and tried to change the frequency 
> 
>>from 3.6GHz
> 
>>>>to 2.8.  scaling_cur_freq says I'm at 2800MHz, but 
>>
>>/proc/cpuinfo still
>>
>>>>says 3600.  In dmesg, I see "Writing 0x00000e1e to port 
>>
>>0x0800" at the
>>
>>>>very end of the log, but I don't see "Looking for 0x00000e1e 
> 
>>from port
> 
>>>>0x0804" like I think I should.  I don't see "Invalid port width..."
>>>>either--it's as if we fell out of the function.
>>>>
>>>
>>>
>>>If scaling_cur_freq shows you the right freq, then things 
>>
>>should be working.
>>
>>>We recently removed "Looking for * from port" in the common path.
>>>
>>>What /proc/cpuinfo shows kind of depends on other things. I 
>>
>>had this patch 
>>
>>>in my queue that fixes things with /proc/cpuinfo. This 
>>
>>should help here..
>>
>>>Thanks,
>>>Venki
>>
> 

--------------enig85F2F3444E3E08ABAF5A774A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDYXama6vRYYgWQuURAv/qAKCVNxoJeUXl7Bdgxce2o4I/Ql/p8QCePWbA
0TTiUGCllNlgkZWWBU0yU7A=
=tIxl
-----END PGP SIGNATURE-----

--------------enig85F2F3444E3E08ABAF5A774A--


--===============1213843116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1213843116==--

