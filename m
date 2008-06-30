From: Hakan BAYINDIR <hakan@bayindir.org>
Subject: Re: Q6600 CPU Frequency Scaling Problem / Bug
Date: Mon, 30 Jun 2008 23:33:05 +0300
Message-ID: <48694301.30707@bayindir.org>
References: <4869391A.9010006@bayindir.org>
	<7E82351C108FA840AB1866AC776AEC46066E6834@orsmsx505.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1103878891=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <7E82351C108FA840AB1866AC776AEC46066E6834@orsmsx505.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: "cpufreq@lists.linux.org.uk" <cpufreq@lists.linux.org.uk>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============1103878891==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigB3548D0F7CFF24A835EE5BF9"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigB3548D0F7CFF24A835EE5BF9
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Pallipadi, Venkatesh wrote:
>> -----Original Message-----
>> From: cpufreq-bounces@lists.linux.org.uk
>> [mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Hakan BAYINDI=
R
>> Sent: Monday, June 30, 2008 12:51 PM
>> To: cpufreq@lists.linux.org.uk
>> Subject: Q6600 CPU Frequency Scaling Problem / Bug
>>
>> Hi,
>>
>> I'm running Debian testing on an Intel Core2Quad Q6600 with
>> 4GB DDR2 RAM
>> on a MSI P35 Platinum board since December 07. When I first migrated m=
y
>> system on December (I've installed Debian as etch beta1 and upgrading
>> since), every core of the CPU was scaling their frequency
>> independently.
>> After installing 2.6.22, The cores started to scale in a synchronized
>> way. I.e. when a core needs to speed-up, every core speeds up in sync.=

>> The weird thing is, I have another clone of this OS at my
>> office running
>> on a core 2 duo processor and that system scaled its processors
>> independently.
>>
>> The ganged scaling behavior is also consistent with the
>> /sys/devices/system/cpuX/cpufreq/affected_cpus file and cpufreq-info
>> command. Both of them shows that all CPU's speeds are need to
>> be in sync
>> while there's really no need. Also Ubuntu 8.04 Live CD
>> exhibits the same
>> behavior and this behavior can be verified under sysfs again.
>>
>> Is it a bug? Is it expected? I can provide more information if it's
>> needed. I'm attaching cpufreq-info's output as a reference.
>>
>>    =20
>
> Just to confirm what I understood:
> - Older kernels, each logical CPU can show different frequencies and af=
fected_cpus has only once CPU number in it.
> - Newer kernel, logical CPUs show same freq and affected_cpus includes =
all CPUs in the platform.
>
> Correct?
> In this case it seems to be the expected behavior.
>
> In actual hardware, voltage is coordinated at socket level and that is =
the reason frequencies in one socket are tied together. Now, what has cha=
nged in two above config will be the mode in which kernel operates:
> 1) Hardware coordination mode: Kernel thinks each core is having indepe=
ndent frequency and reports the same. Underneath, hardware does frequency=
 coodination and picks the highest requested frequency among all cores an=
d runs all cores at that freq.
> 2) Software coordination mode: Kernel understands which specific CPUs a=
re dependent and picks the highest frequency needed among all such depend=
ent cores and makes single request for such frequency and reports the sam=
e.
>
> Note that there should not be any power consumption difference with the=
se two kernels on under identical load. Just that the kernel now knows mo=
re about the frequency dependencies in the platform.
>
> Thanks,
> Venki
>
>  =20
Hi again,

No this is not the case because, none of my CPUs are logical. I have one
true quad core and I true dual core CPU package. Each cores in these
cpus are real and complete (not hyper threading CPUs). When I was
running 2.6.21, both quad core and dual core systems were scaling its
speeds independently per core. Currently, while my dual core system is
continuing to do it, my quad core cpu is not doing it. Instead, it syncs
its speed.

In reality, Core2Quad Q6600 is two Core2Duo E6600s. As A result I'm
running a 2xDual Core CPUs in one package which each dual core CPU can
scale every of its core independently from each other and when I run a
single threaded intensive job, all of my cores scale up and I can see
its effects in the output of sensors command. If the cores were logical
or not-complete, Syncing should be the thing to do but When I'm running
two of my office PC's CPUs (literally) in one package, it's hard to
understand this behavior.

Thanks for reply,

Cheers and Regards,

--Hakan.

--------------enigB3548D0F7CFF24A835EE5BF9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIaUMHjzSH49UjSJwRAg6CAJoDZ2yQe7ILjTmjE2W9dDFBVtSC+wCcD1oH
41P0no6jm1BMhw3RazljwPo=
=Dpcf
-----END PGP SIGNATURE-----

--------------enigB3548D0F7CFF24A835EE5BF9--


--===============1103878891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1103878891==--

