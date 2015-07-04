From: James Phillips <kernel.org@phillipsjk.ca>
Subject: Clock speed Display bug when underclocked.
Date: Sat, 4 Jul 2015 10:40:27 -0600
Message-ID: <20150704164027.GE14248@workhorse.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: cpufreq@vger.kernel.org


--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I have my old pentium D under-clocked to 2.25GHz. However,
both /proc/cpuinfo and cpufreq-info report the clock speed
to be 2800MHz.

I have confirmed by power measurement that the clockspeed is=20
indeed 2.25GHz=B1250Mhz.
While under clocking, I made a power consumption table. At
full load, the power draw is 240W, wich was previously observed
at 2.0 and 2.5GHz (temperature dependant)=20

james@chester:~/Public$ uname -a
Linux chester 3.16.0-4-amd64 #1 SMP Debian 3.16.7-ckt11-1 (2015-05-24) x86_=
64 GNU/Linux

root@chester:~# cpufreq-info
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 10.0 us.
  hardware limits: 2.80 GHz - 3.00 GHz
  available frequency steps: 3.00 GHz, 2.80 GHz
  available cpufreq governors: userspace, conservative, powersave, ondemand=
, performance
  current policy: frequency should be within 2.80 GHz and 3.00 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 2.80 GHz (asserted by call to hardware).
  cpufreq stats: 3.00 GHz:5.73%, 2.80 GHz:94.27%  (76)
analyzing CPU 1:
  driver: acpi-cpufreq
  CPUs which run at the same hardware frequency: 1
  CPUs which need to have their frequency coordinated by software: 1
  maximum transition latency: 10.0 us.
  hardware limits: 2.80 GHz - 3.00 GHz
  available frequency steps: 3.00 GHz, 2.80 GHz
  available cpufreq governors: userspace, conservative, powersave, ondemand=
, performance
  current policy: frequency should be within 2.80 GHz and 3.00 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 2.80 GHz (asserted by call to hardware).
  cpufreq stats: 3.00 GHz:5.55%, 2.80 GHz:94.45%  (60)

Regards,

James Phillips

--=20
OpenPGP Public Key: http://phillipsjk.ca/OpenPGP0814.asc

--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJVmAx7AAoJELPegf97nVFgd1cH/RfaMY4i5rNNeetck/otxkvE
XRLpMYsaw9YJN7zHCAMYgTYbwEKBirpgyayr2ZeXr/ggDHSnpmqOWa63I3JXIJzH
gUTC+0LTlji32gilfA3off8SeX1Y11HssjwVA5zdNhrgh8AR74J/TJ+2JOfrmyC1
2zQGuueyVl24boBlnh1KMju4+3fod7EiYKagOgI2z8rwwo21LG50M/8nmHKrOhpq
UDiErOM6yjDBW2ONMsDOOjat9KXSJGcfMy2MJZZ62w+QqZmtIvDFj02vBJ1ZOaEo
xdMqVKNkGBeCvCy/v9lJhdANMCG8EL+uFPLx7I2FfoZNxDEQv49QbfyCBE2TV/U=
=K8sn
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--
