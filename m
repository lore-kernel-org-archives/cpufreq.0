From: Francesco Poli <frx@firenze.linux.it>
Subject: Re: longhaul gives /proc/sys/cpu/0/speed-m{in,max} = 0
Date: Thu, 1 Jan 2004 18:55:56 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040101185556.3354db6e.frx@firenze.linux.it>
References: <87n09aa0j2.fsf@emit.demon.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============044774055130331725=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <87n09aa0j2.fsf@emit.demon.co.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: CpuFreq <cpufreq@www.linux.org.uk>

--===============044774055130331725==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	boundary="=.Ye63'l(a:?J(bQ"

--=.Ye63'l(a:?J(bQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Dec 2003 13:38:25 +0000 Ian McConnell wrote:

> Is this right? speed-min and speed-max are both zero so I can't use
> any of the userspace speed throttling programs such as cpuspeed-1.1.

With 2.4.x kernels, I think you must set the `userspace' governor in
order to have the CPU clock frequency (and voltage) assigned by a
userspace process: issue the following command (as root)

    # echo -n "0%0%100%userspace" > /proc/cpufreq

and then you should be able to enjoy cpuspeed or whatever...

> Also if /proc/sys/cpu/0/speed = 0, how do I tell what speed my machine
> is running at?

The following command

    $ cat /proc/cpuinfo

should show the actual CPU clock frequency (among the other things).

-- 
             |  GnuPG Key ID = DD6DFCF4 | You're compiling a program
  Francesco  |        Key fingerprint = | and, all of a sudden, boom!
     Poli    | C979 F34B 27CE 5CD8 DC12 |         -- from APT HOWTO,
             | 31B5 78F4 279B DD6D FCF4 |             version 1.8.0

--=.Ye63'l(a:?J(bQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)

iD8DBQE/9F8wePQnm91t/PQRAjEwAJ4tgNnxZRw1iLEklWcR5VY8G42nQACfctZL
DNe6Ex1KxDJfDh8XpYx+zAg=
=6uzg
-----END PGP SIGNATURE-----

--=.Ye63'l(a:?J(bQ--



--===============044774055130331725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============044774055130331725==--


