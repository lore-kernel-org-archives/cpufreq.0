From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: powernow-k8: missing p-state
Date: Mon, 8 Aug 2005 09:21:29 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84301CFC349@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Brendt Wohlberg <bwohlberg@gmail.com>, cpufreq@lists.linux.org.uk

> I have an AMD 64 3200+ processor with 4 p-states (according=20
> to AMD specs), with frequencies of 1.0, 1.8, 2.0, and 2.2=20
> GHz. On boot (Fedora Core 4, kernel 2.6.12), however, the=20
> powernow-k8 module only recognises the highest three frequencies
>=20
>   powernow-k8: Found 1 AMD Athlon 64 / Opteron processors=20
> (version 1.40.2)
>   powernow-k8:    0 : fid 0xe (2200 MHz), vid 0x2 (1500 mV)
>   powernow-k8:    1 : fid 0xc (2000 MHz), vid 0x6 (1400 mV)
>   powernow-k8:    2 : fid 0xa (1800 MHz), vid 0xa (1300 mV)
>=20
> My guess is that this problem is due to a buggy BIOS. Are=20
> there any existing=20
> solutions to this problem? Given the apparent number of AMD=20
> 64 motherboards=20
> with similar problems, surely it would be useful to be able=20
> to specify the p-state table as a configuration option for=20
> the powernow-k8 module?

It sure would be, and you're welcome to write it.  AMD
corporate policy does not let me distribute the driver=20
with that option, nor support people who attempt to=20
write that option.

If you look around on the web, you should be able to find
some attempts that other people have made to add that
option.

In the meantime, what motherboard and BIOS are you using?
I can sometimes get BIOS writers to update their BIOSes
if there's a known problem.

-Mark Langsdorf
AMD, Inc.
