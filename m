From: Francesco Poli <frx@firenze.linux.it>
Subject: Re: Help with Installation
Date: Tue, 6 Apr 2004 23:48:43 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040406234843.6104733f.frx@firenze.linux.it>
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
	<20040405211131.GA7586@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1501472459=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040405211131.GA7586@dominikbrodowski.de>
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

--===============1501472459==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1";
	boundary="Signature=_Tue__6_Apr_2004_23_48_43_+0200_TOnsiASEmGa=LMGw"

--Signature=_Tue__6_Apr_2004_23_48_43_+0200_TOnsiASEmGa=LMGw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Mon, 5 Apr 2004 23:11:31 +0200 Dominik Brodowski wrote:

> IMHO, such a script can only work well if it is "being watched", e.g.
> someone (you?) verifies the results equal what you expect. Also,
> differences in the base kernel need to be tracked which might make
> adjustments of the cpufreq files / patch necessary.

OK, it's quite clear I misunderstood the role of
http://ftp.linux.org.uk/pub/linux/cpufreq/ tar archives...  :-(
I thought that these archives were there to provide the latest cpufreq
backport for 2.4.x kernels, and that one (following Bruno Ducrot's
instructions) would be able to use them to modify a 2.4.x kernel (and be
happy).
That is why I said that a kernel patch would be easier to apply.

If those archives are online for completely different purposes (which
ones?), I apologize for all the noise.

Now the question is: I would like to run the latest 2.4.x kernel with
cpufreq support, what do I do? 

> 
> > Such a script should be run daily (via cron) on ftp.linux.org.uk
> > 
> > This could perhaps work and provide up-to-date patches, as long as
> > 2.4.x cpufreq at http://ftp.linux.org.uk/pub/linux/cpufreq/ is kept
> > up-to-date with 2.6.x
> 
> But assuming that this CVS export is up-to-date [which it isn't], why
> is your script necessary?

It would generate a kernel patch whose application is straightforward...
right?

> 
> > Perhaps patchin.sh should be modified in order to use cp (or mv)
> > rather than ln -s
> 
> Modifying the patchin.sh script to become more user friendly is
> something which can be done -- but _please_ be aware that 2.4. cpufreq
> is, at best, in"beta" state and not as up to date as 2.6.

Of course, cpufreq cannot be backported from 2.6.x to 2.4.x by an
automatic script. That's a manual operation in any case. And one in
which I cannot help much[1], I'm afraid...

Notes:
[1] IANAKH: I am not a kernel hacker  :-( 

-- 
             |  GnuPG Key ID = DD6DFCF4 | You're compiling a program
  Francesco  |        Key fingerprint = | and, all of a sudden, boom!
     Poli    | C979 F34B 27CE 5CD8 DC12 |         -- from APT HOWTO,
             | 31B5 78F4 279B DD6D FCF4 |             version 1.8.0

--Signature=_Tue__6_Apr_2004_23_48_43_+0200_TOnsiASEmGa=LMGw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAcyXAePQnm91t/PQRAstSAJ9k85JNOG68H6hTC7EK3jZcOiGZpgCdFxak
+WnhKDoMhaMG4fFz6gLOmr4=
=2YVH
-----END PGP SIGNATURE-----

--Signature=_Tue__6_Apr_2004_23_48_43_+0200_TOnsiASEmGa=LMGw--


--===============1501472459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1501472459==--

