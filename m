From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: post-OLS pending cpufreq patches
Date: Tue, 27 Jul 2004 22:51:26 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040727205126.GB9438@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1846535762=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk


--===============1846535762==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, list,

As KS and OLS are over, here's a status update on what patches and/or what
issues (in the world outside of KS and OLS) are at what state at the moment.
Also, I'm looking forward to read Paul's paper in the OLS proceedings, and
to see what Dave has added to his TODO list :)

- [core] HT fix before CPU group support is merged
	fixes bug #3012: blind de-referencing of CPUdata independent of
	whether this CPU is actually registered with the CPUfreq core is=20
	bad. The small fix proposed is really straightforward, the proper
	solution will be to merge the cpufreq-SMT patchkit, but that's much
	more invasive and not yet completely ready. A "must" for 2.6.8.

- [speedstep-smi] get_frequencies SMM call causes failures=20
	fixes bug reported by Pierre Maziere. Also really straightforward.

- [speedstep-centrino] reduce Jeremey's mail [Jeremey Fitzhardinge]
	latest version looks good, I'm just not yet 100% sure whether
	initialization of table is according to new/2.6. coding stlye.
	Please consider for merging for 2.6.8, too.
=09
- [speedstep-centrino] SMP support [Venkatesh Pallipadi]
	looks good, IMO, but needs to be adapted to Jeremey's patch which
	should go in first, IMO.

- [pmac] scaling_availbale_frequencies, #define cleanup [John Clemens]
x [pmac] does it keep frequency across suspend? If not, remove "equal" check
		in target and/or set_speed
	Don't really know about pmac's side of things, just wanted to
	mention	it again.

- [core] SMT patchkit
	needs a bit of work, will re-submit for 2.6.9

x [gx-suspmod] trouble
	gx-suspmod seems to be quite sick right now. Even reverting the
	latest changes leads to strange behaviour. Investigating...

- [acpi-core] disable SMM access to SpeedStep using ACPI-FADT pstate_cnt
	prepared an updated version, will submit for 2.6.9.

Thanks,
	Dominik

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBBsBOZ8MDCHJbN8YRAsmAAKCaXA3kSWG9USvVAWsiIrUJZr/kZgCffJvL
jYaXeMbK33mDPqG5bHh6nuw=
=nfHA
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--


--===============1846535762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1846535762==--

