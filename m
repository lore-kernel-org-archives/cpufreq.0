From: Arjan van de Ven <arjanv@redhat.com>
Subject: Re: add new p3m model
Date: Mon, 15 Mar 2004 15:21:01 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040315142101.GB7069@devserv.devel.redhat.com>
References: <20040308111531.GD14593@devserv.devel.redhat.com>
	<20040308111531.GD14593@devserv.devel.redhat.com>
	<20040308133135.GU2869@poupinou.org>
	<20040314143407.GA21991@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1476363543=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040314143407.GA21991@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Bruno Ducrot <ducrot@poupinou.org>, cpufreq@www.linux.org.uk


--===============1476363543==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


On Sun, Mar 14, 2004 at 03:34:07PM +0100, Dominik Brodowski wrote:
> On Mon, Mar 08, 2004 at 12:15:31PM +0100, Arjan van de Ven wrote:
> > Hi,
> > 
> > the patch below adds support for my laptop (Dell Inspiron 2600) which has
> > ebx return 7 for the p3 mobile in it....
> 
> Can you send a /proc/cpuinfo, please?

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 11
model name	: Mobile Intel(R) Celeron(TM) CPU         1200MHz
stepping	: 4
cpu MHz		: 1196.449
cache size	: 256 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 2
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 mtrr pge mca cmov pat pse36 mmx fxsr sse
bogomips	: 2375.68


--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAVbvNxULwo51rQBIRAgewAJ9gZF3LqbHJP1TO8nSsuZIGrzz7aQCfTWrA
ZDYP/xmc9YQATFGV32oV+BY=
=NDsr
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--


--===============1476363543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1476363543==--

