From: Michael Filz <m.filz@gmx.net>
Subject: Re: CHOWN PB
Date: Fri, 19 Sep 2003 08:47:01 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <03091908435100.00212@gate>
References: <3F6A35D7.8070605@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <3F6A35D7.8070605@wanadoo.fr>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 19 September 2003 00:46, you wrote:
> Hi,
> Ok here is the deal :
> I would like to allow users from a given group (let say the cpufreq
> group) to have write acces to /proc/cpufreq and
> /proc/sys/cpu/0/speed...I try the following :
>
> $ chown root:cpufreq /proc/cpufreq
> $ chmod 664 /proc/cpufreq
> And then...
> $ ls -l /proc/cpufreq
> ...show me that nothing changes.
>
> Any idea on how to solve this problem ? Because login as root every tim=
e
> I want to change the frequency is quite boring ( I would like to be abl=
e
> to use button of my window manager to change it), and because of that
> other people that use my laptop can change the frequency because they
> don't have the root passwd...
> Thx in advance...
> Mike

This is one of the few cases where suid root is really useful. Put everyt=
hing=20
you want in a script, suid it and put it in the bin directory of your cho=
ice.=20
If you set the ownership of the script to root.cpufreq you might even be =
able=20
to restrict its use to the group; if not you would have the script to che=
ck=20
for allowed users or something.
- --=20
GPG 1.2.1 signed=0D
Fingerprint: 60B4 D8E3 9617 900C 6726  168F D677 5AAD D40F CCE7=0D
Certserver : ldap://certserver.pgp.com=0D
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/aqZl1ndardQPzOcRAsJoAJ0V5ZVh+sq5oUQJz2KIBCA7pFfPrwCg9vjg
CKlc8BOLk1gaOszRyITjv14=3D
=3Dw4YI
-----END PGP SIGNATURE-----
