From: "Stephen J. Gowdy" <Stephen.Gowdy@cern.ch>
Subject: Re: Intel Clovertown vs. frequency scaling
Date: Thu, 11 Oct 2007 17:32:48 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0710111731370.6509@antonia.sgowdy.org>
References: <20071011150633.GL6058@cern.ch> <470E404C.10304@redhat.com>
Mime-Version: 1.0
Content-Type: MULTIPART/Mixed; BOUNDARY="===============0102352507=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <470E404C.10304@redhat.com>
Content-ID: <Pine.LNX.4.64.0710111731371.6509@antonia.sgowdy.org>
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
To: Jarod Wilson <jwilson@redhat.com>
Cc: cpufreq@lists.linux.org.uk

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--===============0102352507==
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

I have a quad-core version that uses the centrino one (E5345). However, it 
only has two available speeds, 2GHz and 2.33GHz. Do you get more options?

[pcphuat27] ~ > cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver
centrino
[pcphuat27] ~ > cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
2333000 2000000


--
  /------------------------------------+-------------------------\
|Stephen J. Gowdy, SLAC               | CERN     Office: 32-2-A22|
|http://www.slac.stanford.edu/~gowdy/ | CH-1211 Geneva 23        |
|                                     | Switzerland              |
|EMail: gowdy@slac.stanford.edu       | Tel: +41 22 767 5840     |
  \------------------------------------+-------------------------/
--===============0102352507==
Content-Type: MULTIPART/SIGNED; MICALG=pgp-sha1;
	PROTOCOL="application/pgp-signature";
	BOUNDARY=------------enigA9B93BEC73D87BF8EB5652F0
Content-ID: <Pine.LNX.4.64.0710111731372.6509@antonia.sgowdy.org>
Content-Description: 

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--------------enigA9B93BEC73D87BF8EB5652F0
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <Pine.LNX.4.64.0710111731373.6509@antonia.sgowdy.org>

Andras.Horvath@cern.ch wrote:

> I have a number of Clovertown (intel quadcore) machines and, even with

> the latest 2.6.23, it seems to me that frequency scaling is not

> supported (e.g. the /sys/devices/system/cpu/cpu0/cpufreq/* stuff does

> not appear even though CONFIG_X86_SPEEDSTEP_CENTRINO is "y").



I believe you want acpi-cpufreq, not speedstep-centrino. Works just fine

for my quad-core systems, anyhow. If that doesn't work, its probably the

bios at fault.



--=20

Jarod Wilson

jwilson@redhat.com






--------------enigA9B93BEC73D87BF8EB5652F0
Content-Type: APPLICATION/PGP-SIGNATURE; NAME=signature.asc
Content-ID: <Pine.LNX.4.64.0710111731374.6509@antonia.sgowdy.org>
Content-Description: OpenPGP digital signature
Content-Disposition: ATTACHMENT; FILENAME=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHDkBRtO+bni+75QMRAnk9AJ9fgWsSy35XH2VN/kVFpbZPkfqUdwCeIl9p
cdAj3cGwHumJp0SKilOy/ao=
=V8pU
-----END PGP SIGNATURE-----

--------------enigA9B93BEC73D87BF8EB5652F0--

--===============0102352507==
Content-Type: TEXT/PLAIN; CHARSET=us-ascii
Content-ID: <Pine.LNX.4.64.0710111731375.6509@antonia.sgowdy.org>
Content-Description: 
Content-Disposition: INLINE

_______________________________________________

Cpufreq mailing list

Cpufreq@lists.linux.org.uk

http://lists.linux.org.uk/mailman/listinfo/cpufreq


--===============0102352507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0102352507==--

