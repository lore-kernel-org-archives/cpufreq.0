From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCHES 2.6.4] pending cpufreq patches
Date: Mon, 15 Mar 2004 15:14:40 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040315141440.GA8636@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0224969514=="
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
To: davej@redhat.com, cpufreq@www.linux.org.uk


--===============0224969514==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, List,

The following five patches have received no negative discussion (so far) on
the cpufreq mailing list. They've hardly changed to previously sent variants
of the patches, so please apply them.

- 1/5: don't stick if all ->init() calls fail
- 2/5: p4-clockmod: single-line KERN_WARNING message
- 3/5: speedstep-centrino: move to per-CPU analyzing of cpu_data
- 4/5: speedstep-centrino: acpi perflib support
- 5/5: speedstep-centrino: scaling_available_frequencies

Then, I'll send out two (new) patches, an adaption of Andres'

- speedstep capability checks [which includes now a workaround for
      Arjan's p3m], and
- off-by-10 error in pentiumM_detect_frequency() in speedstep-lib.c

Please apply these two patches to your BK tree, too.


Also, I'll CC the cpufreq mailing list on two patches to the acpi-io cpufreq
driver, which will be sent to Len Brown for inclusion:

- 1/2: try to determine current P-State at startup
- 2/2: scaling_available_frequencies

Of interest will be also a third patch sent to Len Brown for inclusion, also
with CC to cpufreq mailing list:

- Disable SMM access to SpeedStep


Thanks,
	Dominik

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVbpQZ8MDCHJbN8YRAsluAKCqh/iSBE7R0ytQtN3G6AB4M166JACfeOMS
RrczOsqTeuaJokd8GhFJDZM=
=ab8u
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--


--===============0224969514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0224969514==--

