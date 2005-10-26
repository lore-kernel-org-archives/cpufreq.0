From: "Darrick J. Wong" <djwong@us.ibm.com>
Subject: Re: Can't load speedstep-centrino on IBM x336?
Date: Tue, 25 Oct 2005 19:31:51 -0700
Message-ID: <435EEA97.6010308@us.ibm.com>
References: <88056F38E9E48644A0F562A38C64FB60061BE91E@scsmsx403.amr.corp.intel.com>
	<435DCE2B.6000201@us.ibm.com>
	<20051025092130.A8573@unix-os.sc.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1757336698=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20051025092130.A8573@unix-os.sc.intel.com>
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
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Cc: Dave Jones <davej@codemonkey.org.uk>, Chris McDermott <lcm@us.ibm.com>, cpufreq@lists.linux.org.uk

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============1757336698==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigFE353D6429986FF6E514A79D"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigFE353D6429986FF6E514A79D
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hmm... ok then, mainline is working.  Thanks for the data!

Unfortunately, RHEL4 U2's "acpi" (it's based on 2.6.9) module doesn't
work--it prints the "Looking..." message and then "Transition failed."
when it doesn't find the value it's looking for (0x0E1E) and gets 0xFFFF
instead.  Do you have any suggestions?  (If you're not familiar with
RHEL4, that's fine too.)

--D

Venkatesh Pallipadi wrote:
> On Mon, Oct 24, 2005 at 11:18:19PM -0700, Darrick J. Wong wrote:
> 
>>Ok, I tried acpi-cpufreq and tried to change the frequency from 3.6GHz
>>to 2.8.  scaling_cur_freq says I'm at 2800MHz, but /proc/cpuinfo still
>>says 3600.  In dmesg, I see "Writing 0x00000e1e to port 0x0800" at the
>>very end of the log, but I don't see "Looking for 0x00000e1e from port
>>0x0804" like I think I should.  I don't see "Invalid port width..."
>>either--it's as if we fell out of the function.
>>
> 
> 
> If scaling_cur_freq shows you the right freq, then things should be working.
> We recently removed "Looking for * from port" in the common path.
> 
> What /proc/cpuinfo shows kind of depends on other things. I had this patch 
> in my queue that fixes things with /proc/cpuinfo. This should help here..
> 
> Thanks,
> Venki

--------------enigFE353D6429986FF6E514A79D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDXuqXa6vRYYgWQuURArHWAJ9Bqw0m9Ehq5KqBKF6buMt36W8NvACffZhD
UkV+c3rxS64heyPuSMx1R84=
=DOR/
-----END PGP SIGNATURE-----

--------------enigFE353D6429986FF6E514A79D--


--===============1757336698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1757336698==--

