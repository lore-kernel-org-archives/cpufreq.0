From: Arjan van de Ven <arjanv@redhat.com>
Subject: Re: add new p3m model
Date: Mon, 15 Mar 2004 15:45:28 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040315144528.GC7069@devserv.devel.redhat.com>
References: <20040314152016.0B04B3F04@latitude.mynet.no-ip.org>
	<20040315141517.GG8636@dominikbrodowski.de>
	<20040315142022.GA7069@devserv.devel.redhat.com>
	<20040308111531.GD14593@devserv.devel.redhat.com>
	<20040308111531.GD14593@devserv.devel.redhat.com>
	<20040308133135.GU2869@poupinou.org>
	<20040314143407.GA21991@dominikbrodowski.de>
	<20040315142101.GB7069@devserv.devel.redhat.com>
	<20040315143827.GA9696@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0923482191=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040315143827.GA9696@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Bruno Ducrot <ducrot@poupinou.org>, cpufreq@www.linux.org.uk, aeriksson@fastmail.fm, davej@redhat.com


--===============0923482191==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UFHRwCdBEJvubb2X"
Content-Disposition: inline


--UFHRwCdBEJvubb2X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 15, 2004 at 03:38:27PM +0100, Dominik Brodowski wrote:
> On Mon, Mar 15, 2004 at 03:21:01PM +0100, Arjan van de Ven wrote:
> > 
> > On Sun, Mar 14, 2004 at 03:34:07PM +0100, Dominik Brodowski wrote:
> > > On Mon, Mar 08, 2004 at 12:15:31PM +0100, Arjan van de Ven wrote:
> > > > Hi,
> > > > 
> > > > the patch below adds support for my laptop (Dell Inspiron 2600) which has
> > > > ebx return 7 for the p3 mobile in it....
> > > 
> > > Can you send a /proc/cpuinfo, please?
> > 
> > processor	: 0
> > vendor_id	: GenuineIntel
> > cpu family	: 6
> > model		: 11
> > model name	: Mobile Intel(R) Celeron(TM) CPU         1200MHz
>                                   ^^^^^^^
> so it's not a mobile Pentium III-M as you said before; but a Celeron. 
> Celeron's don't support SpeedStep [*].

Hmmmm. Dell provides a windows driver for it..

--UFHRwCdBEJvubb2X
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAVcGHxULwo51rQBIRAj4YAJ0ZrKozwgOo9TW114mSfHNL06f7mACfZ+ct
VJhjm4U/nnfI/ly3Ac1GEB4=
=YEbr
-----END PGP SIGNATURE-----

--UFHRwCdBEJvubb2X--


--===============0923482191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0923482191==--

