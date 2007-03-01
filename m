From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: [Bug 8081] Conservative governor sets wrong and too high
	sampling rates
Date: Thu, 1 Mar 2007 19:57:03 +0000
Message-ID: <20070301195703.GA19609@inskipp.digriz.org.uk>
References: <JE5ZRP$B081F2DA00BA3B983E6C3095805551EA@libero.it>
	<45E5DA8D.1020802@interia.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1679216213=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <45E5DA8D.1020802@interia.pl>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Rafa? Bilski <rafalbilski@interia.pl>
Cc: cpufreq@lists.linux.org.uk


--===============1679216213==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline


--s/l3CgOIzMHHjg/5
Content-Type: multipart/mixed; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I'm pretty sure this is a Bad Idea(tm).  I originally fiddled with the=20
scaling in this manner and some ratios and fixing things for one=20
group of people ended up breaking things for another.

I actually recall all these problems when I first released the patch, I was=
=20
trying to persuade the governor to react more slowly and foolishly made=20
'DEF_SAMPLING_RATE_LATENCY_MULTIPLIER' 100000, bumped up from the original=
=20
value of 1000.  It was actually Stefano Ferri who reported the bug=20
originally.

I have attached the chat we had if you forgot.  This problem really lurked=
=20
around between the merge data and 2.6.16ish[1], I CC'ed Stefano in on the=
=20
patches and he said things worked fine after they were applied.

There are some other underlying issues and this is not the way to solve it.=
 =20

I'll look into it this weekend and let you boys'n'girls know.

Cheers

Alex

[1] a lot of cpufreq overhaul work for hotpluggable (Wed, 22 Mar 2006:
	cpufreq_conservative: align codebase with ondemand for consistancy)=20
	kicked was done and the fixes I did went into that lot.  Everyone=20
	seemed to concur at the time I had sorted things out then

Rafa? Bilski <rafalbilski@interia.pl> [20070228 20:39:57 +0100]:
>
> > [...]
> > With the new code you wrote the governor should satisfy more users.=20
> > [...]
> > So now, if I have a default sampling rate of 199000, the min will be 19=
900... good
> > Oops.. wrong calculus. With the original code of the kernel default is =
1990000,=20
> > min with your patch will be 1/10, so 199000. Could you please align the=
=20
> > min values with that of ondemand? (for my processor is 99500).=20
> > It should be 1/20 of the default, and the min sampling rate=20
> > that one can set would be about 1/10 of second.
> OK. Adjusted.=20
> >> OK. Patch below is touching only min value. It is for 2.6.20. Is it su=
fficent?
> >=20
> > Yes, if it will be a change in the next release of the kernel!
> If author of this governor will accept it then probably will.
>=20
> Question to Alexander Clouter:
> Is this patch/change acceptable?
>=20
> ---
>  drivers/cpufreq/cpufreq_conservative.c |   12 +++++++-----
>  1 files changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpu=
freq_conservative.c
> --- a/drivers/cpufreq/cpufreq_conservative.c
> +++ b/drivers/cpufreq/cpufreq_conservative.c
> @@ -49,12 +49,11 @@
>   * All times here are in uS.
>   */
>  static unsigned int 				def_sampling_rate;
> +static unsigned int 				min_sampling_rate;
>  #define MIN_SAMPLING_RATE_RATIO			(2)
>  /* for correct statistics, we need at least 10 ticks between each measur=
e */
>  #define MIN_STAT_SAMPLING_RATE			\
>  			(MIN_SAMPLING_RATE_RATIO * jiffies_to_usecs(10))
> -#define MIN_SAMPLING_RATE			\
> -			(def_sampling_rate / MIN_SAMPLING_RATE_RATIO)
>  #define MAX_SAMPLING_RATE			(500 * def_sampling_rate)
>  #define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)
>  #define DEF_SAMPLING_DOWN_FACTOR		(1)
> @@ -125,7 +124,7 @@ static ssize_t show_sampling_rate_max(struct cpufreq_=
policy *policy, char *buf)
> =20
>  static ssize_t show_sampling_rate_min(struct cpufreq_policy *policy, cha=
r *buf)
>  {
> -	return sprintf (buf, "%u\n", MIN_SAMPLING_RATE);
> +	return sprintf (buf, "%u\n", min_sampling_rate);
>  }
> =20
>  #define define_one_ro(_name) 					\
> @@ -173,7 +172,7 @@ static ssize_t store_sampling_rate(struct cpufreq_pol=
icy *unused,
>  	ret =3D sscanf (buf, "%u", &input);
> =20
>  	mutex_lock(&dbs_mutex);
> -	if (ret !=3D 1 || input > MAX_SAMPLING_RATE || input < MIN_SAMPLING_RAT=
E) {
> +	if (ret !=3D 1 || input > MAX_SAMPLING_RATE || input < min_sampling_rat=
e) {
>  		mutex_unlock(&dbs_mutex);
>  		return -EINVAL;
>  	}
> @@ -510,10 +509,13 @@ static int cpufreq_governor_dbs(struct cpufreq_poli=
cy *policy,
> =20
>  			def_sampling_rate =3D 10 * latency *
>  					DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
> -
>  			if (def_sampling_rate < MIN_STAT_SAMPLING_RATE)
>  				def_sampling_rate =3D MIN_STAT_SAMPLING_RATE;
> =20
> +			min_sampling_rate =3D def_sampling_rate / 20;
> +			if (min_sampling_rate < MIN_STAT_SAMPLING_RATE)
> +				min_sampling_rate =3D MIN_STAT_SAMPLING_RATE;
> +
>  			dbs_tuners_ins.sampling_rate =3D def_sampling_rate;
> =20
>  			dbs_timer_init();
>=20
>=20
> ----------------------------------------------------------------------
> Oficjalne konto pocztowe europejskich internautow!=20
> >>> http://link.interia.pl/f19e8
>=20
>=20

--=20
 _________________________________________
/ A man with one watch knows what time it \
| is. A man with two watches is never     |
\ quite sure.                             /
 -----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=bug-history
Content-Transfer-Encoding: quoted-printable

Return-Path: <ferriste@libero.it>
Received: from mx2.internal (mx2.internal [10.202.2.201])
	 by server1.messagingengine.com (Cyrus v2.3-alpha) with LMTPA;
	 Wed, 25 Jan 2006 20:03:12 -0500
X-Sieve: CMU Sieve 2.3
X-Resolved-to: jimdigriz@imapmail.org
X-Delivered-to: jimdigriz@imapmail.org
X-Mail-from: ferriste@libero.it
Received: from mail.just-the-name.co.uk (just-the-name.co.uk [213.162.97.16=
1])
	by mx2.messagingengine.com (Postfix) with ESMTP id CF1BA159EA6B
	for <jimdigriz@imapmail.org>; Wed, 25 Jan 2006 20:03:13 -0500 (EST)
Received: from smtp20.libero.it (smtp20.libero.it [193.70.192.147])
	by mail.just-the-name.co.uk (Postfix) with ESMTP id 0A484404D31
	for <alex-kernel@digriz.org.uk>; Thu, 26 Jan 2006 01:02:58 +0000 (GMT)
Received: from localhost (172.16.1.84) by smtp20.libero.it (7.0.027-DD01)
        id 439D916F035D43E7 for alex-kernel@digriz.org.uk; Thu, 26 Jan 2006=
 02:02:38 +0100
Received: from smtp20.libero.it ([172.16.1.76])
 by localhost (asav5.libero.it [193.70.192.154]) (amavisd-new, port 10024)
 with ESMTP id 24093-07-2 for <alex-kernel@digriz.org.uk>;
 Thu, 26 Jan 2006 02:02:38 +0100 (CET)
Received: from libero.it (172.16.1.88) by smtp20.libero.it (7.0.027-DD01)
        id 431C3BFF016FC3F5 for alex-kernel@digriz.org.uk; Thu, 26 Jan 2006=
 02:02:38 +0100
Date: Thu, 26 Jan 2006 02:02:37 +0100
Message-Id: <ITODKD$AB9003C0C7E167A2B13A55F4CC420ABF@libero.it>
Subject: Bug in conservative governor?
MIME-Version: 1.0
X-Sensitivity: 3
Content-Type: text/plain; charset=3Diso-8859-1
Content-Transfer-Encoding: quoted-printable
=46rom: "stefano ferri" <ferriste@libero.it>
To: "alex-kernel" <alex-kernel@digriz.org.uk>
X-XaM3-API-Version: 4.3 (R1) (B3pl11)
X-SenderIP: 87.3.140.46
X-Scanned: with antispam and antivirus automated system at libero.it
Content-Length: 1382
Lines: 38

Hello. I would expose you a problem with the conservatice governor that I=3D
 think is caused by a wrong constant set in the file cpufreq_conservative=3D
=2Ec, in the kernel source.
I am running a 2.6.14.6 on slackware 10.2, on a laptop with an Amd Athlon=3D
 xp-m 2800+, so the scaling driver is powernow-k7.
The problem is this: when I set the conservative governor, in the folder =3D
/sys/devices/system/cpu/cpu0/cpufreq/conservative this is what I read:

sampling_rate_min   9950000
sampling_rate_max   1360065408

this make the governor useless, because the minimum polling period is 9.9=3D
5 seconds. Instead, with the ondemand governor the values are these:

sampling_rate_min   99500
sampling_rate_max   99500000

with such values the ondemand governor can work fine.
You can observe that the sampling_rate min of conservative is exactly 100=3D
 times greater than ondemand. Looking at the kernel source I've found thi=3D
s:

file cpufreq_conservative.c , line 58
#define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(100000)

file cpufreq_ondemand.c , line 53
#define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)

the constant defined in the first file is exactly 100 times greater than =3D
that defined in cpufreq_ondemand.c . This is normal or could be this the =3D
problem? Or is it caused by my hardware? I think I've loaded all necessar=3D
y modules to make these governors work.
Thanks

Stefano




Return-Path: <ferriste@libero.it>
Received: from mx4.internal (mx4.internal [10.202.2.203])
	 by server1.messagingengine.com (Cyrus v2.3-alpha) with LMTPA;
	 Sun, 29 Jan 2006 15:36:50 -0500
X-Sieve: CMU Sieve 2.3
X-Resolved-to: jimdigriz@imapmail.org
X-Delivered-to: jimdigriz@imapmail.org
X-Mail-from: ferriste@libero.it
Received: from mail.just-the-name.co.uk (just-the-name.co.uk [213.162.97.16=
1])
	by mx4.messagingengine.com (Postfix) with ESMTP id F22D997
	for <jimdigriz@imapmail.org>; Sun, 29 Jan 2006 15:36:45 -0500 (EST)
Received: from smtp6.libero.it (smtp6.libero.it [193.70.192.59])
	by mail.just-the-name.co.uk (Postfix) with ESMTP id 5D0C040598D
	for <alex@digriz.org.uk>; Sun, 29 Jan 2006 20:36:43 +0000 (GMT)
Received: from localhost (172.16.1.74) by smtp6.libero.it (7.0.027-DD01)
        id 439D919303A37C57 for alex@digriz.org.uk; Sun, 29 Jan 2006 21:35:=
41 +0100
Received: from smtp2.libero.it ([172.16.1.97])
 by localhost (asav16.libero.it [193.70.193.3]) (amavisd-new, port 10024)
 with ESMTP id 02282-17-10 for <alex@digriz.org.uk>;
 Sun, 29 Jan 2006 21:35:40 +0100 (CET)
Received: from libero.it (172.16.1.110) by smtp2.libero.it (7.0.027-DD01)
        id 431C3B200181EEDB for alex@digriz.org.uk; Sun, 29 Jan 2006 21:35:=
40 +0100
Date: Sun, 29 Jan 2006 21:35:40 +0100
Message-Id: <ITVFVG$9F861C6C3509DC9C2BC443FC94A4B7B2@libero.it>
Subject: Re: Bug in conservative governor?
MIME-Version: 1.0
X-Sensitivity: 3
Content-Type: text/plain; charset=3Diso-8859-1
Content-Transfer-Encoding: quoted-printable
=46rom: "stefano ferri" <ferriste@libero.it>
To: "alex" <alex@digriz.org.uk>
X-XaM3-API-Version: 4.3 (R1) (B3pl11)
X-SenderIP: 82.51.2.225
X-Scanned: with antispam and antivirus automated system at libero.it
Content-Length: 1009
Lines: 19

Hi, don't worry :-) I hope not to disturb contacting you directly by emai=3D
l instead of open a bug on bugzilla, if you think it's better I'll open i=3D
t. And sorry for the errors, but my english is not too good!
I've not tried to recompile because I didn't know if it could be dangerou=3D
s for the hardware, now I'll try.
I will send you an e-mail as soon as I have some news!
Can I ask you just a thing? How can I know the latency transition  time o=3D
f my athlon xp-m 2800+? It is necessary to write and compile a code that =3D
uses cpufreq or there is something in /sys that I can read? The minimum s=3D
ampling rate for my processor (used by ondemand) is quite high, 0.1 secon=3D
ds... I don't know if this depends by the athlon family, but I've seen in=3D
 various forum on the internet that people can set the sampling rate to 1=3D
000, 0.001 seconds, when I can use a minimum of 99500, 0.1 seconds :-( I =3D
hoped that a governor in kernel space was faster, but maybe is a problem =3D
of my laptop...
Thanks!
Stefano


Date: Sun, 29 Jan 2006 19:08:44 +0000
=46rom: Alexander Clouter <alex@digriz.org.uk>
To: stefano ferri <ferriste@libero.it>
Subject: Re: Bug in conservative governor?
Message-ID: <20060129190844.GD4005@inskipp.digriz.org.uk>
References: <ITODKD$AB9003C0C7E167A2B13A55F4CC420ABF@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=3Dus-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ITODKD$AB9003C0C7E167A2B13A55F4CC420ABF@libero.it>
Return-Path: <alex@digriz.org.uk>
Organization: diGriz
X-URL: http://www.digriz.org.uk/
User-Agent: Mutt/1.5.11
Status: RO

Hi Stefano,

Sorry for the rather late reply.

stefano ferri <ferriste@libero.it> [20060126 02:02:37 +0100]:
>
> [snipped woes]
>
> with such values the ondemand governor can work fine. You can observe that
> the sampling_rate min of conservative is exactly 100 times greater than
> ondemand. Looking at the kernel source I've found this:
>
> file cpufreq_conservative.c , line 58
> #define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(100000)
>
> file cpufreq_ondemand.c , line 53
> #define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)
>
> the constant defined in the first file is exactly 100 times greater than
> that defined in cpufreq_ondemand.c . This is normal or could be this the
> problem? Or is it caused by my hardware? I think I've loaded all necessary
> modules to make these governors work.
>
Yep, I remember doing that a long time back when I knew no better. :-/  I
thought I had removed it.  What I plan on doing is doing a diff between
ondemand and conservative and remove most of the differences, making ondema=
nd
the base.

I really have done a bad job of it :(  Did you recompile the module with
'#define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER  (1000)' in conservative?  Did
it fix things?

I'll get intouch with you once I have some patches....hopefully soon.

Cheers

Alex

--=3D20
 ______________________________
< Don't get mad, get interest. >
 ------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

Return-Path: <ferriste@libero.it>
Received: from mx3.internal (mx3.internal [10.202.2.202])
	 by server1.messagingengine.com (Cyrus v2.3-alpha) with LMTPA;
	 Sun, 29 Jan 2006 17:25:15 -0500
X-Sieve: CMU Sieve 2.3
X-Resolved-to: jimdigriz@imapmail.org
X-Delivered-to: jimdigriz@imapmail.org
X-Mail-from: ferriste@libero.it
Received: from mail.just-the-name.co.uk (just-the-name.co.uk [213.162.97.16=
1])
	by mx3.messagingengine.com (Postfix) with ESMTP id 5BE80121
	for <jimdigriz@imapmail.org>; Sun, 29 Jan 2006 17:25:04 -0500 (EST)
Received: from smtp2.libero.it (smtp2.libero.it [193.70.192.52])
	by mail.just-the-name.co.uk (Postfix) with ESMTP id 8D945404DF9
	for <alex@digriz.org.uk>; Sun, 29 Jan 2006 22:25:08 +0000 (GMT)
Received: from localhost (172.16.1.17) by smtp2.libero.it (7.0.027-DD01)
        id 439D906903796764 for alex@digriz.org.uk; Sun, 29 Jan 2006 23:24:=
18 +0100
Received: from smtp0.libero.it ([172.16.1.76])
 by localhost (asav12.libero.it [193.70.192.95]) (amavisd-new, port 10024)
 with ESMTP id 15566-11-12 for <alex@digriz.org.uk>;
 Sun, 29 Jan 2006 23:24:18 +0100 (CET)
Received: from libero.it (172.16.1.107) by smtp0.libero.it (7.0.027-DD01)
        id 439064B4008CEFE6 for alex@digriz.org.uk; Sun, 29 Jan 2006 23:24:=
18 +0100
Date: Sun, 29 Jan 2006 23:24:17 +0100
Message-Id: <ITVKWH$41012EE7981FB33E1C6510FC70CE9574@libero.it>
Subject: It works!
MIME-Version: 1.0
X-Sensitivity: 3
Content-Type: text/plain; charset=3Diso-8859-1
Content-Transfer-Encoding: quoted-printable
=46rom: "stefano ferri" <ferriste@libero.it>
To: "alex" <alex@digriz.org.uk>
X-XaM3-API-Version: 4.3 (R1) (B3pl11)
X-SenderIP: 82.51.2.225
X-Scanned: with antispam and antivirus automated system at libero.it
Content-Length: 951
Lines: 18

Hi, I've just recompiled the module and it seems to work :-) I've changed=3D
 to 1000 the DEF_SAMPLING_RATE_LATENCY_MULTIPLIER constant, and now I obt=3D
ain the same values of the sampling rate of ondemand, both min and max. S=3D
orry because I asked you before trying by myself...
A look at the trans_table of cpufreq shows lots of transitions from lower=3D
 to higher frequencies in a continuos way, so it really works.
Only a thing maybe is different from ondemand, but it could be a wrong im=3D
pression: using the default value of the sampling rate that conservative =3D
sets (199000, the same of ondemand) the system is apparently slower than =3D
when ondemand is set as governor. This difference seems to disappear sett=3D
ing the sampling rate to the minimum (99500). But maybe it works fine and=3D
 it is my impression that is wrong...
I hope this can be useful to fix the problem, now I will test it and I wi=3D
ll tell you if there are news.

Cheers
Stefano



--2fHTh5uZTiUOsy+g--

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFF5zAPNv5Ugh/sRBYRAmwrAJ9BraNcIHbCkfuHp+w4FFuhbVhpLgCgj8Sr
1peDREat6qb+SbT3J/BO22w=
=gEg6
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--



--===============1679216213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1679216213==--


