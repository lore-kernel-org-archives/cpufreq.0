From: "Peter Oruba" <peter.oruba@amd.com>
Subject: Re: cpufreq issue with K8 performance governor
Date: Tue, 29 May 2007 18:20:06 +0200
Message-ID: <200705291820.06896.peter.oruba@amd.com>
References: <200705291547.10134.peter.oruba@amd.com>
	<20070529160621.GC13235@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1022454369=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20070529160621.GC13235@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk


--===============1022454369==
Content-Type: multipart/signed; boundary=nextPart2668689.myGYOuVNfE;
	protocol="application/pgp-signature"; micalg=pgp-sha1


--nextPart2668689.myGYOuVNfE
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Dienstag, 29. Mai 2007 18:06:21 schrieben Sie:
> On Tue, May 29, 2007 at 03:47:00PM +0200, Peter Oruba wrote:
>  > Dave,
>  >=20
>  > I am contacting you regarding a frequency scaling issue that I encount=
ered with the performance governor in combination with CPU hotplug. In cpuf=
req.c CPU frequency is reduced to its=20
>  > minimum before the CPU gets unregistered and set offline. Does that ha=
ve a particular reason? Since the (k8-)governor does not monitor CPU freque=
ncy that setting also applies then to the remaining CPU
>  > as well and lets the system run on the lowest frequency although perfo=
rmance is chose as the policy.
>  >=20
>  > ---
>  > static int cpufreq_cpu_callback(struct notifier_block *nfb,
>  >                                         unsigned long action, void *hc=
pu)
>  > {
>  >=20
>  > [......]
>  >=20
>  >                 case CPU_DOWN_PREPARE_FROZEN:
>  >                         if (unlikely(lock_policy_rwsem_write(cpu)))
>  >                                 BUG();
>  >=20
>  >                         policy =3D cpufreq_cpu_data[cpu];
>  >                         if (policy) {
>  >                                 __cpufreq_driver_target(policy, policy=
=2D>min,
>  >                                                 CPUFREQ_RELATION_H);
>  >                         }
>  >                         __cpufreq_remove_dev(sys_dev);
>=20
> This is the path taken when we call suspend.
> To be honest, I doubt that reducing the speed has any benefit at all,
> as we're about to put the CPU to sleep anyway.
>=20
> (btw, in future sending questions to cpufreq@lists.linux.org.uk is a bett=
er
>  idea. The subsystem is sufficiently complex that at times, others can
>  answer questions better than I can, especially with the various
>  implementations all being subtley different).
>=20
> Thanks,
>=20
> 	Dave
>=20
Okay, removing the __cpufreq_driver_target call would solve would obviously=
 solve that problem (which btw also exists on Core2, as I tested a couple o=
f minutes ago). Is it planned to be changed=20
in the near future?

Thanks,
Peter


=2D-=20
AMD Saxony Limited Liability Company & Co. KG
Operating System Research Center
Wilschdorfer Landstr. 101, 01109 Dresden, Germany
Register Court Dresden: HRA 4896
General Partner authorized to represent:
AMD Saxony LLC (Wilmington, Delaware, US)
General Manager of AMD Saxony LLC: Dr. Hans-R. Deppe, Thomas McCoy

--nextPart2668689.myGYOuVNfE
Content-Type: application/pgp-signature;
 name=signature.asc
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBGXFK238rmLONd5dwRAuJlAJ4pKN6eM50RpzxVgJfUj8B825cKaQCgyBUd
VjdhMKADczLKoGbzw1g3gkc=
=stNH
-----END PGP SIGNATURE-----

--nextPart2668689.myGYOuVNfE--




--===============1022454369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1022454369==--



