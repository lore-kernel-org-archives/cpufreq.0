From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Cpufreq question ...
Date: Sun, 8 Feb 2004 16:40:49 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040208154049.GA19441@dominikbrodowski.de>
References: <20040205020533.565d7fe6.neurowork@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============99632511212161701=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040205020533.565d7fe6.neurowork@free.fr>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Cyril Wattebled <neurowork@free.fr>
Cc: cpufreq@www.linux.org.uk


--===============99632511212161701==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 05, 2004 at 02:05:33AM +0100, Cyril Wattebled wrote:
> Hi there,
>=20
> I have a centrino 1.7ghz on my sony z1rsp laptop.
> On linux, cpufreq works like a charm especially with speedfreqd which thr=
ottles
> the cpu from 600mhz to 1.7ghz dynamicly.
> I have however a question that's in my mind for a long time ...
> On M$ windows, the os is able to throttle the cpu down to 200 mhz which i=
s enough
> most of the time, and keep the laptop from been too hot.
> So I'm wondering why cpufreq detects 600 mhz for a cpu that is able to go=
 below
> 600mhz. By the way, I'm using enhanced speedstep module. I have tried var=
ious other
> modules and only p4-clockmod allowed me to throttle the cpu down to 200 m=
hz but I
> heard that p4-clockmod isn't as effective as enhanced speedstep for the p=
ower management
> since enhanced speedstep changes voltage values.
> So is there a way to tweak cpufreq to allow the cpu to be throttled at a =
lower speed ?

Throttling doesn't save you much or even nothing, and what M$ windows does
is _wrong_. If the system is idle, the CPU is put into ACPI idle states, and
they are as effective as throttling is.


	Dominik


--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAJliBZ8MDCHJbN8YRAgGnAJ44JCHaAM1V/IWod+P63UYAstb3gQCePevp
WRUvMw3CsoUIcCzgeztObvk=
=C+rg
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--


--===============99632511212161701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============99632511212161701==--

