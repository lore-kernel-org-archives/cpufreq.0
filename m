From: Francesco Poli <frx@firenze.linux.it>
Subject: Re: Help with Installation
Date: Tue, 6 Apr 2004 23:01:34 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040406230134.01c2e4b3.frx@firenze.linux.it>
References: <200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
	<200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
	<20040403172242.D5553@flint.arm.linux.org.uk>
	<20040404195730.6fac6745.frx@firenze.linux.it>
	<20040404211144.GA9552@dominikbrodowski.de>
	<20040405222015.4a560be1.frx@firenze.linux.it>
	<20040405220654.D17303@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1203087615=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040405220654.D17303@flint.arm.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk

--===============1203087615==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1";
	boundary="Signature=_Tue__6_Apr_2004_23_01_34_+0200_FH_LCSLcqBzcSo+7"

--Signature=_Tue__6_Apr_2004_23_01_34_+0200_FH_LCSLcqBzcSo+7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Mon, 5 Apr 2004 22:06:54 +0100 Russell King wrote:

> > 2) modifies it using latest cpufreq from
> >    http://ftp.linux.org.uk/pub/linux/cpufreq/
> 
> This would be a manual step.

Why? Did I misunderstand something?

Wouldn't some shell commands like

  tar xzvfp cpufreq-...tar.gz
  cd cpufreq
  ./patchin.sh /path/to/kernel/sources

suffice?
I am quoting Bruno Ducrot's instructions... but maybe I don't catch
something important...

> 
> > Such a script should be run daily (via cron) on ftp.linux.org.uk
> 
> You're making the very big assumption that ftp.linux.org.uk _has_
> the space to do this. [...]
> 
> So, _we_ _do_ _not_ _currently_ _have_ _the_ _resources_ _to_ _host_
> _such_ _a_ _service_.  As I've said _three_ times in this thread so
> far.

I'm sorry: I didn't realize you were /so/ short of space...  :-(
I thought you meant you couldn't generate and store one daily patch for
/every/ 2.4.x kernel version (that is 25 daily patches + a zillion of
patches against /all/ the pre-releases).
I now realize that you don't even have enough resources for one daily
patch against /one/ kernel version.

> 
> The fact is that right now there is only 10MB free for the anonymous
> FTP archive.

That's really a pity...  :-(

-- 
             |  GnuPG Key ID = DD6DFCF4 | You're compiling a program
  Francesco  |        Key fingerprint = | and, all of a sudden, boom!
     Poli    | C979 F34B 27CE 5CD8 DC12 |         -- from APT HOWTO,
             | 31B5 78F4 279B DD6D FCF4 |             version 1.8.0

--Signature=_Tue__6_Apr_2004_23_01_34_+0200_FH_LCSLcqBzcSo+7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAcxqzePQnm91t/PQRAnvaAKCAeqCfc+x1YeLBDO48f4Zo7pQJhwCeJjd7
L6iXrnNxv5wP+7gTUHs200g=
=LWBI
-----END PGP SIGNATURE-----

--Signature=_Tue__6_Apr_2004_23_01_34_+0200_FH_LCSLcqBzcSo+7--


--===============1203087615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1203087615==--

