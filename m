From: emmel <the_emmel@gmx.net>
Subject: Re: powernow-k7 (again) on 2.4.20
Date: Thu, 24 Jul 2003 07:10:46 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <03072407104700.00210@gate>
References: <03072108302101.00222@gate> <03072308501000.00222@gate> <20030723163415.GA1870@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030723163415.GA1870@brodo.de>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wednesday 23 July 2003 18:34, you wrote:
> Hi,
>
> > But I *had* it working correctly once. I guess it has something to do=
 -
> > the only things I changed are some kernel options and I didn't apply =
the
> > swsp patch to the kernel I'm running now (it doesn't work anyway).
> > However, I had it working correctly before and with a 2.4.20 kernel. =
It
> > wouldn't strike me as odd if it hadn't. Well, in any case I have to k=
now
> > if loading the module really slows the comp down, or if the data is j=
ust
> > a bit weird. Where's that bogomips tool that has been mentioned here =
now
> > and again?
>
> Unfortunately, I don't know where that bogomips tool is. Sorry. Never u=
sed
> it myself... I just keep asking others about it :-)
> Now to the BUG() - have you upgraded your BIOS in the meantime? Had you
> patched the previous (working) kernel with the out-of-tree rtdvs patch
> which uses a different (and partly wrong) implementation of powernow-k7=
? Or
> did you patch it with one of the "override" patches available?
>
> =09Dominik

As I said the only difference is that I didn't patch it with swsp (softwa=
re=20
suspemd) this time; I did before. And then there's still the possibility =
that=20
some obscure kernel configuration was the cause. The kernel I'm running n=
ow=20
has been completely reconfigured since I managed to lose my old .config f=
or=20
it :-( And AFAIR I applied exactly the same cpufreq patch (and acpi patch=
) to=20
it. Still had them lying around in my source directory.
- --=20
emmel <the_emmel@gmx.net>

Official AGC feedback maniac

"God is playing creatures - and we're the norns."

"A hundred dead are a tragedy - a hundred thousand are statistics."

"I guess you can call yourself lucky." -
"I could, but Linda suits me a little better... :)
Things called lucky tend to get hit by trucks."

GPG 1.2.1 signed
Fingerprint: 60B4 D8E3 9617 900C 6726  168F D677 5AAD D40F CCE7
Certserver : ldap://certserver.pgp.com

Hi, I'm a .sig virus. Just copy me to your .signature. And don't worry.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/H2pk1ndardQPzOcRAkQAAJ9Ercs+mtgaUKzynkmoa6DO6QGsrwCfdZ0h
KywsRW/WYnxkxm44P2raj8k=3D
=3DXsnu
-----END PGP SIGNATURE-----
